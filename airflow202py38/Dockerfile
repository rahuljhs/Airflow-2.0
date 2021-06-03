FROM apache/airflow:2.0.2-python3.8
ENV AIRFLOW_VERSION=2.0.2
ENV AIRFLOW_EXTRAS="async,amazon,celery,cncf.kubernetes,docker,dask,elasticsearch,ftp,grpc,hashicorp,http,ldap,google,microsoft.azure,mysql,oracle,postgres,redis,sendgrid,sftp,slack,snowflake,ssh,statsd,virtualenv"
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade "apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION}"