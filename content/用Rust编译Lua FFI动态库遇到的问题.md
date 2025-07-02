+++
title = "用Rust编译Lua FFI动态库遇到的问题"
date = 2024-02-10
+++

>场景：需编译给debian镜像中的luajit使用(ldd --version glibc为2.31)

### 问题1 FFI加载so报错/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
原因，在其他机器上编译时使用的glibc比较新，而运行机器比较老

方案：使用cross
```
cargo install cross
cross build --target x86_64-unknown-linux-gnu --release
```
cross 也是用镜像去编译，可以方便使用老版本glibc去编译。

### 问题2 cross编译时报错cannot satisfy dependencies so `std` only shows up once
lib.rs只编译了一种动态库，不方便rust导入
解决方案`cargo.toml`
```
crate-type = ["rlib", "dylib"]
```

### 问题3 编译报错error: linking with link.exe failed: exit code: 1120
extern其他库 windows环境link失败，linux正常，目前无解
> https://github.com/rust-lang/rust/issues/86125

### 推荐阅读
- https://michael-f-bryan.github.io/rust-ffi-guide/print.html 非官方Rust FFI指南
- https://docs.rust-embedded.org/book/interoperability/rust-with-c.html rust面向嵌入式册子

### 参考
- <https://stackoverflow.com/questions/40306170/error-cannot-satisfy-dependencies-so-std-only-shows-up-once>
- <https://stackoverflow.com/a/65835163>
