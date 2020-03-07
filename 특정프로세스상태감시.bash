#!/bin/bash
###특정 프로세스 상태 감시
#
##감시대상 입력받음
echo -n "감시할 프로세스 실행 명령어를 입력하세요 :"
read PNAME
#
##대상 명령어 프로세스 수 카운트
COUNT=$(ps ax -o command | grep "$PNAME" | grep -v "^grep" | wc -l)
#
##grep 명령어 출력 결과가 0이면 프로세스 미존재로 판단
if [ "$COUNT" -eq 0 ]
then
	echo "[ERROR] 프로세스 $PNAME을 찾지 못했습니다."
fi
