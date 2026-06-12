#!/bin/bash
clear
echo -e "\033[1;33m======================================\033[0m"
echo -e "\033[1;36m Gamer Server JX2 2021 by Eopi        \033[0m"
echo -e "\033[1;35m Author: Shiina Eopi                  \033[0m"
echo -e "\033[1;34m Link: https://loliteam.net           \033[0m"
echo -e "\033[1;32m Máy chủ được chia sẻ miễn phí        \033[0m"
echo -e "\033[1;33m======================================\033[0m"

# Lấy địa chỉ IP của máy chủ
ip_address=$(hostname -I | awk '{for(i=1;i<=NF;i++) if($i ~ /^192\.168\./) print $i}')
echo -e "\033[1;32mĐịa chỉ IP của máy chủ:\033[0m \033[1;34m$ip_address\033[0m"

# Cập nhật địa chỉ IP trong file servercfg.ini
config_file="/home/shiina/ServerShiina/GameServer/servercfg.ini"
if [ -f "$config_file" ]; then
    sed -i "s/^ExternalIP=.*/ExternalIP=$ip_address/" "$config_file"
    echo -e "\033[1;32mĐã cập nhật địa chỉ IP thành công\033[0m"
else
    echo -e "\033[1;31mFile servercfg.ini không tồn tại!\033[0m"
fi

echo "Nhấn Enter để tiếp tục..."
read

# Chuyển đến thư mục và chạy server
cd /home/shiina/ServerShiina/GameServer
./SO2GameSvrD | grep -v "\[KEventCenter] GetEventId(event_server_tick) not defined"

