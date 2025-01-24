#!/bin/bash

if command -v conda &>/dev/null; then
    echo "conda installed"
    exit 0
else
    wget https://repo.anaconda.com/miniconda/Miniconda3-py311_24.9.2-0-Linux-x86_64.sh -O Miniconda3.sh
    bash Miniconda3.sh -b -p $HOME/miniconda3
    source $HOME/miniconda3/etc/profile.d/conda.sh
    conda init
    source ~/.bashrc
    echo "Miniconda installation complete."
fi

echo "Activating base conda environment..."
conda activate base

echo "Setting conda show_channel_urls to yes..."
conda config --set show_channel_urls yes

# 写入 ~/.condarc
# 将conda源 和 pip源设置为清华源（用于加速）
echo "Writing to ~/.condarc..."
cat << EOF > ~/.condarc
channels:
  - https://mirror.nju.edu.cn/anaconda/cloud/bioconda/
  - https://mirror.nju.edu.cn/anaconda/cloud/conda-forge/
  - https://mirror.nju.edu.cn/anaconda/pkgs/main/
  - defaults
EOF

# 设置 pip 源
echo "Setting pip index-url to https://pypi.tuna.tsinghua.edu.cn/simple..."
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple/

echo "Configuration completed."

