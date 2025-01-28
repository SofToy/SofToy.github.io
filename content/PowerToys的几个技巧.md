+++
title = "kafka在SASL配置下初始化主题遇到的问题"
date = 2025-01-28
+++

## Workspace+VMWare的情况
希望达成一个效果，启动Workspace某个场景时自动启动对应的虚拟机。

先决定好位置直接捕获，拿到的是vmware.exe。vmware.exe 不能加cli 参数决定启动哪个虚拟机。
打开`C:\Users\Administrator\AppData\Local\Microsoft\PowerToys\Workspaces\workspaces.json`
```diff
        {
          "id": "{ccd331d1-3820-4925-975e-9848aee34ddd}",
          "application": "vmware",
-         "application-path": "C:\\Program Files (x86)\\VMware\\VMware Workstation\\vmware.exe",
+         "application-path": "C:\\Program Files (x86)\\VMware\\VMware Workstation\\vmrun.exe",
          "title": "PopOs - VMware Workstation",
          "package-full-name": "",
          "app-user-model-id": "",
          "pwa-app-id": "",
-         "command-line-arguments": "",
+         "command-line-arguments": "-T ws start D:\\PopOs\\PopOs.vmx",
          "is-elevated": true,
          "can-launch-elevated": false,
          "minimized": false,
          "maximized": false,
          "position": {
            "X": 0,
            "Y": 0,
            "width": 768,
            "height": 816
          },
          "monitor": 1
        }
```

![Image](https://github.com/user-attachments/assets/37364a1f-a9a5-4977-9a6b-c41b577023d4)

如此就能实现启动自动开启对应的虚拟机了。


## 其他工具技巧待更新...