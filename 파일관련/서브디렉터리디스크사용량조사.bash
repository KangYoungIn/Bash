#!/bin/bash
#
####서브디렉터리들의 디스크 사용량 조사
#
##대상 디렉터리 입력받기
echo -n "조사 할 대상 디렉터리의 절대경로를 입력하세요 :"
read targetdir
#
##대상 디렉터리의 서브 디렉터리 사용량 조사 및 정렬
du -sm ${targetdir}/*/ | sort -rn