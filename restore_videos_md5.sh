#!/bin/bash
# script.sh

#===============================================================================#
# 用途：恢复所有该脚本所在目录下文件的md5，需与modify_videos_md5.sh搭配使用。
#===============================================================================#

# 获取该脚本所在的目录路径
script_dir=$(dirname $0)

# 防止文件名中有空格
OLD_IFS=$IFS
IFS=$'\n'

# 函数：递归遍历当前目录下所有文件，删除该文件最后一行所有的"#1024"字符串。
function remove_string_from_file_recursive() {
    for file in $(ls); do
        if [ -f $file ]; then
            echo 'file: ' $file
            # 特意添加LC_CTYPE=C，用于修复 Mac 问题 sed: RE error: illegal byte sequence
            LC_CTYPE=C sed -i '' '$s/#1024//g' $file
            echo 'remove all #1024 from file: ' $file
        else
            echo 'dir: ' $file
            cd $file
            remove_string_from_file_recursive
            cd ..
        fi
    done
}

echo '//====================开始批量恢复文件md5==================//'
remove_string_from_file_recursive
echo '//====================恢复成功==================//'

# 恢复IFS
IFS=$OLD_IFS

