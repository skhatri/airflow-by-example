## Airflow by Example
This project contains a bunch of Airflow Configurations and DAGs for Kubernetes, Spark based data-pipelines. The examples make use of spark kubernetes master to scale inside a Kubernetes Cluster. The Airflow installation is secured by Keycloak using the OAuth provider integration.

Each example is available in a branch of its own. Here is the list of examples:
|Branch|Description|
|------|-----------|
|1-etl | Basic Airflow run as a docker-compose|
|2-kubernetes-pod-operator|Execute Few tasks against Kubernetes Cluster using KubernetesPodOperator|
|3-kubernetes-pod-operator-spark|Execute Spark tasks against Kubernetes Cluster using KubernetesPodOperator. The tasks can scale using spark master support made available in spark 2.3+|
|4-airflow-on-kubernetes|Run Airflow, Database, Spark all inside Kubernetes Cluster|
|5-airflow-kubernetes-executor|Run Airflow Tasks with Kubernetes Executor|
|6-airflow-oauth|Integrate Airflow with Keycloak as the OAuth provider|

### Running

```
docker-compose build

docker-compose up -d
```

### Using Kubernetes
```
brew install minikube
minikube start --memory=4096 --cpus=2 --driver=hyperkit \
--insecure-registry=192.168.64.1:5000 \
--nodes=1  --nfs-share=$HOME/dev/data/minikube-share --nfs-shares-root=/nfsshares \
--mount=true --mount-string=$HOME/dev/data/minikube-data:/app/data

```
### Using Kubernetes Pod Operator
We are using minikube's client.crt, client.key, ca.crt and config here. Copy them from your local minikube/kubernetes installation into ./kube folder. This will be mapped to /tmp/k8s in airflow docker container.

My ~/.kube/config is transformed like so for usage from inside the docker container

```
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /tmp/k8s/minikube/ca.crt
    server: https://192.168.64.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /tmp/k8s/minikube/client.crt
    client-key: /tmp/k8s/minikube/client.key

```
server: value should be set to your kubernetes master which you can find by using the below command

```
kubectl cluster-info|grep master
```


### Running Spark Submit using Kubernetes Pod Operator

Create service account and grant roles to create/delete pod

```
kubectl apply -f rbac/sa.yaml
kubectl apply -f rbac/rbac.yaml
```

Enable dags/k8s-pod-operator-spark.py

Because we are running from outside the cluster, we are setting in_cluster=False and we still need to upload kube config to airflow docker image. If your airflow is running inside the cluster, simply change in_cluster=True. 

//TODO: check that serviceaccount file exists in a path and deduce in_cluster flag to be passed to Airflow Kubernetes Pod Operator.


Check https://github.com/apache/airflow/blob/master/airflow/providers/cncf/kubernetes/operators/kubernetes_pod.py to see any parameters you might need to configure

### Adding Init Container

Enable dags/k8s-pod-operator-spark-init.py for data passing between init container and container.


### Using API
Enable basic auth for API by setting airflow.cfg
```
auth_backend = airflow.api.auth.backend.basic_auth
```

List Dags

```
curl -u admin -X GET "http://localhost:8080/api/v1/dags?limit=50" -H  "accept: application/json"
```

View a Specific Dag
```
curl -u admin:admin -X GET "http://localhost:8080/api/v1/dags/process_etl_linear"
```

Patch a Dag

```
curl -u admin:admin -H"Content-Type: application/json" -X PATCH "http://localhost:8080/api/v1/dags/process_etl_linear" -d '{
  "is_paused": false
}'
```

Run a Dag

```
curl -u admin:admin -X POST "http://localhost:8080/api/v1/dags/process_etl_linear/dagRuns"  \
-H"Content-Type: application/json" -d '{
  "conf": {},
  "dag_run_id": "2020_11_23_2_21_00",
  "execution_date": "2020-11-22T15:13:15.022Z"  
}'
```


### Running everything inside Kubernetes
Let's create volumes for postgres and airflow
```
kubectl apply -f -<<EOF
apiVersion: v1
kind: PersistentVolume
metadata:
  name: postgres-volume
  labels:
    type: local
spec:
  storageClassName: standard
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/home/docker/data/postgres"
EOF

```

#### Building Local Images for Kubernetes Executor

```
./build-image 9
```

#### Deploy Airflow
```
kubectl apply -f kubernetes/postgres.yaml
kubectl create secret generic airflow-secrets --from-file=GIT_TOKEN=secrets/GIT_TOKEN
kubectl apply -f kubernetes/airflow.yaml
```

#### Running Kubernetes Executor
Kubernetes Executor requires either the dags to be included in the image or dags to be provided via git sync.

The below configuration choose a separate airflow image where dags are included
```
        - name: "AIRFLOW__KUBERNETES__WORKER_CONTAINER_REPOSITORY"
          value: "192.168.64.1:5000/airflow_dags"
        - name: "AIRFLOW__KUBERNETES__WORKER_CONTAINER_TAG"
          value: "2.0.9"
        - name: "AIRFLOW__KUBERNETES__DAGS_IN_IMAGE"
          value: "True"
```

Although, the pods can be deleted immediately after the DAG tasks and can be controlled by

```
        - name: "AIRFLOW__KUBERNETES__DELETE_WORKER_PODS"
          value: "False"
```

If keeping pod around after the task is complete, the following kubectl command can help delete all pods in bulk

```
kubectl delete po -l kubernetes_executor=True
```

### Securing with Keycloak

Import airflow-realm.json as a realm in keycloak. docker-compose.yaml also mounts manager.py whose ```get_oauth_user_info``` has been update in the following way:

