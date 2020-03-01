#!/bin/bash
#
#사용자 삭제 시 필수 단계 자동화
#
#get_answer 함수 선언
function get_answer {
	unset ANSWER #앞전에 받은 ANSWER 변수 초기화
    #
	ASK_COUNT=0 
	while [ -z "$ANSWER" ]
	do
		ASK_COUNT=$[ $ASK_COUNT + 1 ] #질의를 한번 더 수행하면 ASK_COUNT 증가
		#첫 번째 질문 시간이 초과했을 때 질문에 대답할 기회를 더 준다
		case $ASK_COUNT in
			2)
				echo
				echo "Please answer the question."
				echo
			;;
			3)
				echo
				echo "One last try...please answer the question."
				echo
			;;
			4)
				echo
				echo "Since you refuse to answer the question..."
				echo "exiting program."
				#
				exit
			;;
		esac
		#
		echo
		#
		if [ -n "$LINE2" ]
		then
			echo $LINE1
			echo -e $LINE2" \c"
		else
			echo -e $LINE1" \c"
		fi
		#
		read -t 60 ANSWER #질의는 60초마다 수행
	done
	#
	unset LINE1
	unset LINE2
} #get_answer 함수 끝
######################################################################
#process_answer 함수 선언
function process_answer {
	case $ANSWER in y|Y|YES|yes|Yes|yEs|yeS|YEs|yES )
	;;
	*)
			echo
			echo $EXIT_LINE1
			echo $EXIT_LINE2
			echo
			exit
	;;
	esac
	unset EXIT_LINE1
	unset EXIT_LINE2
} #process_answer 함수 끝
######################################################################
######################################################################
#스크립트 시작
echo "Step #1 - 삭제하기 위한 사용자명 얻기"
echo
LINE1="Please enter the username of the user"
LINE2="account you wish to delete from system:"
get_answer #함수 호출
USER_ACCOUNT=$ANSWER
#
#삭제하기 위한 사용자명 재확인
#
LINE1="Is $USER_ACCOUNT the user account"
LINE2="you wish to delete from the system? [y/n]"
get_answer
#
#
EXIT_LINE1="Because the account, $USER_ACCOUNT, is not"
EXIT_LINE2="the one you wish to delete, we are leaving the script..."
process_answer #함수 호출
#
#입력 받은 사용자 계정을 /etc/passwd 테이블에서 확인
USER_ACCOUNT_RECORD=$(cat /etc/passwd | grep -w $USER_ACCOUNT)
#
if [ $? -eq 1 ] #계정을 찾지 못하면 스크립트 종료
then
	echo
	echo "Account, $USER_ACCOUNT, not found. "
	echo "Leaving the script..."
	echo
	exit
fi
#
echo
echo "I found this record:"
#/etc/passwd 테이블의 사용자 레코드 출력
echo $USER_ACCOUNT_RECORD
#
LINE1="Is this the correct User Account? [y/n] "
get_answer
#
#
EXIT_LINE1="Because the account, $USER_ACCOUNT, is not"
EXIT_LINE2="the one you wish to delete, we are leaving the script..."
process_answer
#
#삭제 할 계정으로 실행 중인 프로세스 체크
#
echo
echo "Step #2 - Find process on system belonging to user account"
echo
#
ps -u $USER_ACCOUNT > /dev/null 
#스크립트 사용자가 ps -u $USER_ACCOUNT 결과를 못보게 처리
#
case $? in
	#종료 상태로 1을 반환하면(사용자 계정으로 실행중인 프로세스가 없을때)
	1)
		echo "There are no processes for this account currently running."
		echo
	;;	
	#종료 상태로 0을 반환하면(사용자 계정으로 실행중인 프로세스가 있을때)
	0) 
		echo "$USER_ACCOUNT has the following processes running:"
		echo
		ps -u $USER_ACCOUNT
		#
		LINE1="Would you like me to kill the process(es)? [y/n]"
		get_answer
		#질의 하고 y를 받으면 실행 중인 프로세스들 kill
		case $ANSWER in y|Y|YES|yes|Yes|yEs|yeS|YEs|yES )
			echo
			echo "Killing off process(es)..."
			#
			COMMAND_1="ps -u $USER_ACCOUNT --no-heading"
			#
			COMMAND_3="xargs -d \\n /user/bin/sudo /bin/kill -9"
			#
			$COMMAND_1 | gawk '{print $1}' | $COMMAND_3
			#
			echo
			echo "Process(es) killed."
		;;
		*)
			echo
			echo "Will not kill the process(es)"
			echo
		;;
		esac
;;
esac
######################################################################
######################################################################
#삭제하는 사용자 계정의 소유로 되어있는 파일 리스트 저장
#리스트 파일 명 및 저장한 경로 출력
echo
echo "Step #3 - Find files on system belonging to user account"
echo
echo "Creating a report of all files owned by $USER_ACCOUNT."
echo
echo "It is recommended that you backup/archive these files,"
echo "and then do one of two things:"
echo "    1) Delete the files"
echo "    2) Change the files ownership to a current user account."
echo
echo "Please wait. This may take a while..."
#
REPORT_DATE=$(date +%y%m%d)
REPORT_FILE=$USER_ACCOUNT"_FILES_"$REPORT_DATE".rpt"
#
find / -user $USER_ACCOUNT > $REPORT_FILE 2>/dev/null
#오류를 제외한 결과값만 REPORT_FILE에 출력
#
echo
echo "Report is complete."
echo "Name of report:        $REPORT_FILE"
echo "Location of report:    $(pwd)"
echo
######################################################################
# 사용자 계정 삭제 수행
echo
echo "Step #4 - Remove user account"
echo
#
LINE1="Remove $USER_ACCOUNT's account from system?[y/n]"
get_answer
#
EXIT_LINE1="Since you do not wish to remove the user account,"
EXIT_LINE2="$USER_ACCOUNT at this time, exiting the script..."
process_answer
#
userdel $USER_ACCOUNT
echo
echo "User account, $USER_ACCOUNT, has been removed"
echo
#
exit