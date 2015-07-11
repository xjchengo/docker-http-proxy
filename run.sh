#!/bin/bash

PASSWORD=${ROOT_PASSWORD:-$(pwgen -s 12 1)}

echo "root:$PASSWORD" | chpasswd

echo "========================================================================"
echo "您可以使用如下命令登入本容器:"
echo ""
echo "    ssh -p <port> root@<host>"
echo ""
echo "您的 root 密码为：$PASSWORD"
echo "========================================================================"

exec /usr/sbin/sshd -D
