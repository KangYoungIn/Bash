#!/bin/bash
##파일 복사 시 현재 날짜를 넣어서 간단히 복사
#
echo -n "복사 대상 파일의 이름을 입력하세요 :"
read TARGETFILE
#
echo -n "복사 대상 파일이 복사될 경로(절대경로)를 입력하세요 :"
read TARGETDIR
#
NEWFILE="${TARGETFILE}.$(date '+%Y%m%d')"
#
##동일파일명 + YYYYMMDD이 이미 있으면 시,분까지 입력
if [ -e $NEWFILE ]
then
	NEWFILE="${TARGETFILE}.$(date '+%Y%m%d%H%M')"
fi
#
cp -v "$TARGETFILE" "$TARGETDIR/$NEWFILE"