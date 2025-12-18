#!/bin/bash
cd /home/ec2-user/backend
nohup java -jar *.jar > app.log 2>&1 &
