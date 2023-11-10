@echo off
REM 获取当前日期和时间
for /F "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set year=%%d
    set month=%%b
    set day=%%c
)
set hour=%time:~0,2%
set minute=%time:~3,2%
set datetime=%year%-%month%-%day%_%hour%-%minute%

REM 替换日期和时间中的特殊字符为下划线
set datetime=%datetime:/=_%
set datetime=%datetime::=_%
set datetime=%datetime:.=_%

REM 生成文件名
set filename=report__%datetime%.html

xray_windows_amd64.exe webscan --listen 127.0.0.1:7776 --html-output %filename%