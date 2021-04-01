#!/usr/bin/env bash

set -e

: "${AIRFLOW_HOME:="/opt/airflow"}"
: "${AIRFLOW__CORE__EXECUTOR:=${EXECUTOR:-Sequential}Executor}"
if [[ ! -f /opt/airflow/airflow.cfg ]];
then
  cp -r /opt/airflow-template/* /opt/airflow
fi;

case "$1" in
  embedded)
    airflow db init
    airflow users create -u admin -p admin -r Admin -e admin@gmail.com -f Admin -l User
    airflow scheduler &
    exec airflow webserver
    ;;
  webserver|worker|scheduler)
    exec airflow "$@"
    ;;
  version)
    exec airflow "$@"
   ;;
   *)
    exec "$@"
   ;;
esac

