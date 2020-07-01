all: plugins

plugins:
		apt update
		apt install curl gnupg net-tools nano -y
		apt update
		clear

go-server:
		echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
		curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
		apt update
		apt install go-server -y
		echo @"Go to http://localhost:8153/go"
		clear
		ifconfig
		service go-server start
		
go-agent:
		echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
		curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
		apt update
		apt install go-agent -y
		clear
		nano /usr/share/go-agent/wrapper-config/wrapper-properties.conf
		clear
		ifconfig
		service go-agent start
