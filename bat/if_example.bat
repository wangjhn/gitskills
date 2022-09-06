chcp 65001

@echo off
dir c:
IF ERRORLEVEL 1 	goto f
IF ERRORLEVEL 0 	goto s

:s
echo 命令执行成功！
goto exit

:f
echo 命令执行失败！
goto exit

:exit
pause

setlocal EnableDelayedExpansion
set 	option=2
set 	sum=-2

if %option% == 3 ( 
  echo three 
  set /a sum=%option%*%option%*%option%
) ^
else if %option% == 2 ( 
  echo two 
  if not %sum% equ -1 set /a sum=2*%option%
) ^
else if %option% == 1 ( 
  echo one 
  set /a sum=%option% 
) ^
else ( 
  echo zero 
  set /a sum=0 
)

echo sum = !sum!

pause
