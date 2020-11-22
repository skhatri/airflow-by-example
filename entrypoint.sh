#!/usr/bin/env bash

: "${AIRFLOW_HOME:="/usr/local/airflow"}"
: "${AIRFLOW__CORE__EXECUTOR:=${EXECUTOR:-Sequential}Executor}"

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
esac


