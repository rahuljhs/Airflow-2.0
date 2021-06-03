FROM apache/airflow:latest-python3.8
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir --requirement /tmp/requirements.txt