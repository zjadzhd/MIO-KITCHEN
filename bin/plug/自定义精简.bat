@echo off
for /f %%i in (%~dp0jjlb.txt) do (
	echo.正在删除：%%i
	!rm! -rf %%i||echo.删除%%i失败
)
for /f "delims=" %%a in ('dir /b /s "data-app\com*"') do (
echo - 正在清理%%~a&!rm! -rf %%~a )
pause