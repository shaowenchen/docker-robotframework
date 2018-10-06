## 简介

这是一个 Robotframework 的 Docker 镜像运行环境。

建议：在测试用例所在目录，新建 `start.sh` 脚本文件，用于执行测试。

## 内置的浏览器

- Google Chrome
- Firefox
- Phantomjs

## 本地编译

- 本地编译

如果需要在本地编译，使用命令：

```shell
$ docker-compose build
```

- 本地运行

```shell
$ docker-compose up
```

## 使用线上镜像

```shell
version: '2'

services:

    robotframework:
      image: shaowenchen/docker-robotframework
      volumes:
        - ./tests:/data
      command:  /bin/bash -c  '/data/start.sh'
```
