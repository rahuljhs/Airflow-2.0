FROM apache/airflow:2.1.0-python3.6
USER root
RUN apt-get update \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
ENV AIRFLOW_VERSION=2.1.0
ENV AIRFLOW_EXTRAS="async,amazon,celery,cncf.kubernetes,docker,dask,elasticsearch,ftp,grpc,hashicorp,http,ldap,google,microsoft.azure,mysql,oracle,postgres,redis,sendgrid,sftp,slack,snowflake,ssh,statsd,virtualenv"
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade "apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION}"