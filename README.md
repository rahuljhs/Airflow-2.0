# Airflow 2.0 on AWS

## Docker
Reference: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

STEP 1: Install Docker on EC2
```   
sudo yum update -y
sudo amazon-linux-extras install docker
```
STEP 2: Reboot EC2 ( Required for Docker permissions to kick in )

STEP 3: Start Docker Services
```   
sudo service docker start
sudo usermod -a -G docker ec2-user
```

STEP 4: Test Docker (This should run without sudo)
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

## Clone Github Repository

STEP 1: Clone this repo
```
git clone <REPO URL>
```

STEP 2: Rename folder name to 'airflow'
```
mv <REPO FOLDER> airflow
```

## Rebuilding Apache Airflow Image

STEP 1: Build Image from Scratch
```
cd airflow
docker build . --tag="<IMAGE NAME>"
```

## Updating Docker Compose

STEP 1: Update RDS Metastore Information
```
cd airflow
vi docker-compose.yaml
Change AIRFLOW__CORE__SQL_ALCHEMY_CONN AIRFLOW__CELERY__RESULT_BACKEND to your RDS
Update the fernet key
Set AIRFLOW__WEBSERVER__ENABLE_PROXY_FIX to true if loadbalancer runs on https:// and 443 port.
Set AIRFLOW__WEBSERVER__BASE_URL to non https url. i.e http:// url
```

## Airflow Setup

STEP 1: Setting up airflow (Note: logs plugins dags folders should be inside "airflow")
```
cd airflow
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
