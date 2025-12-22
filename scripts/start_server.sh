#!/bin/bash

# 1. 자바 설치 확인 및 대기 (최대 5분 대기)
echo "Java 설치 확인 중..."
for i in {1..60}
do
    if command -v java &> /dev/null
    then
        echo "Java 설치 완료 확인됨."
        break
    fi
    echo "Java가 아직 설치되지 않았습니다. 5초 대기... ($i/60)"
    sleep 5
done

# 2. 배포 경로 설정
PROJECT_ROOT="/home/ec2-user/app"
cd $PROJECT_ROOT

# 3. 로그 파일
LOG_FILE="$PROJECT_ROOT/application.log"

# 4. JAR 파일 찾기
JAR_FILE=$(ls *.jar | grep -v "plain" | head -n 1)

if [ -z "$JAR_FILE" ]; then
    echo "ERROR: 실행할 JAR 파일을 찾을 수 없습니다."
    exit 1
fi

echo "애플리케이션 실행: $JAR_FILE"

# 5. 실행 (nohup)
nohup java -jar $JAR_FILE > $LOG_FILE 2>&1 &

echo "배포 완료."