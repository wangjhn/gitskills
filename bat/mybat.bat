@echo off
set str1=aaa echo ok bbb
echo 初始字符串：%str1%
echo 生成命令字符串如下：
echo %str1:~4,7%
echo 运行命令字符串生成最终结果为：
call %str1:~4,7%
pause