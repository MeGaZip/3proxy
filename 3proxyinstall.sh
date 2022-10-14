# Версии начиная с 0.9.x неудалось установить
version=0.8.13
gitdir=https://github.com/MeGaZip/3proxy/raw/master/

apt update && apt -y upgrade
apt install gcc make git nano -y

wget --no-check-certificate -O 3proxy-${version}.tar.gz ${gitdir}archive/3proxy-${version}.tar.gz
tar xzf 3proxy-${version}.tar.gz
cd 3proxy-${version}

make -f Makefile.Linux
cd src
mkdir /etc/3proxy/
mv 3proxy /etc/3proxy/
cd /etc/3proxy/
wget --no-check-certificate ${gitdir}3proxy.cfg
chmod 600 /etc/3proxy/3proxy.cfg
mkdir /var/log/3proxy/
wget --no-check-certificate ${gitdir}.proxyauth
chmod 600 /etc/3proxy/.proxyauth
cd /etc/init.d/
wget --no-check-certificate  ${gitdir}3proxy
chmod  +x /etc/init.d/3proxy
update-rc.d 3proxy defaults

# Запуск 3proxy /etc/init.d/3proxy start
service 3proxy start
echo 3proxy запущен

# Открываем порты vesta
v-add-firewall-rule ACCEPT 0.0.0.0/0 8088,9999 TCP 3Proxy

# Перезагрузка сервера
echo reboot
sleep 3
reboot