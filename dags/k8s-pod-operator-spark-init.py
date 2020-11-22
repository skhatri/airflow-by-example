import json
import pathlib

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from kubernetes.client import models as k8s
from airflow.contrib.operators import kubernetes_pod_operator


import datetime

from airflow import models

dag = DAG(
   dag_id="k8s-pod-operator-spark-init",
   start_date=airflow.utils.dates.days_ago(2),
   schedule_interval="@daily",
)


k8s_init_pod_dag_start = BashOperator(
   task_id="start_kube_init_spark_process",
   bash_command="echo trigger execution of bunch of spark containers",
   dag=dag,
)
k8s_init_pod_dag_finish = BashOperator(
   task_id="finish_kube_init_spark_process",
   bash_command="echo end of execution",
   dag=dag,
)
in_cluster=False


data_share_volume = k8s.V1Volume(name='data-shared-dir', empty_dir={})

data_write_secrets_mount= k8s.V1VolumeMount(mount_path="/tmp/out", name="data-shared-dir")
configuring_init_container = k8s.V1Container(
    name='secret-resolver',
    image='ubuntu:latest',
    command=['sh', '-c', 'echo {"user": "user1", "password": "secret"}|tee /tmp/out/hello'],
    volume_mounts=[
            data_write_secrets_mount
    ],
)

data_read_for_secrets_mount=k8s.V1VolumeMount(name='data-shared-dir', mount_path='/tmp/secrets')

k8s_pod_with_init = kubernetes_pod_operator.KubernetesPodOperator(
    task_id='k8s-pod-with-init',
    name='k8s-pod',
    cmds=['sh', '-c', 'cat /tmp/secrets/hello'],
    namespace='default',
    image='ubuntu:latest',
    in_cluster=in_cluster,
    config_file='/tmp/k8s/minikube/config',
    init_containers=[configuring_init_container],
    volumes=[data_share_volume],
    volume_mounts=[
        data_read_for_secrets_mount
    ]    
)



k8s_init_pod_dag_start >> k8s_pod_with_init >> k8s_init_pod_dag_finish

