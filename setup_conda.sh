#!/bin/bash

if command -v conda &>/dev/null; then
    echo "conda installed"
    exit 0
fi

ARCH=$(uname -m)
if [[ "$ARCH" == "aarch64" ]]; then
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-py311_24.11.1-0-Linux-aarch64.sh"
else
    MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-py311_24.9.2-0-Linux-x86_64.sh"
fi

if [[ -f "Miniconda3.sh" ]]; then
    echo "Using existing Miniconda3.sh"
else
    echo "Downloading Miniconda from $MINICONDA_URL"
    wget "$MINICONDA_URL" -O Miniconda3.sh
fi

bash Miniconda3.sh -b -p "$HOME/miniconda3"
source "$HOME/miniconda3/etc/profile.d/conda.sh"
conda init
source ~/.bashrc

echo "Miniconda installation complete."

echo "Activating base conda environment..."
conda activate base

echo "Setting conda show_channel_urls to yes..."
conda config --set show_channel_urls yes

cat << EOF > ~/.condarc
channels:
  - https://mirror.nju.edu.cn/anaconda/cloud/bioconda/
  - https://mirror.nju.edu.cn/anaconda/cloud/conda-forge/
  - https://mirror.nju.edu.cn/anaconda/pkgs/main/
  - defaults
EOF

echo "Setting pip index-url to https://pypi.tuna.tsinghua.edu.cn/simple..."
pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple/

echo "Configuration completed."
