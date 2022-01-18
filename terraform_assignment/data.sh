#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo service docker start
sudo systemctl enable docker
sudo docker pull nginx
sudo docker run -d -p 80:80 nginx