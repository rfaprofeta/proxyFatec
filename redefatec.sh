#!/bin/bash
#trocando de rede, troca de proxy
user="***"
password="*********"
proxyFull="https_proxy=http://2840481723"$user":"$password"@172.16.0.1:3128/
proxyNull="https_proxy"
proxy=""
rede="search wifi.fatecrp.local"
ip=`cat /etc/resolv.conf | grep wifi`
if [ "$ip" == "$rede" ]
then
	proxy="$proxyFull"
	sudo echo $proxy >> /etc/environment
	echo "Maran acertou"
	echo $proxy >> ~/result.txt
else

	proxy="$proxyNull"	
	sudo sed '/proxy/d' /etc/environment  
	echo "Matheus acertou"
	sed -i '/proxy/d' ~/result.txt
fi
source /etc/environment
