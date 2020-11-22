import json
import pathlib

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator

dag = DAG(
   dag_id="process_etl_linear",
   start_date=airflow.utils.dates.days_ago(7),
   schedule_interval="@daily",
)

upload_input_to_s3 = BashOperator(
   task_id="upload_input_to_s3",
   bash_command="echo upload to s3",
   dag=dag,
)

def _convert_to_parquet():
    print("convert raw to parquet")

convert_to_parquet = PythonOperator(
    task_id="convert_to_parquet",
    python_callable=_convert_to_parquet,
    dag=dag,
)


def _load_into_database():
    print("save data to a table")

load_into_database = PythonOperator(
    task_id="load_into_database",
    python_callable=_load_into_database,
    dag=dag,
)


summary = BashOperator(
    task_id="summary",
    bash_command='echo "Finished processing input file"',
    dag=dag,
)


upload_input_to_s3 >> convert_to_parquet >> load_into_database >> summary


