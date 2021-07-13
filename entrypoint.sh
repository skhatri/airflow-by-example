#!/usr/bin/env bash

set -e

: "${AIRFLOW_HOME:="/opt/airflow"}"
: "${AIRFLOW__CORE__EXECUTOR:=${EXECUTOR:-Sequential}Executor}"
if [[ ! -f /opt/airflow/airflow.cfg ]];
then
  cp -r /opt/airflow-template/* /opt/airflow
fi;

echo "Airflow Executor: ${AIRFLOW__CORE__EXECUTOR}"



case "$1" in
  embedded)
    airflow db init
    airflow users create -u admin -p admin -r Admin -e admin@gmail.com -f Admin -l User
    airflow scheduler &
    exec airflow webserver
    ;;
  init-scheduler)
    airflow db init
    airflow users create -u admin -p admin -r Admin -e admin@gmail.com -f Admin -l User
    airflow scheduler
    ;;
  webserver|worker|scheduler)
    exec airflow "$@"
    ;;
  version)
    exec airflow "$@"
   ;;
   *)
    echo "Command $@"
    exec "$@"
   ;;
esac

