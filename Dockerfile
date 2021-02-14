FROM apache/airflow:2.0.0-python3.8
USER root
RUN mkdir -p /opt/app/
COPY entrypoint.sh /opt/app/entrypoint.sh
COPY airflow.cfg /opt/airflow/airflow.cfg
RUN chmod a+x /opt/app/entrypoint.sh && chown -R airflow /opt/app
USER airflow
RUN /usr/local/bin/python -m pip install --upgrade pip && \
    pip3 install "apache-airflow[jdbc]" && \
    pip3 install "apache-airflow[ldap]" && \
    pip3 install "apache-airflow[password]" && \
    pip3 install "apache-airflow[postgres]" && \
    pip3 install "apache-airflow[kubernetes]" && \
    pip3 install oauth2client authlib
ENTRYPOINT ["/opt/app/entrypoint.sh"]
