#!/bin/bash
###1년 이상 갱신되지 않은 파일 삭제

echo "1년 이상 갱신되지 않은 파일을 삭제 할 대상 디렉터리의 절대 경로를 입력하세요 :"
read TARGETDIR

find $TARGETDIR -name "*.*" -mtime +364 -print | xargs rm -fv