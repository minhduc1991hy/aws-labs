#!/bin/bash
sudo su
yum update -y

yum install golang -y

cd /home/ec2-user/uploads3
go mod init uploads3
go get github.com/kataras/iris/v12@master
go mod tidy
go build
./uploads3