#!/bin/bash

for ip in $(wget -O- -q https://raw.githubusercontent.com/alexanderkress/iptables-blacklist/master/blacklist.txt);
do
    iptables -A INPUT -s $ip -j DROP
    iptables -A OUTPUT -s $ip -j DROP
done

exit 0
