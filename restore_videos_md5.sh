#!/bin/bash

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
# 若该文件最后一行的前缀是"#1024"，则不换行追加字符串"#1000"
function append_string_to_file() {
    for file in $(ls); do
        echo $file
        if [ -f $file ]; then
           # 获取文件最后一行
              last_line=$(tail -n 1 $file)
                # 判断文件最后一行是否以"#1024"开头
                if [[ $last_line =~ ^#1024 ]]; then
                    # 在文件最后一行后面追加字符串"#1024"
                    echo "#1024" >> $file
                else
                    # 在文件最后一行换行追加字符串"#1024"
                    echo -e "\n#1024" >> $file # 注意：-e表示转义
                fi
        fi
    done
}


# replace_space_to_underline
append_string

IFS=$OLD_IFS # 恢复IFS
