chcp 65001

@echo off 
choice /C dme /M "defrag,mem,end"
if errorlevel 3 goto end
if errorlevel 2 goto mem 
if errotlevel 1 goto defrag
 
:defrag 
echo test defrag function 
goto end
 
:mem 
echo test mem function
goto end
 
:end 
echo good bye