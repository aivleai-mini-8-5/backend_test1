#!/bin/bash

# 배포된 경로 (appspec.yml에서 지정한 경로)
PROJECT_ROOT="/home/ec2-user/app"
cd $PROJECT_ROOT

# 로그 파일
LOG_FILE="$PROJECT_ROOT/application.log"

# jar 파일 찾기 (경로가 납작해져서 바로 찾으면 됨)
JAR_FILE=$(ls *.jar | grep -v "plain" | head -n 1)

echo "애플리케이션 실행: $JAR_FILE"

# 실행 (로그 남기며 백그라운드 실행)
nohup java -jar $JAR_FILE > $LOG_FILE 2>&1 &

echo "배포 완료."