#!/bin/bash
# 检查是否已禁用 nouveau
if lsmod | grep -q nouveau; then
    echo "nouveau is currently enabled, disabling it..."
    # 添加 blacklist nouveau 到 /etc/modprobe.d/blacklist.conf
    echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist.conf > /dev/null
    # 更新 initramfs
    sudo update-initramfs -u
    echo "nouveau has been disabled."
    echo "plz reboot the server."
else
    echo "nouveau is already disabled."
fi
