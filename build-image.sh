#!/usr/bin/env bash

set -e

: "${version:=${1:-2.0}}"
echo building $version
docker-compose build 
docker tag airflow_webserver:latest localhost:5000/airflow_webserver:${version}
docker push localhost:5000/airflow_webserver:${version}


docker build --no-cache -t airflow_dags:latest -f Dockerfile_dags . && docker tag airflow_dags:latest localhost:5000/airflow_dags:${version} && \
docker push localhost:5000/airflow_dags:${version}

IMAGE_TAG="${version}"

cat kubernetes/airflow-template.yaml|sed s/__IMAGE_NAME__/"192.168.64.1:5000\/airflow_dags"/g > kubernetes/.tmp.yaml
cat kubernetes/.tmp.yaml|sed s/__IMAGE_TAG__/"${IMAGE_TAG}"/g > kubernetes/airflow.yaml
rm kubernetes/.tmp.yaml


