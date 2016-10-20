#!/bin/bash

echo ===================
echo  iptables-backlist
echo ===================
echo
echo The following IP addresses will be blocked:

for ip in $(wget -O- -q https://raw.githubusercontent.com/alexanderkress/iptables-blacklist/master/blacklist.txt);
do
    echo - $ip
    iptables -A INPUT -s $ip -j DROP
    iptables -A OUTPUT -s $ip -j DROP
done

exit 0
