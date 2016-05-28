from centos:centos7
run yum -y install openssl
run openssl req -x509 -newkey rsa:2048 -keyout /key.pem -out /cert.pem -days 365 -nodes -subj "/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=www.example.com"
run cat /key.pem /cert.pem > /server.pem
copy ssldummy.py /
cmd python /ssldummy.py
expose 443
