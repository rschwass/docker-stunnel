FROM debian:11-slim
run apt update;apt install wget build-essential libssl-dev -y
RUN wget https://www.stunnel.org/downloads/stunnel-5.70.tar.gz; tar -xvf stunnel-5.70.tar.gz;cd stunnel-5.70;./configure;make install
RUN mkdir /etc/stunnel;openssl genrsa -out /etc/stunnel/key.pem 2048;openssl req -new -x509 -key /etc/stunnel/key.pem -out /etc/stunnel/cert.pem -days 1095 -subj "/C=US/ST=NONEYA/L=Leamington/O=OrgName/OU=IT Department/CN=example.com";cat /etc/stunnel/key.pem /etc/stunnel/cert.pem >> /etc/stunnel/stunnel.pem
