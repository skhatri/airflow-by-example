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
   dag_id="kube-pod-operator-cluster",
   start_date=airflow.utils.dates.days_ago(2),
   schedule_interval="@daily",
)


start_kube_process = BashOperator(
   task_id="start_kube_process",
   bash_command="echo upload to s3",
   dag=dag,
)


in_cluster=True
kubernetes_min_pod = kubernetes_pod_operator.KubernetesPodOperator(
    task_id='pod-ex-minimum',
    name='pod-ex-minimum',
    cmds=['echo'],
    namespace='default',
    image='ubuntu:latest',
    in_cluster=in_cluster,
    executor_config={"LocalExecutor": {}}
    )


run_another_pod = kubernetes_pod_operator.KubernetesPodOperator(
    task_id='run-another-pod',
    name='run-another-pod',
    cmds=['echo'],
    namespace='default',
    image='ubuntu:latest',
    in_cluster=in_cluster,
    executor_config={"LocalExecutor": {}}
    )


start_kube_process >> kubernetes_min_pod >> run_another_pod

