#!/bin/bash
#통합 계정관리용 사용자 계정 자동생성 및 패스워드 없이 su - 권한 추가

#계정생성
adduser 계정명

#계정패스워드 설정
passwd 계정명 <<EOF
패스워드기입
패스워드기입
EOF

#계정 그룹 설정
usermod -G wheel 계정명

#pam 설정, su - 명령어 비밀번호 없이 사용 가능하게
cp /etc/pam.d/su /etc/pam.d/su.bak
sed -i 1,4s/#auth/auth/g /etc/pam.d/su
diff /etc/pam.d/su.bak /etc/pam.d/su

echo "생성이 완료되었습니다."


