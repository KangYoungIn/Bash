#!/bin/bash
###파일 비교

#1. 디렉토리 확인
echo "존재하는지 확인할 디렉터리의 절대경로를 입력하세요 :"
read dir1

if [ -d $dir1 ]
then 
	echo "입력한 디렉터리는 $dir 입니다. 해당 디렉터리는 존재합니다."
	echo "해당 디렉터리로 이동합니다."
	cd $dir
else
	echo "입력한 디렉터리는 $dir이며 해당 디렉터리는 존재하지 않습니다."
fi

#2. 개체(디렉토리, 파일)가 존재하는지 확인
echo "특정 디렉터리와 파일이 존재하는지 확인합니다."
echo "확인할 디렉터리의 절대 경로를 입력하세요 :"
read dir2
echo "확인할 파일명을 입력하세요 :"
read file1

if [ -e $dir2 ]
then
	echo "해당 디렉터리가 존재합니다."
	echo "파일을 확인하겠습니다."
	if [ -e $file1 ]
	then
		echo "파일이 존재합니다."
	else
		echo "파일이 존재하지 않습니다."
	fi
else
	echo "해당 디렉터리가 존재하지 않습니다."
fi