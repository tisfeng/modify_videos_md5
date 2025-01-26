# 修改当前目录下所有文件的 md5 哈希值
function Append-StringToFile {
    param (
        [string]$directory
    )
    
    Get-ChildItem -Path $directory -Recurse | ForEach-Object {
        if ($_.PSIsContainer) {
            Append-StringToFile -directory $_.FullName
        } else {
            Add-Content -Path $_.FullName -Value "#1024"
            Write-Output "Appended '#1024' to file: $($_.FullName)"
        }
    }
}

# 获取当前工作目录
$currentDirectory = Get-Location
Write-Output "当前工作目录为: $currentDirectory"

# 开始批量修改文件 md5
Write-Output "//====================开始批量修改文件 md5==================//"
Append-StringToFile -directory $currentDirectory
Write-Output "//====================修改成功==================//"#1024
#1024
