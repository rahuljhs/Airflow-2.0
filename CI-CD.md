# CI-CD with Airflow 2.0 on AWS

## S3FS
Reference: https://github.com/s3fs-fuse/s3fs-fuse

STEP 1: Install s3fs on EC2
```   
sudo amazon-linux-extras install epel
sudo yum install s3fs-fuse
```

STEP 2: Update fuse.conf                                # Note: This is done so docker can use mount folder
```   
cd /etc
nano /etc/fuse.conf # Update file content to look like below

# mount_max = 1000
user_allow_other
```

STEP 3: Restart EC2

STEP 4: Start Docker Services
```   
sudo service docker start
sudo usermod -a -G docker ec2-user
```

STEP 5: Create folder on S3 using AWS Dashboard         # Note: This will not work if folder is created in CLI

STEP 6: Create folder on EC2 for mounting
``` 
mkdir airflow/dags
```

STEP 7: Mount Bucket Folder to Folder on EC2            # Note: Inside Airflow Folder
```
s3fs <Bucket>:/<folder> ./dags -o umask=0000 -o iam_role="ec2 role for s3 access" -o allow_other
```

STEP 8: STEP Jenkins Job with following POST Build script
```
aws s3 sync --exclude '.git/*' . s3://<bucket>/<folder>/ --grants full=id=<AWS Account Canonical ID>,id=<AWS Account Canonical ID>
```

## Additional FAQ's

Umount folder mapping to S3 on EC2
```  
sudo umount ./<dir>
```
