# modify_videos_md5

之前没接触过脚本，临时去学了一下午[` Bash 脚本教程`](https://wangdoc.com/bash/intro.html)，然后在谷歌和`GitHub Copilot`的帮助下编写了人生第一个脚本。

## 简介

> 批量修改视频文件的 md5，简单用于上传网盘防和谐。

## 用法

将 `modify_videos_md5.sh` 脚本放到视频文件所在的目录下，然后将该脚本拖到终端执行，即可修改该目录下所有视频文件的 md5。

## 原理

核心代码其实就一行，在文件末尾追加字符：

```bash
# 将字符串追加到文件末尾，例如 echo 'a' >> video.mp4
echo $str >> $new_file_path
```

---

## 参考

[如何改变一段视频文件的MD5? - Yang的回答 - 知乎](https://www.zhihu.com/question/25378331/answer/80903615)


