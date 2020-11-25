FROM apache/airflow:2.0.0b2-python3.8
USER root
RUN mkdir -p /opt/app/
COPY entrypoint.sh /opt/app/entrypoint.sh
COPY airflow.cfg /opt/airflow/airflow.cfg
RUN chmod a+x /opt/app/entrypoint.sh && chown -R airflow /opt/app
USER airflow
RUN pip3 install "apache-airflow[jdbc]" && \
    pip3 install "apache-airflow[ldap]" && \
    pip3 install "apache-airflow[password]" && \
    pip3 install "apache-airflow[postgres]" && \
    pip3 install "apache-airflow[kubernetes]"
ENTRYPOINT ["/opt/app/entrypoint.sh"]
