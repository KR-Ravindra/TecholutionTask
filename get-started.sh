#!/bin/bash
packages="git make pv curl gnupg net-tools nano"

GoServer(){
    clear
        apt update
        apt-get install $packages -y
        make
        make go-server
        echo " go-server has been installed  
    " | pv -qL 10
        service go-server start
}

GoAgent(){
    clear
        apt update
        apt-get install $packages -y 
        make
        make go-agent 
        echo " go-agent has been installed    
    " | pv -qL 10
        service go-agent start
}

read -p "Is this server? [y/n] : " yn
case $yn in
[Yy]*)  
      GoServer ;;
[Nn]*)
      GoAgent ;;
esac
