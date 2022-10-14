3proxy install script for Debian / Ubuntu VPS
======================================================

A simple script to install 3proxy on Ubuntu/Debian

**MANUAL :**

Install :

    wget --no-check-certificate https://github.com/MeGaZip/3proxy/raw/master/3proxyinstall.sh
    chmod +x 3proxyinstall.sh
    ./3proxyinstall.sh

Add/Change user and pass. 

    nano /etc/3proxy/.proxyauth
	
Defaul user .proxyauth

    userName:CL:userPassword123

Change HTTP/SOCKS port, default is 9999 (HTTP) and 8088 (SOCKS)

    nano /etc/3proxy/3proxy.cfg
    

Start service (or reboot as it's automatically start)

    /etc/init.d/3proxy start
Or

    service 3proxy start
	
Uninstall:

	wget --no-check-certificate https://github.com/MeGaZip/3proxy/raw/master/3proxyuninstall.sh
	chmod +x 3proxyuninstall.sh
	./3proxyuninstall.sh

**Script tested on 2022-08-31:**

- Debian 10 64bit

Working under HestiaCP.