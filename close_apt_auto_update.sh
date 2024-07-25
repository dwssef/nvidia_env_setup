#!/bin/bash

# 定义文件路径
AUTO_UPGRADES_FILE="/etc/apt/apt.conf.d/20auto-upgrades"
PERIODIC_FILE="/etc/apt/apt.conf.d/10periodic"

# 检查20auto-upgrades文件是否存在并进行修改
if [ -f "$AUTO_UPGRADES_FILE" ]; then
    sed -i 's/1/0/g' "$AUTO_UPGRADES_FILE"
    echo "Modified $AUTO_UPGRADES_FILE"
else
    echo "$AUTO_UPGRADES_FILE does not exist."
fi

# 检查10periodic文件是否存在并进行修改
if [ -f "$PERIODIC_FILE" ]; then
    sed -i 's/1/0/g' "$PERIODIC_FILE"
    echo "Modified $PERIODIC_FILE"
else
    echo "$PERIODIC_FILE does not exist."
fi

