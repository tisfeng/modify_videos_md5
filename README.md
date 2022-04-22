# 批量修改视频文件的 md5

## 简介

批量修改视频文件的 md5，简单用于上传网盘防和谐。亲测好用！

## 缘起

在把一些电影上传到阿里云盘做备份时，发现也会被和谐，尤其各类小电影更是频频遭重，很烦。穷则思变，推测这类网盘审查的原理之一是检测视频文件的 md5 或 sha1 哈希值，于是就有了通过修改视频 md5 来骗过审查的想法。(另一种方式是将视频压缩加密，麻烦但也更可靠)

之前没接触过脚本，临时去学了一下午 [Bash 脚本教程](https://wangdoc.com/bash/intro.html)，然后在谷歌和 `GitHub Copilot` 的帮助下编写了人生第一个脚本。

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h1ioyvdjpbj21c00u040d.jpg)

## 用法

**把 `modify_videos_md5.sh` 脚本放到视频文件所在的目录下，然后 `终端` 进入该目录，执行以下脚本，即可修改该目录下所有视频文件的 md5。另外注意，该脚本可多次执行，且每次执行都会修改所有视频文件的 md5。**

```bash
# 在视频文件所在的目录下运行
bash modify_videos_md5.sh
```

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h1iv9r7db9j21ac0u0n13.jpg)

PS：由于一些网盘具有秒传功能，这个的实现也是靠比对文件哈希值，因此建议只修改可能会被审查和谐的视频文件 md5，其他学习资料就不要多此一举了。。

（其中 `restore_videos_md5.sh` 用于恢复当前目录下所有文件的 md5，需与 `modify_videos_md5.sh` 搭配使用。）

## 原理

核心代码其实就一行，在文件末尾追加字符：

```bash
# 将字符串追加到文件末尾，例如 echo 'a' >> video.mp4
echo -n "#1024" >> $file
```



## 参考

[如何改变一段视频文件的MD5? - Yang的回答 - 知乎](https://www.zhihu.com/question/25378331/answer/80903615)