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

# 函数：遍历当前目录下所有文件，如果该文件不是目录，则删除该文件最后一行所有的"#1024"字符串。
function remove_string_from_file() {
    for file in $(ls); do
        echo $file
        if [ -f $file ]; then
        # 修复问题 sed: RE error: illegal byte sequence
        # https://stackoverflow.com/questions/19242275/re-error-illegal-byte-sequence-on-mac-os-x
        LC_CTYPE=C sed -i '' '$s/#1024//g' $file 
        fi
    done
}


remove_string_from_file

# 恢复IFS
IFS=$OLD_IFS 
