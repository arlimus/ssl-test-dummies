from centos:centos7.4.1708
copy build_ssl.sh /
copy ssldummy.sh /

run /build_ssl.sh

run openssl req -x509 -newkey rsa:2048 -keyout /key.pem -out /cert.pem -days 365 -nodes -subj "/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=www.example.com"

cmd /ssldummy.sh
expose 443
