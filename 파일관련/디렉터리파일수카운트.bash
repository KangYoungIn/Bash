#!/bin/bash
#
#####특정 디렉터리의 파일 수와 디렉터리 수를 센다.
#
echo "확인 할 디렉터리의 절대경로를 입력하세요 :"
read targetdir
#
####카운트
filecount=$(find "$targetdir" -maxdepth 1 -type f -print | wc -l)
dircount=$(find "$targetdir" -maxdepth 1 -type d -print | wc -l)
#
dircount=$(expr $dircont - 1)
#
####결과
echo "대상 디렉터리 : $targetdir"
echo "파일 수 : $filecount"
echo "디렉터리 수 : $dircount"