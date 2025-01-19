+++
title = "达梦数据库disql命令行提取"
date = 2024-11-01
+++

使用达梦8 docker版，镜像内不含disql，只能去安装版提取disql达梦数据库命令行连接工具，方便linux x86宿主机或是其他没装达梦的服务器连接。

下载安装包https://eco.dameng.com/download/
https://download.dameng.com/eco/adapter/DM8/202401END/dm8_20240408_x86_rh7_64.zip

一层层提取压缩包得到Install.tar，进入source\bin\

![image](https://github.com/user-attachments/assets/4efe55b3-2c49-4950-895b-51cf7e7bad66)

找到disql放入linux检测动态库依赖
![image](https://github.com/user-attachments/assets/4f364898-4e06-4055-9446-9d4f1e8d6932)

按要求找齐剩余so动态库文件，置于disql同目录

测试运行
![image](https://github.com/user-attachments/assets/d5803f59-f251-4725-a0e2-1934680aa975)


disql文件备份
https://mega.nz/file/dNRwURZJ#HH7Hk8R3yKz5U8-0-ctxVCF5FNkxp5lrH-U9kN0oTG8

#### 如果disql报错[-70089]:Encryption module failed to load.
disql存在对系统加密库的隐式依赖
尝试`sudo apt install libcrypto++-dev libssl-dev`
或`yum install openssl-devel`
