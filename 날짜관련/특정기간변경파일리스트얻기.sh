#!/bin/bash
###특정 기간에 작성, 변경된 파일 리스트 얻기

echo "확인 할 대상 디렉터리의 절대 경로를 입력하세요 :"
read -n TARGETDIR

#4일전부터 2일전사이에 변경된 파일 리스트 추출
#file $TARGETDIR -name "*.*" -mtime -4 -mtime +1 -print

#60일전부터 30일전 사이에 변경된 파일 리스트 추출
file $TARGETDIR -name "*.*" -mtime -60 -mtime +29 -print

#60일전부터 59일전 사이에 변경된 파일 리스트 추출
#file $TARGETDIR -name "*.*: -mtime 60 -print