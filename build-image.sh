: "${version:=${1:-2.0}}"
echo building $version
docker-compose build && docker tag airflow_webserver:latest localhost:5000/airflow_webserver:${version} && \
docker push localhost:5000/airflow_webserver:${version}


docker build --no-cache -t airflow_dags:latest -f Dockerfile_dags . && docker tag airflow_dags:latest localhost:5000/airflow_dags:2.0.${version} && \
docker push localhost:5000/airflow_dags:${version}

