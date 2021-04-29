# Airflow 2.0 on AWS

## Docker
Reference: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

STEP 1: Install Docker on EC2
```   
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
```
STEP 2: Reboot EC2 ( Required for Docker permissions to kick in )

STEP 3: Test Docker (This should run without sudo)
```
docker info
```


## Docker Compose
Reference: https://docs.docker.com/compose/install/

STEP 1: Install Docker Compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

STEP 2: Test Docker (This should run without sudo, restart EC2 if required)
```
docker-compose --version 
```

## Airflow Setup

STEP 1: Setting up airflow (Note: logs plugins dags folders should be inside "airflow")
```
mkdir airflow
cd airflow
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.0.2/docker-compose.yaml'
mkdir logs plugins dags                                                                   
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
docker-compose up airflow-init
docker-compose up -d
```   
 
STEP 2: Test Webserver in CLI
```
curl -X GET --user "airflow:airflow" "http://localhost:8080/api/v1/dags"
```

STEP 3: Test Webserver in Browser
```
https://localhost:8080 username/password:airflow/airflow
```
