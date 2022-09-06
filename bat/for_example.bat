chcp 65001
rem /d=dir; only handle dir not file

@echo off
echo  list all disk
rem judge disk
set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
for %%i in (%str%) do if exist %%i: echo %%i:
pause

cls
echo list all files on current dir
for %%i in (*.*) do echo "%%i"
pause

cls
echo test /d ; list all dir under C:
for /d %%i in (c:\*) do echo %%i
pause

cls
echo test /d; list 
for /d %%i in (c:\w*s) do echo %%i
pause

cls
echo test/r 
for /r %%i in (*.txt) do echo %%i
pause

cls
echo test /l step 
for /l %%i in (1,1,5) do md %%i
pause

cls
echo test /f
FOR /F "delims=" %%i in ('net user') do @echo %%i
pause

