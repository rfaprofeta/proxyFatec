#!/bin/bash
#trocando de rede, troca de proxy
user="***"
password="*********"
proxy="https_proxy=http://2840481723"$user":"$password"@172.16.0.1:3128/"
rede="search wifi.fatecrp.local"
ip=`cat /etc/resolv.conf | grep wifi`
if [ "$ip" == "$rede" ]
then
	sudo echo $proxy >> /etc/environment
else
	sudo sed -i '/proxy/d' /etc/environment  
fi
source /etc/environment
