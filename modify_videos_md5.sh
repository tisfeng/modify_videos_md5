#!/bin/bash
# script.sh

#===============================================================================#
# 用途：批量修改该脚本所在目录下所有文件的md5
#===============================================================================#

# 获取该脚本所在的目录路径
script_dir=$(dirname $0)

# 防止文件名中有空格
OLD_IFS=$IFS
IFS=$'\n'

# 函数：将当前目录下所有文件名中的空格用下划线替换
function replace_space_to_underline() {
    for file in $(ls); do
        echo $file
        if [ -f $file ]; then
            mv $file ${file// /_}
        fi
    done
}

# 函数：遍历当前目录下所有文件，如果该文件不是目录，则在文件末尾追加字符串"#1024"。
function add_string_to_file() {
    for file in $(ls); do
        echo $file
        if [ -f $file ]; then
            # 将文件末尾追加字符串"#1024"
            echo "#1024" >> $file
        fi
    done
}

# replace_space_to_underline
append_string_to_file

# 恢复IFS
IFS=$OLD_IFS 
