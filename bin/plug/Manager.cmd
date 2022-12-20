@echo off
::插件管理器
:cj
cls
set cj=
for /f "delims=" %%a in ('dir /b "%local%\bin\plug\*.bat" "%local%\bin\plug\*.exe" "%local%\bin\plug\*.sh"') do (
 set /a num+=1
 echo [!num!].%%~na 
 set g!num!=%%~nxa
)
set num=<nul
echo.%t38%
echo.[01].%t20% %t39% [02].%t102% %t39% 
set /p cj=%t37%
if "!cj!"=="88" exit /b 0
if "!cj!"=="01" goto :del
if "%cj%"=="02" goto :isz
if "%cj%"=="" Goto :cj
if "!g%cj%:~-3!"==".sh" (!busybox! bash %local%\bin\plug\!g%cj%! %cd%) else (call !local!\bin\plug\!g%cj%!)
goto :cj
:del
set /p xh=%t39%--^>
if "!g%xh%!"=="" pause&goto :cj
if exist !local!\bin\plug\!g%xh%! !rm! -rf !local!\bin\plug\!g%xh%!
echo.完成
goto :cj
:isz
set cj=
for /f %%i in ('!cwj!') do (set cj=%%i)
if "%cj%"=="" (goto :cj)
if not exist %cj% (goto :cj)
call :install %cj%
:install
cls
set kzm=%~x1
if "%kzm%"==".mpk" (echo.米欧标准插件包) else (goto :cj)
echo.正在解析安装包:%1
for /f %%i in ('!busybox! sed -n 1p %1') do (set origdata=%%i)
for /f "tokens=1-4 delims=@" %%i in ("%origdata%") do (
set c1=%%i&set c2=%%j&set c3=%%k&set c4=%%l)
echo.%fgf%
echo.插件名称:!c1!
echo.插件版本号:!c2!
echo.插件作者:!c3!
echo.插件介绍:!c4!
echo.%fgf%
set /p anzhuang=要安装此插件吗?[1/0]
if /i "%anzhuang%"=="1" (
type %1>%~nx1
!jycx! x %~nx1 -o!local! -aoa 1>nul 2>nul||echo.安装失败&!rm! -rf %~nx1&pause&goto :cj
!rm! -rf %~nx1
echo.%t47%) else (echo.Error)
pause
goto :cj