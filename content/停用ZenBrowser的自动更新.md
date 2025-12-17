+++
title = "停用ZenBrowser的自动更新"
date = 2025-01-18
+++

网上的方法有调about:config的，有改hosts屏蔽更新地址的，都挡不住左上角弹出一个更新提示。

正确的方法是使用策略，包括其他浏览器基本上也只能靠组织策略来完全停用更新。

ZenBrowser基于FireFox自然沿用了其组织策略。

安装目录下新建distribution文件夹里面新建policies.json文件
```
{
  "policies": {
    "DisableAppUpdate": true,
    "ManualAppUpdateOnly": true
  }
}
```
或使用git bash

```
cd "/c/Program Files/Zen Browser" && \
mkdir -p distribution && \
echo -e '{\n  "policies": {\n    "DisableAppUpdate": true,\n    "ManualAppUpdateOnly": true\n  }\n}' > distribution/policies.json
```


重启浏览器，更新提示消失了。

![Image](https://github.com/user-attachments/assets/b16dac1e-3254-4c97-9ed7-a9e3b870cdba)

> 题外话：Edge浏览器可以通过转移`C:\Program Files (x86)\Microsoft\EdgeUpdate`里所有文件做到禁止更新

### 参考
<https://github.com/zen-browser/desktop/discussions/896>

