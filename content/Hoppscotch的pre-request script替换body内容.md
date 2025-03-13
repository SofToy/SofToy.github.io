+++
title = "Hoppscotch的pre-request script替换body内容"
date = 2025-03-13
+++

### 起因
有请求需要加时间戳和随机数到body里面，第一反应是找pre-request script有没有reqest变量（因为post script是有pw.response的，就想当然...)
然后去github issue上转了一圈，文档转了一圈。
看了<https://github.com/hoppscotch/hoppscotch/issues/3904>，误解成没办法改，打算下源码自己改进再构建下。

### 发现没必要
发现我这个需求完全没必要去改源码，有另一种workaround，就是用变量。
![Image](https://github.com/user-attachments/assets/b33e18dc-7dab-4f7b-b3f2-2f3d28e2db05)

### 方案
既然body能使用变量，那就没有必要去改源码了
使用的时候完全可以在pre-request script进行定义，比如
```
pw.env.set("test1", "Operation code 9029")
```

![Image](https://github.com/user-attachments/assets/1cdeadaf-df61-4f8d-b687-3eb89faba921)

虽然会有提示报错找不到变量，但是执行前会在`getFinalEnvsFromPreRequest`赋值变量。

### 脚注
本文记录的版本为2025.2.2
因为body里打入<<没见下拉提示，UI提示报错找不到变量。这2个小问题迟早会被修复的吧，毕竟社区还是比较活跃的。
