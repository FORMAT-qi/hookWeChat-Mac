# !/bin/bash

app_name="WeChat"
framework_name="hookWeChat"
app_bundle_path="/Applications/${app_name}.app/Contents/MacOS"
app_executable_path="${app_bundle_path}/${app_name}"
app_executable_backup_path="${app_executable_path}_backup"
framework_path="${app_bundle_path}/${framework_name}.framework"
# 备份WeChat原始可执行文件
if [ -f "$app_executable_backup_path" ]
then
rm "$app_executable_path"
rm -rf "$framework_path"
mv "$app_executable_backup_path" "$app_executable_path"
echo "\n\t卸载成功"
else
echo "\n\t未发现情话小助手"
fi
