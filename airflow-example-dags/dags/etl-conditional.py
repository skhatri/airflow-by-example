import json
import pathlib

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.python_operator import BranchPythonOperator

dag = DAG(
   dag_id="etl_conditional",
   start_date=airflow.utils.dates.days_ago(15),
   schedule_interval="@daily",
)

ec_upload_input_to_s3 = BashOperator(
   task_id="ec_upload_input_to_s3",
   bash_command="echo upload to s3",
   dag=dag,
)

def _ec_convert_to_parquet():
    print("convert raw to parquet")

ec_convert_to_parquet = PythonOperator(
    task_id="ec_convert_to_parquet",
    python_callable=_ec_convert_to_parquet,
    dag=dag,
)


def _ec_load_into_database():
    print("save data to a table")

ec_load_into_database = PythonOperator(
    task_id="ec_load_into_database",
    python_callable=_ec_load_into_database,
    dag=dag,
)


def _ec_upload_output_to_s3():
    print("upload data to s3")

ec_upload_output_to_s3 = PythonOperator(
    task_id="ec_upload_output_to_s3",
    python_callable=_ec_upload_output_to_s3,
    dag=dag,
)

def _choose_save_medium(execution_date):
    if execution_date.day % 2 == 0:
        return "ec_load_into_database"
    return "ec_upload_output_to_s3"


save_output = BranchPythonOperator(
    task_id='save-output-decision',
    provide_context=True,
    python_callable=_choose_save_medium
)

ec_summary = BashOperator(
    task_id="ec-summary",
    bash_command='echo "Finished processing input file"',
    dag=dag,
)


save_output >> [ec_load_into_database, ec_upload_output_to_s3]
ec_upload_input_to_s3 >> ec_convert_to_parquet >> save_output >> ec_summary


