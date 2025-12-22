#!/bin/bash

# 현재 구동 중인 애플리케이션 pid 확인
CURRENT_PID=$(pgrep -f .jar)

if [ -z $CURRENT_PID ]; then
  echo "현재 구동 중인 애플리케이션이 없으므로 종료하지 않습니다."
else
  echo "현재 구동 중인 애플리케이션 종료 (PID: $CURRENT_PID)"
  kill -15 $CURRENT_PID
  sleep 5
fi