# Kaliweb
Web桌面的Docker化Kali linux

一个运行在Docker容器中的Kali linux，XFCE为桌面，NoVNC提供Web终端
这使得用户通过浏览器就能使用Kali linux

## 快速安装

### base镜像
包含了中文用户相关配置
```
docker run -d --name kaliweb -p 127.0.0.1:6080:6080 wwek/kaliweb
```

### dev镜像
包含一些开发环境的
包：[top10的包](https://tools.kali.org/kali-metapackages)
编程环境：Golang PHP Nodejs
开发工具：vscode
```
docker run -d --name kaliweb-dev -p 127.0.0.1:6080:6080 wwek/kaliweb:dev
```

## 自定义镜像
如果基础镜像和dev镜像都不能满足你的需求可以从
https://www.kali.org/news/kali-linux-metapackages/
寻找你需要的包，然后通过自定义Dockerfile自由定制

## 感谢
[KaliBrowser](https://jerrygamblin.com/2016/05/31/kalibrowser/)
[Docker image for Kali XFCE with NoVNC](https://github.com/sa7mon/browser-kali)
[Official Kali Linux Docker](https://github.com/offensive-security/kali-linux-docker)