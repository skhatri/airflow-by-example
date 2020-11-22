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
