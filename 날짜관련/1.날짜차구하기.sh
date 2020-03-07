#!/bin/bash
###date 명령어로 두 날짜 비교 후 날짜 차이 구하기

#비교할 두 날짜 변수 정의
echo "비교할 날짜를 입력하세요."
echo "첫번째 날짜 [YYYY/MM/DD HH/mm/SS]: "
read day1
echo "두번째 날짜 [YYYY/MM/DD HH/mm/SS]: "
read day2

#정의 된 날자값을 에포크(epoch)초로 변환
day1_epoch=$(date -d "$day1" '+%s')
day2_epoch=$(date -d "$day2" '+%s')

#변환 한 epoch 초의 차이 비교
if [ day2_epoch -ge day1_epoch ]
then
	dif_epoch=`expr \( $day2_epoch - $day1_epoch \) / 86400`
	echo "두 날짜의 일수차 : $dif_epoch일"
else
	dif_epoch=`expr \( $day1_epoch - $day2_epoch \) / 86400`
	echo "두 날짜의 일수차 : $dif_epoch일"
fi
