#!/bin/bash

if command -v conda &>/dev/null; then
    echo "conda installed"
    exit 0
else
    wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-py310_24.3.0-0-Linux-x86_64.sh
    bash Miniconda3-py310_24.3.0-0-Linux-x86_64.sh -b -p $HOME/miniconda3
    source $HOME/miniconda3/etc/profile.d/conda.sh
    conda init
    source ~/.bashrc
fi

echo "Activating base conda environment..."
conda activate base

echo "Setting conda show_channel_urls to yes..."
conda config --set show_channel_urls yes

# 写入 ~/.condarc
echo "Writing to ~/.condarc..."
cat << EOF > ~/.condarc
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  msys2: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  bioconda: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  menpo: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  deepmodeling: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
EOF

# 设置 pip 源
echo "Setting pip index-url to https://pypi.tuna.tsinghua.edu.cn/simple..."
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

echo "Configuration completed."
