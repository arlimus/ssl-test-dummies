FROM centos:centos7
RUN yum -y install openssl
RUN openssl req -x509 -newkey rsa:2048 -keyout /key.pem -out /cert.pem -days 365 -nodes -subj "/C=US/ST=Oregon/L=Portland/O=Company Name/OU=Org/CN=www.example.com"
RUN cat /key.pem /cert.pem > /server.pem
COPY ssldummy.py /
CMD python /ssldummy.py
# install net tools to have netstat available in our container
RUN yum -y install net-tools
EXPOSE 443
