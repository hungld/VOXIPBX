#!/bin/bash
# Identify Linux Distribution type
func_identify_os() {
    if [ -f /etc/debian_version ] ; then
        DIST='DEBIAN'
        if [ "$(lsb_release -cs)" != "precise" ]; then
            echo "A instalação funciona apenas no Ubuntu LTS 12.04"
            exit 255
        fi
    else
        echo "A instalação funciona  apenas no Ubuntu LTS 12.04 "
        exit 1
    fi
}

func_identify_os

echo ""
echo ""
echo "Este script irá instalar o ToFalando IPBX neste computador"
echo "Prescione Enter para continuar CTRL-C para sair"
echo ""
read TEMP


case $DIST in
    'DEBIAN')
        apt-get -y update
        apt-get -y install vim git-core
    	#APACHE
	apt-get install -y apache2 apache2-mpm-prefork apache2-utils apache2.2-bin apache2.2-common libapache2-mod-php5
	#PHP
	apt-get install -y php5-suhosin  php5 php5-cgi php5-cli php5-common php5-curl php5-gd php5-mcrypt php5-mysql php5-odbc php5-curl php5-mysql php-pear php-db php5-gd
	# MYSQL
	export DEBIAN_FRONTEND=noninteractive
	apt-get install -q -y mysql-server mysql-client libmysqlclient-dev
	mysqladmin -u root password tofalando2014
	#ODBC
	apt-get install -y libmyodbc odbcinst odbcinst1debian2 unixodbc unixodbc-dev libodbcinstq4-1
	# DEVEL
	apt-get install -y  build-essential linux-headers-`uname -r` bison flex  zip  curl sox  lshw ncurses-term ttf-bitstream-vera libncurses5-dev automake libtool mpg123 sqlite3 libsqlite3-dev libncursesw5-dev uuid-dev  libxml2-dev libnewt-dev  pkg-config  autoconf subversion  libltdl-dev libltdl7 libcurl3   libxml2-dev   libiksemel-dev libssl-dev libnewt-dev libusb-dev libeditline-dev libedit-dev libcurl4-gnutls-dev  libssl-dev 
	
;;
esac

#Instalar o Asterisk
cd /usr/src/
wget --no-check-certificate  https://raw.github.com/eluizbr/VOXIPBX/master/install/install-asterisk.sh
bash install-asterisk.sh
