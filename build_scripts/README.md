# Readme

# 底层构建脚本

本目录保存由统一入口调用的底层构建实现。日常使用请从仓库根目录运行：

```sh
./scripts/plcfuzz build --help
```

`build_plcfiles.sh`、`build.sh`、`build_shared_library.sh` 和 `buildfuzz.sh` 仍可用于开发调试，但不作为主要用户入口。根目录的 `buildscript.sh` 只保留兼容转发并会显示迁移提示。

不能直接跑，直接跑的话文件夹的路径有问题
