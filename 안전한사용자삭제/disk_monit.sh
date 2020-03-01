#!/bin/bash
#
#디스크 사용량 감시
echo "확인할 경로를 입력하세요 :"
read -n MONITDIR
echo "$MONITDIR를 기준으로 모니터링을 진행합니다."
#
CHECK_DIRECTORIES=$MONITDIR
#
#스크립트 시작
#
DATE=$(date '+%m%d%y')
#
exec > disk_space_$DATE.rpt
#
echo "Top 10 Disk Space Usage"
echo "for $CHECK_DIRECTORIES Directories"
#
for DIR_CHECK in $CHECK_DIRECTORIES
do
	echo ""
	echo "The $DIR_CHECK Directory:"
#
#Top 10 리스트 생성
du -S $DIR_CHECK 2>/dev/null | sort -rn | sed '{11,$D; =}' | sed 'N; s/\n/ /' | gwak '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
#
done
#
exit