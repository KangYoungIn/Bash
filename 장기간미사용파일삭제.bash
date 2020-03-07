#!/bin/bash
###1년 이상 갱신되지 않은 파일 삭제
#
echo -n "정리할 디렉터리의 절대경로를 입력하세요 :"
read TARGETDIR
#
##갱신일 1년 이상된 파일 목록 확인
find $TARGETDIR -name -mtime +364 -print | xargs ls
#
echo "삭제하시겠습니까?[y/n] : "
read ANSWER
if [ "$ANSWER" == y ]
then
###확인 후 삭제 진행
	find $TARGETDIR -name -mtime +364 -print | xargs -0 rm -fv
else
	exit
fi

