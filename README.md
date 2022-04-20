# modify_videos_md5
批量修改视频文件的 md5，简单用于上传网盘防和谐。



核心代码其实就一行，在文件末尾追加一个字符：

```bash
# 将字符串追加到文件末尾，例如 echo 'a' >> video.mp4
echo $str >> $new_file_path
```

