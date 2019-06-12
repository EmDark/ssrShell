curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
pip install --upgrade pip
pip install shadowsocks
systemctl stop firewalld
yum install iptables-services -y
yum install telnet -y
systemctl enable iptables
systemctl start iptables
echo '{
    "server": "0.0.0.0",
    "server_ipv6": "::",
    "local_address": "127.0.0.1",
    "local_port": 1080,

    "port_password":{
        "10010":"10010",
        "10009":"dili",
        "10008":"e",
        "10007":"chengxi",
        "10006":"lisiyi",
        "10005":"lisiyi",
        "10005":"azhe",
        "10004":"chengwei",
        "10003":"pika",
        "10001":"10001",
        "10002":"nell"
    },
    "method": "aes-256-cfb",
    "protocol": "origin",
    "protocol_param": "1",
    "obfs": "plain",
    "obfs_param": "",
    "speed_limit_per_con": 0,
    "speed_limit_per_user": 0,

    "additional_ports" : {},
    "timeout": 120,
    "udp_timeout": 60,
    "dns_ipv6": false,
    "connect_verbose_info": 0,
    "redirect": "",
    "fast_open": false,
    "worker":5
}' > /etc/shadowsocks.json
iptables -A INPUT -p tcp --dport 10001
iptables -A INPUT -p tcp --dport 10002
iptables -A INPUT -p tcp --dport 10003
iptables -A INPUT -p tcp --dport 10004
iptables -A INPUT -p tcp --dport 10005
iptables -A INPUT -p tcp --dport 10006
iptables -A INPUT -p tcp --dport 10007
iptables -A INPUT -p tcp --dport 10008
iptables -A INPUT -p tcp --dport 10010
iptables -A OUTPUT -p tcp --sport 10001
iptables -A OUTPUT -p tcp --sport 10002
iptables -A OUTPUT -p tcp --sport 10003
iptables -A OUTPUT -p tcp --sport 10004
iptables -A OUTPUT -p tcp --sport 10005
iptables -A OUTPUT -p tcp --sport 10006
iptables -A OUTPUT -p tcp --sport 10007
iptables -A OUTPUT -p tcp --sport 10008
iptables -A OUTPUT -p tcp --sport 10009
iptables -A OUTPUT -p tcp --sport 10010
service iptables save
ssserver -c /etc/shadowsocks.json -d start
yum install lsof -y
service iptables stop
