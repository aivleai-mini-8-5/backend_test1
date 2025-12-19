#!/bin/bash

# 배포될 경로 (나중에 EC2의 해당 경로를 사용)
PROJECT_ROOT="/home/ec2-user/backend"
# 'plain'이 포함된 파일은 제외
JAR_FILE=$(ls $PROJECT_ROOT/build/libs/*.jar | grep -v "plain" | head -n 1)

echo "애플리케이션 실행: $JAR_FILE"

# 로그 파일 위치 지정
LOG_FILE="$PROJECT_ROOT/application.log"

# 기존 로그 백업 없이 덮어쓰거나 이어쓰기 (여기선 이어쓰기 >> 사용)
nohup java -jar "$JAR_FILE" >> $LOG_FILE 2>&1 &