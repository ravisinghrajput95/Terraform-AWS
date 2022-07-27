#! /bin/bash

#Script to bootstrap the webserver
sudo yum update -y
sudo yum install httpd -y
sudo systemctl  enable httpd
sudo systemctl start httpd
sudo echo '<h1> Webserver provisioned using Terraform V1.0 </h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Infrastructure as Code using Terraform </h1> <p>Terraform</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
sudo systemctl restart httpd