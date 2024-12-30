# Nvidia env setup

Testing in ubuntu20.04

## Change ubuntu apt source

[raw.githubusercontent.com/Robert1037/change-source-sh/master/ubuntu-source.sh]( https://raw.githubusercontent.com/Robert1037/change-source-sh/master/ubuntu-source.sh )

## Instal Nvidia driver
1.
```bash
sudo bash NVIDIA-Linux-x86_64-535.113.01.run --no-x-check
```

2.
```bash
sudo apt install build-essential gcc g++ make
sudo apt install build-essential linux-headers-$(uname -r)
ubuntu-drivers devices
sudo apt install nvidia-driver-550


sudo dkms status
sudo dkms autoinstall
```

## pip source
https://pypi.mirrors.ustc.edu.cn/simple

https://mirrors.cloud.tencent.com/pypi/simple

https://mirrors.aliyun.com/pypi/simple

https://repo.huaweicloud.com/repository/pypi/simple
