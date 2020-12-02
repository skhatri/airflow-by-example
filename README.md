## Airflow by Example
This project contains a bunch of Airflow Configurations and DAGs for Kubernetes, Spark based data-pipelines. The examples make use of spark kubernetes master to scale inside a Kubernetes Cluster. The Airflow installation is secured by Keycloak using the OAuth provider integration.

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
cp realms/airflow-realm.json realms/import.json

docker exec -it airflow_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh \
  -Djboss.socket.binding.port-offset=100 \
  -Dkeycloak.migration.action=import \
  -Dkeycloak.migration.provider=singleFile \
  -Dkeycloak.migration.strategy=OVERWRITE_EXISTING \
  -Dkeycloak.migration.file=/tmp/realms/import.json

```

Test your OAuth connectivity using:
open http://airflow:8280/



#### Export Realm Data
```
docker exec -it airflow_keycloak_1 /opt/jboss/keycloak/bin/standalone.sh \
  -Djboss.socket.binding.port-offset=100 \
  -Dkeycloak.migration.action=export \
  -Dkeycloak.migration.realm=airflow \
  -Dkeycloak.migration.provider=singleFile \
  -Dkeycloak.migration.file=/tmp/realms/export.json

cp realms/export.json realms/airflow-realm.json
```
