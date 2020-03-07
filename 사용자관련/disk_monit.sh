#!/bin/bash
#
#디스크 사용량 감시
echo "디스크 사용량 상위 10 경로를 보고합니다."
echo "확인할 최상위 기준 경로를 지정하세요 [절대경로] :"
read MONITDIR
echo "$MONITDIR를 기준 경로로 지정합니다."
echo "보고서 제작 중..."
#
CHECK_DIRECTORIES=$MONITDIR
#
#스크립트 시작
#
DATE=$(date '+%m%d%y')
#
REPORT="disk_space_$DATE.rpt"
echo "보고서는 $(pwd)/$REPORT로 생성됩니다."
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
du -S $DIR_CHECK 2>/dev/null | sort -rn | sed '{11,$D; =}' | sed 'N; s/\n/ /' | gawk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
#
done
#
exit