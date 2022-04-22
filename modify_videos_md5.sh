#!/bin/bash
# script.sh

#===============================================================================#
# 用途：批量修改当前目录下所有文件的md5
#===============================================================================#

# 防止文件名中有空格
OLD_IFS=$IFS
IFS=$'\n'

# 函数：将当前工作目录下所有文件名中的空格用下划线替换
function replace_space_to_underline() {
    for file in $(ls); do
        echo $file
        if [ -f $file ]; then
            mv $file ${file// /_}
        fi
    done
}

# 函数：递归遍历当前工作目录下所有文件，在文件末尾追加字符串"#1024"。
function append_string_to_file_recursive() {
    for file in $(ls); do
        if [ -f $file ]; then
            echo 'file: ' $file
            # 如果是文件，在文件末尾追加字符串"#1024"
            echo -n "#1024" >>$file
            echo 'append "#1024" to file: ' $file
        elif [ -d $file ]; then
            echo 'dir: ' $file
            # 如果是目录，则递归遍历该目录下所有文件
            cd $file
            append_string_to_file_recursive
            cd ..
        fi
    done
}

echo '当前工作目录为:' $PWD
echo '//====================开始批量修改文件md5==================//'
append_string_to_file_recursive
echo '//====================修改成功==================//'

# 恢复IFS
IFS=$OLD_IFS
