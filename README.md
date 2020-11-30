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
