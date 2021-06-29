#!/usr/bin/env bash

set -e

: "${version:=${1:-2.0}}"
: "${REPO_BASE:=${2:-"localhost:5000/"}}"
: "${INNER_REPO_BASE:=${3:-"${REPO_BASE}"}}"
echo "building ${version}"
echo "repo base ${REPO_BASE}"

docker build --no-cache -t airflow:latest . -f Dockerfile
docker tag airflow:latest "${REPO_BASE}airflow:${version}"

echo you may perform "\"docker push ${REPO_BASE}airflow:${version}\"" now

