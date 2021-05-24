FROM apache/airflow:2.1.0
USER root
RUN apt-get update \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER airflow
ENV AIRFLOW_EXTRAS="async,amazon,celery,cncf.kubernetes,docker,dask,elasticsearch,ftp,grpc,hashicorp,http,ldap,google,microsoft.azure,mysql,oracle,postgres,redis,sendgrid,sftp,slack,snowflake,ssh,statsd,virtualenv"
ENV AIRFLOW_PIP_VERSION=21.1.1
ENV AIRFLOW_VERSION=2.1.0
ENV PYTHON_VERSION=3.6
ENV CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-master/constraints-${PYTHON_VERSION}.txt"
RUN echo ${CONSTRAINT_URL}
RUN pip install --no-cache-dir --upgrade pip=="${AIRFLOW_PIP_VERSION}"
RUN pip install --no-cache-dir --upgrade "apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"