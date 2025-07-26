#!/bin/bash
sudo iptables -A INPUT -p tcp --dport 5000 ! -s 127.0.0.1 -j DROP
