#!/bin/bash
#사용자가 암호를 입력할 때 입력된 문자열을 화면에 표시하지 않게 한다.
#
username=user
hostname=localhost
#
echo -n "Password :"
# 에코백 OFF
stty -echo
read password
# 에코백 ON
stty echo
#
