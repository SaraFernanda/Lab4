iptables restart 
iptables -F
iptables -X
iptables -p INPUT ACCEPT

iptables -A INPUT -i io -j ACCEPT

iptables -A INPUT -p TCP --dport 22
iptables -A INPUT -p TCP --dport 80
iptables -A INPUT -p TCP --dport 53
iptables -A INPUT -p TCP --dport 443


iptables -A OUPUT -m state --state INVALID -j DROP
iptables -A OUPUT -p TCP --dport 22
iptables -A OUPUT -p TCP --dport 80
iptables -A OUPUT -p TCP --dport 53
iptables -A OUPUT -p TCP --dport 443

iptables -t nat -A POSTROUTING -P internet0 -j MASQUEREDE
iptables -A FORWARD -m conntrack --ostate RELATED, STABLISHED -J ACCEPT
iptables -A FORWARD -t nat -o internet0 -j ACCEPT

