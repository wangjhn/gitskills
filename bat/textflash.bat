chcp 65001
@echo off
setlocal enabledelayedexpansion
 
set str=床前明月光 疑是地上霜 举头望明月 低头思故乡
for %%i in (%str%) do (
	set char=%%i
	echo.
	echo.
	for /l %%j in (0,1,5) do (
	set/p=!char:~%%j,1!<nul
	ping -n 0 127.0.0.1>nul
	)
	call :hero %%i
)
pause>nul
 
:hero
for /l %%k in (1,1,10) do (
	ping /n 0 127.0.0.1>nul
	set /p a=<nul
	set /p a= <nul
	set /p a=<nul
	ping /n 0 127.0.0.1>nul
	set /p a=%1<nul
)
goto :eof