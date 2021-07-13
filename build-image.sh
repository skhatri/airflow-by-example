#!/usr/bin/env bash

set -e

: "${version:=${1:-2.0}}"
: "${REPO_BASE:=${2:-"localhost:5000/"}}"
: "${PUSH:=${3:-"no"}}"

echo "building ${version}"
echo "repo base ${REPO_BASE}"

docker build --no-cache -t ${REPO_BASE}airflow:latest . -f Dockerfile
docker tag ${REPO_BASE}airflow:latest "${REPO_BASE}airflow:${version}"

if [[ "${PUSH}" == "yes" ]];
then
  docker push ${REPO_BASE}airflow:${version}
  docker push ${REPO_BASE}airflow:latest
else
  echo you may perform "\"docker push ${REPO_BASE}airflow:${version}\"" now
fi;

