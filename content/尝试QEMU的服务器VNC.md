+++
title = "尝试QEMU的服务器VNC"
date = 2025-01-22
+++

先从云端租了一台8C16G的arm服务器。系统选择了Ubuntu22.04 arm版本。
```
# 下载依赖
apt update
apt install axel -y
apt install qemu-system-arm qemu-utils -y

# 下载打算挂载的安装镜像
axel -n12 -v "https://cdimage-download.chinauos.com/server/1070-juzhenbei/uos-server-20-1070a-20240901-arm64.iso"

ls -alh /usr/share/qemu-efi-aarch64 #这个目录可能根据系统有所差异，需要找到QEMU_EFI.fd用于作为BIOS
qemu-img create -f qcow2 arm-disk.qcow2 50G #创建50G的虚拟硬盘
# 挂载虚拟磁盘和下载的ISO镜像，启用VNC显示到5900端口，启用控制台输出信息
qemu-system-aarch64 \
    -boot d\
    -bios /usr/share/qemu-efi-aarch64/QEMU_EFI.fd \
    -M virt \
    -cpu cortex-a72 \
    -smp 4 \
    -m 4096 \
    -hda arm-disk.qcow2 \
    -cdrom uos-server-20-1070a-20240901-arm64.iso \
    -device virtio-gpu-pci  \
    -device usb-ehci -device usb-kbd -device usb-mouse \
    -display none -vnc :0 \
    -serial stdio
```
然后使用[1Remote](https://github.com/1Remote/1Remote) 这种工具VNC去连接就行了。

不过因为服务器cpu没有kvm加速，所以效率很低。建议在支持kvm的arm芯片上做。
