#!/bin/bash
# script.sh

#===============================================================================#
# 用途：批量修改该脚本所在目录下所有文件的md5
#===============================================================================#


# echo `ls $0`
echo `ls $1`

exit 0

# 获取该脚本所在的目录路径
script_dir=$(dirname $0)
echo $script_dir

# 防止文件名中有空格
OLD_IFS=$IFS
IFS=$'\n'

# 遍历所有文件名
for file_name in $(ls $script_dir); do
    # 打印文件名
    echo ${file_name}

    # 将文件名中的空格替换为下划线
    new_file_name=${file_name// /_}
    # 判断是否为文件
    if [ -f $script_dir/$file_name ]; then
        # 判断文件名是否与原文件名不同
        if [ $file_name != $new_file_name ]; then
            # 将文件名替换为新文件名
            mv $script_dir/$file_name $script_dir/$new_file_name
            # 打印新文件名
            echo $new_file_name
        fi
    fi

    # 获取新文件的绝对路径
    new_file_path=$script_dir/$new_file_name
    # 判断是否是文件
    if [ -f $new_file_path ]; then
        # 打印文件的md5
        # md5sum $new_file_path

        # 打印文件的md5
        md5sum $new_file_name

        # 生成一个0～9的随机数
        random_num=$((RANDOM % 10))
        # 待拼接的字符串为#+随机数
        str="#$random_num"
        # 打印字符串
        echo $str

        #将字符串追加到文件末尾
        echo $str >> $new_file_path

        # 打印新文件的md5
        md5sum $new_file_name

        # 获取文件末尾最后两个字符
        last_two_char=$(tail -c 2 $new_file_path)
        # 打印文件末尾最后两个字符
        echo $last_two_char
    fi

done

IFS=$OLD_IFS # 恢复IFS
