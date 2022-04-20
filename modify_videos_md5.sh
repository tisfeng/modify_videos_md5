#!/bin/bash
# script.sh

#===============================================================================#
# 用途：批量修改该脚本所在目录下所有文件的md5
#===============================================================================#

# 获取该脚本所在的目录路径
script_dir=$(dirname $0)
echo $script_dir

# 防止文件名中有空格
OLD_IFS=$IFS
IFS=$'\n'


# 函数：替换文件名中的空格
function replace_space()
{
    for file in `ls $script_dir`
    do
        echo $file
        if [ -d $1"/"$file ] 
        then
            replace_space $1"/"$file
        else
            # 替换文件名中的空格
            new_file=`echo $file | sed 's/ /_/g'`
            if [ $file != $new_file ]
            then
                mv $1"/"$file $1"/"$new_file
            fi
        fi
    done
}



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
        append_str="#$random_num"
        # 打印拼接字符串
        echo $append_str
        
        # 获取文件最后一行字符串
        last_line=$(tail -n 1 $new_file_path)
        # 如果字符串的前缀是'#'
        if [ ${last_line:0:1} == "#" ]; then
           # 将拼接字符串不换行追加到文件末尾
              echo -e "$last_line$append_str" >> $new_file_path
           
            # 打印字符串
            echo $last_line
        fi


        # 打印新文件的md5
        md5sum $new_file_name

        # 获取文件末尾最后两个字符
        last_two_char=$(tail -c 2 $new_file_path)
        # 打印文件末尾最后两个字符
        echo $last_two_char
    fi

done

IFS=$OLD_IFS # 恢复IFS
