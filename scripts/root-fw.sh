#!/bin/bash

ADDR="192.168.0.0/16"

firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$ADDR'" port protocol="tcp" port="8080" accept'
firewall-cmd --permanent --zone=public --add-rich-rule='rule family="ipv4" source address="'$ADDR'" port protocol="tcp" port="8000" accept'
firewall-cmd --reload
