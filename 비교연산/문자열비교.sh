#!/bin/bash
###문자열비교

echo "비교할 첫번째 문자를 입력하세요 :"
read str1
echo "비교할 두번째 문자를 입력하세요 :"
read str2

if [ $str1 = $str2 ]
then
	echo "첫번째 문자열과 두번째 문자열이 같습니다."
elif [ $str1 != $str2 ]
then
	echo "첫번째 문자열과 두번째 문자열이 다릅니다."
elif [ $str1 < $str2 ]
then
	echo "첫번째 문자열이 두번째 문자열보다 작습니다."
elif [ $str1 > $str2 ]
then
	echo "첫번재 문자열이 두번째 문자열보다 큽니다."
elif [ -n $str1 ]
then
	echo "첫번재 문자열의 길이가 0보다 큽니다."
elif [ -z $str1 ]
then
	echo "첫번째 문자열의 길이가 0입니다."
fi