## Airflow-2.0


# STEP 1: Install Docker on EC2
Code:
      sudo yum update -y
      sudo amazon-linux-extras install docker
      sudo service docker start
      sudo usermod -a -G docker ec2-user
REBOOT EC2
TEST: 
      docker info                                                                               # Important this should run without sudo

Refer: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

# STEP 2: Install Docker Compose
Code:
      sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      sudo chmod +x /usr/local/bin/docker-compose
TEST:
      docker-compose --version                                                                  # Important this should run without sudo (restart EC2 if required)

Refer: https://docs.docker.com/compose/install/

# STEP 3: Install Airflow 2.0
Code:
      mkdir airflow
      cd airflow
      curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.0.2/docker-compose.yaml'
      mkdir logs plugins dags                                                                   #Inside Airflow Folder
      echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
      docker-compose up airflow-init
      docker-compose up -d
      
TEST: EC2_DNS:8080 username/password:airflow/airflow
