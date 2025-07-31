+++
title = "vscode调试需要root的go程序"
date = 2025-07-31
+++

遇到一个项目需要root才能执行，launch.json如下
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch file",
      "type": "go",
      "request": "launch",
      "mode": "debug",
      "asRoot": true,
      "program": "${workspaceFolder}",
      "console": "integratedTerminal",
      "args": [
        "xxxxx",
        "--debug-output"
      ]
    }
  ]
}
```

F5遇到Debug Console显示报错如下
```
Build Error: go build -o /home/kyle/Desktop/xxxxx/__debug_bin3742572055 -gcflags all=-N -l .
 (exec: "go": executable file not found in $PATH)
```
不管普通用户还是root，输入go都是有这个命令的。

把网上的结局方法试了个遍：
- vscode配置 go.gopath
- 配置terminal.integrated.env.linux
- 编辑.profile .bashrc
- sudo去启动vscode .etc

### 最后的解决方案
```diff
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch file",
      "type": "go",
      "request": "launch",
      "mode": "debug",
      "asRoot": true,
      "program": "${workspaceFolder}",
      "console": "integratedTerminal",
      "args": [
        "xxxxx",
        "--debug-output"
      ],
+     "env": {
+       "PATH": "/usr/local/go/bin"
+     }
    }
  ]
}
```

这就成了，F5终于报这个错了