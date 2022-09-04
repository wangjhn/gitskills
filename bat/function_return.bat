chcp 65001

@echo off
call :sub return1 return2
echo return value: %return1% ,%return2%  
pause
goto :eof
 
:sub
echo %0
set %1 = 你好
set %2 = 中国人民解放军
goto :eof