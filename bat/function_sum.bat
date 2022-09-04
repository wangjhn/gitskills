chcp 65001

@echo off
set sum=0
call :sub 10 20 30 40 50 60 70
echo 数据求和结果：%sum%
pause
goto :eof
 
:sub
rem 参数1为返回变量名称
set /a sum+=%1
shift /1 
if not "%1"=="" goto sub
goto :eof