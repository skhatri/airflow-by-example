kubectl get pods -l kubernetes_pod_operator --no-headers|awk '/Error/ || /Completed/'|awk '{print $1}'|xargs kubectl delete po
kubectl get pods -l spark-role --no-headers|awk '/Error/ || /Completed/'|awk '{print $1}'|xargs kubectl delete po

