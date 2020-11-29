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
   dag_id="k8s-pod-operator-cluster-spark",
   start_date=airflow.utils.dates.days_ago(2),
   schedule_interval="@daily",
)


k8s_pod_dag_start = BashOperator(
   task_id="start_kube_spark_cluster_process",
   bash_command="echo trigger execution of bunch of spark containers",
   dag=dag,
)
k8s_pod_dag_finish = BashOperator(
   task_id="finish_kube_spark_process",
   bash_command="echo end of execution",
   dag=dag,
)
in_cluster=True

spark_env_vars=[
    {
        "name": "SPARK_USER",
        "value": "spark_user"
    },
    {
        "name": "HADOOP_USER_NAME",
        "value": "spark_user"
    },
    {
        "name": "HADOOP_PROXY_USER",
        "value": "spark_user"
    },
    {
        "name": "SPARK_LOCAL_DIRS",
        "value": "/tmp/data/spark-workdir"
    },
    {
        "name": "SPARK_CONF_DIR",
        "value": "/opt/spark/conf"
    },
    {
        "name": "SPARK_APPLICATION_ID",
        "value": "spark-406656d05d7f456f81fcde9530ae1d70"
    },
    {
        "name": "SPARK_DRIVER_BIND_ADDRESS",
        "valueFrom": {
            "fieldRef": {
                "apiVersion": "v1",
                "fieldPath": "status.podIP"
            }
        }
    },
    {
        "name": "EOD_DATE",
        "value": "{{ ds }}"
    }
]

k8s_spark_launcher = kubernetes_pod_operator.KubernetesPodOperator(
    task_id='k8s-spark-launcher',
    name='k8s-spark-launcher',
    cmds=['/opt/spark/bin/spark-submit'],
    arguments=[
        '--master',
        'k8s://https://kubernetes.default.svc.cluster.local:443',
        '--deploy-mode',
        'cluster',
        '--name',
        'hello',
        '--class',
        'demo.Count',
        '--conf',
        'spark.executor.instances=2',
        '--conf',
        'spark.kubernetes.executor.request.cores=0.4',
        '--conf',
        'spark.kubernetes.driver.request.cores=0.2',
        '--conf',
        'spark.kubernetes.container.image=skhatri/spark-k8s-hello:1.0.7',
        '--conf',
        'spark.jars.ivy=/tmp/.ivy',
        '--conf',
        'spark.app.name=hello',
        '--conf',
        'spark.kubernetes.authenticate.driver.serviceAccountName=job-trigger-sa',
        '--conf',
        'spark.authenticate=false',
        'local:///tmp/jars/spark-k8s-hello.jar'
    ],
    namespace='default',
    image='skhatri/spark:v3.0.1',
    in_cluster=in_cluster,
    env_vars=spark_env_vars,
    service_account_name='job-trigger-sa'
)


k8s_pod = kubernetes_pod_operator.KubernetesPodOperator(
    task_id='k8s-pod',
    name='k8s-pod',
    cmds=['echo'],
    namespace='default',
    image='ubuntu:latest',
    in_cluster=in_cluster,
)



k8s_pod_dag_start >> k8s_pod >> k8s_spark_launcher >> k8s_pod_dag_finish

