+++
title = "bpftool命令找不到"
+++

### 问题描述
```
~$ bpftool
WARNING: bpftool not found for kernel 5.15.0-67

  You may need to install the following packages for this specific kernel:
    linux-tools-5.15.0-67-generic
    linux-cloud-tools-5.15.0-67-generic

  You may also want to install one of the following packages to keep up to date:
    linux-tools-generic
    linux-cloud-tools-generic
```
安装linux-tools-5.15.0-67-generic发现这个包被删了。

### 解决方案
`sudo apt search linux-tools-5.15.0-`寻找并装个相近

比如我装了 `apt install linux-tools-5.15.0-125-generic`
这时候还是提示上面的WARNING.

就欺骗下系统
`sudo cp -r /usr/lib/linux-tools/5.15.0-125-generic/ /usr/lib/linux-tools/$(uname -r)`
基本上不会有问题，毕竟是相近版本。
