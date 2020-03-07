#!/bin/bash
###숫자 비교

echo "비교를 위한 첫번째 숫자를 입력하세요 :"
read num1
echo "비교를 위한 두번째 숫자를 입력하세요 :"
read num2
echo "입력한 첫번재 숫자 : $num1 / 입력한 두번째 숫자 : $num2"

if [ $num1 -eq $num2 ]
then
	echo "첫번째 숫자 $num1과 두번째 숫자 $num2는 같습니다."
elif [ $num1 -ge $num2 ]
then
	echo "첫번째 숫자 $num1은 두번째 숫자 $num2와 같거나 큽니다."
elif [ $num1 -gt $num2 ]
#then
#	echo "첫번째 숫자 $num1은 두번째 숫자 $num2보다 큽니다."
elif [ $num1 -le $num2 ]
then
	echo "첫번째 숫자 $num1은 두번째 숫자 $num2와 같거나 작습니다."
elif [ $num1 -lt $num2 ]
#then
#	echo "첫번째 숫자 $num1은 두번째 숫자 $num2보다 작습니다."
#elif [ $num1 -ne $num2 ]
#then
#	echo "첫번째 숫자 $num1은 두번째 숫자 $num2와 같지 않습니다."
fi