```
        else:
            me = self.appbuilder.sm.oauth_remotes[provider].get("userinfo")
            data = me.json()
            log.debug("User info from OAuth Provider: {0}".format(data))
            return {
                "preferred_username": data.get("preferred_username",""),
                "first_name": data.get("given_name", ""),
                "last_name": data.get("family_name", ""),
                "email": data.get("email", ""),
                "name": data.get("name", ""),
                "username": data.get("preferred_username", ""),
                "id": data.get("sub", ""),
                "roles": data.get("roles", [])
            }
```

Note, if using keycloak <= 11.x, roles need to be configured

webserver_config.py is also mounted from outside to have the effective value of

```
from flask_appbuilder.security.manager import AUTH_OAUTH
AUTH_TYPE = AUTH_OAUTH

AUTH_ROLE_ADMIN = 'Admin'

AUTH_ROLE_PUBLIC = 'Public'

AUTH_USER_REGISTRATION = True

#Do not disable this in production
OIDC_COOKIE_SECURE = False

OAUTH_PROVIDERS = [
 {
   'name': 'airflow-client',
   'icon': 'fa-key',
   'token_key': 'access_token', 
   'remote_app': {
     'api_base_url': 'http://keycloak:8080/auth/realms/airflow/protocol/openid-connect/',
     'client_kwargs': {
       'scope': 'default'
     },
     'request_token_url': None,
     'access_token_url': 'http://keycloak:8080/auth/realms/airflow/protocol/openid-connect/token',
     'authorize_url': 'http://keycloak:8080/auth/realms/airflow/protocol/openid-connect/auth',
     'client_id': 'airflow-client',
     'client_secret': '9e661802-3356-44f3-8960-1dc890abd2bc'
    }
  }
]

```

keycloak's airflow realm can be found in airflow-realm.json

#### Testing OAuth Integration
```
docker-compose up -d
```

update /etc/hosts with the following entry
```
127.0.0.1   airflow keycloak
```

#### Import realm data

```
docker exec -it airflow_keycloak_1 bash


#run the following to import keycloak data

export KEYCLOAK_HOME=/opt/jboss/keycloak
export PATH=$PATH:$KEYCLOAK_HOME/bin

kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password admin

kcadm.sh create realms -f /tmp/realms/airflow-realm-data.json
kcadm.sh create client-scopes -r airflow -f /tmp/realms/client-scopes/scope1.json
kcadm.sh create clients -r airflow -f /tmp/realms/clients/single-client.json

kcadm.sh create roles -r airflow -f /tmp/realms/roles/role1.json
kcadm.sh create roles -r airflow -f /tmp/realms/roles/role2.json
kcadm.sh create roles -r airflow -f /tmp/realms/roles/role3.json
kcadm.sh create roles -r airflow -f /tmp/realms/roles/role4.json

kcadm.sh create users -r airflow -f /tmp/realms/users/user2.json
user_id=$(kcadm.sh get users -r airflow|grep airflow -C 3|grep "id"|awk -F" " '{print $3}'|sed s/,//g|sed s/\"//g)
kcadm.sh update users/${user_id}/reset-password -r airflow -s type=password -s value=airflow -s temporary=false -n


role_id=$(kcadm.sh get roles -r airflow|grep Admin -C 2|grep "id"|awk -F" " '{print $3}'|sed s/,//g|sed s/\"//g)
sed s/__ID__/${role_id}/ /tmp/realms/client-scopes/mapping_template.json|tee /tmp/realms/client-scopes/mappings.json
kcadm.sh create client-scopes/025074e3-3874-4263-b026-489587d3417f/scope-mappings/realm -r airflow -f /tmp/realms/client-scopes/mappings.json
kcadm.sh create users/${user_id}/role-mappings/realm -r airflow -f /tmp/realms/client-scopes/mappings.json

```

#### Verification

```

Verify that Admin, Public, User are effective roles in the keycloak Default Client Scope 
http://localhost:8080/auth/admin/master/console/#/realms/airflow/client-scopes/025074e3-3874-4263-b026-489587d3417f/scope-mappings

Verify that User Airflow is assigned Admin,Public,User role
http://localhost:8080/auth/admin/master/console/#/realms/airflow/users/9e41a8d4-ea41-471e-b194-018465d3df66/role-mappings

```

Test your OAuth connectivity using:
open http://airflow:8280/



#### Export Realm Data
```
docker exec -it airflow_keycloak_1 bash


#run the following to export keycloak data

export KEYCLOAK_HOME=/opt/jboss/keycloak
export PATH=$PATH:$KEYCLOAK_HOME/bin

kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user admin --password admin


kcadm.sh get realms/airflow > /tmp/realms/airflow-realm-data.json
kcadm.sh get clients -r airflow > /tmp/realms/airflow-clients.json
kcadm.sh get roles -r airflow > /tmp/realms/airflow-roles.json
kcadm.sh get users -r airflow > /tmp/realms/airflow-users.json
kcadm.sh get users -r airflow > /tmp/realms/airflow-users.json
kcadm.sh get serverinfo -r airflow > /tmp/realms/airflow-server-info.json
kcadm.sh get client-scopes -r airflow > /tmp/realms/airflow-client-scopes.json 

```

#### Export Airflow and Realm Data from DB

```
docker exec -it airflow_postgres_1 bash
#run the following inside the container

cd /tmp/data
pg_dump -Upostgres -d keycloak > keycloak.pgsql
pg_dump -Upostgres -d airflow > airflow.pgsql

```
This will be stored in sql/data folder of your project.

#### Import Airflow and Realm Data to DB
```
docker exec -it airflow_postgres_1 bash
cd /tmp/data
psql -Upostgres keycloak < keycloak.pgsql
psql -Upostgres airflow < airflow.pgsql 
```
