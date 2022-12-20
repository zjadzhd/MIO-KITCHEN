@echo off
if "%modbj%"=="1" (exit /b 0)
ECHO.合并TWRP到BOOT
if exist boot.img (echo.发现BOOT，可以合并) else (ECHO.未发现BOOT)
ECHO.请选择RAMDISK文件
for /f %%i in ('!cwj!') do (set ramdisk=%%i)
if /i "%ramdisk%"=="" (ECHO.文件不存在&exit /b 0)
if not exist %ramdisk% (ECHO.文件不存在&exit /b 0)
%magiskboot% unpack ./boot.img
!busybox! cp -rf %ramdisk% ramdisk.cpio
%magiskboot% repack ./boot.img
ECHO.合并完成
exit /b 0