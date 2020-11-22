### Running

```
docker-compose build

docker-compose up -d
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
