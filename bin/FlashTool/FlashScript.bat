@ECHO OFF
setlocal enabledelayedexpansion
color 3f
title 米欧官改线刷脚本
mode con cols=50 lines=20
set fastboot=%cd%\bin\fastboot
set zstd=%cd%\bin\zstd
set sg=1^>nul 2^>nul
set /p fqlx=<META-INF/ota
:HOME
cls
ECHO.    Mio-MIUI
echo.一眼顶真，鉴定为动态!fqlx!分区
ECHO.[1].保留全部数据刷入
ECHO.[2].格式化用户数据
ECHO.[3].格式化全部数据(有时候无效)
ECHO.[5].安装驱动程序
ECHO.手机必须为Bootloader模式, 正在等待设备
for /f "tokens=2" %%a in ('!fastboot! getvar product 2^>^&1^|find "product"') do set DeviceCode=%%a
ECHO.发现设备:[!DeviceCode!]
set /p zyxz=请选择你要操作的项目：
if "!zyxz!" == "1" set xz=1&goto FLASH
if "!zyxz!" == "2" set xz=2&goto FLASH
if "!zyxz!" == "3" set xz=3&goto FLASH
if "!zyxz!" == "5" call :install-qd
goto HOME&pause
:FLASH
cls
if exist images/super.img.zst (echo.正在转换super&!zstd! --rm -d images/super.img.zst -o images/super.img) else (if not exist images/super.img (call :JG))
if "!fqlx!"=="A" (
for /f "delims=" %%b in ( 'dir /b images ^| findstr /v /i "super.img" ^| findstr /v /i "preloader_raw.img" ^| findstr /v /i "cust.img"' ) do (
echo 正在刷入%%~nb分区文件！
!fastboot! flash %%~nb images\%%~nxb %sg%
echo 刷入%%~nb完成
)
) else (
for /f "delims=" %%b in ( 'dir /b images ^| findstr /v /i "super.img" ^| findstr /v /i "preloader_raw.img" ^| findstr /v /i "cust.img"' ) do (
echo 正在刷入%%~nb分区文件！
!fastboot! flash %%~nb_a images\%%~nxb %sg%
!fastboot! flash %%~nb_b images\%%~nxb %sg%
echo 刷入%%~nb完成
))
if exist images\cust.img !fastboot! flash cust images\cust.img
if exist images\preloader_raw.img (
!fastboot! flash preloader_a images\preloader_raw.img !sg!
!fastboot! flash preloader_b images\preloader_raw.img !sg!
!fastboot! flash preloader1 images\preloader_raw.img !sg!
!fastboot! flash preloader2 images\preloader_raw.img !sg!
)
echo 开始刷入SUPER
!fastboot! flash super images\super.img
if "!xz!" == "1" echo 已保留全部数据,准备重启！
if "!xz!" == "2" (echo 正在格式化DATA
!fastboot! erase userdata
!fastboot! erase metadata)
if "!xz!" == "3" (
echo 正在格式化所有用户数据
!fastboot! -w)
if "!fqlx!"=="AB" (!fastboot! set_active a %sg%)
!fastboot! reboot
echo.刷机完毕 感谢使用米欧官改工具
pause
exit
:install-qd
if "!PROCESSOR_ARCHITECTURE!" equ "x86" (start 驱动\DPInst32.exe) else (start 驱动\DPInst64.exe)
exit /b 0
:JG
color 4f
ECHO.未发现Super镜像，继续刷入可能会损坏设备
set /p jx=继续吗[Y/N]
if "!jx!"=="N" exit&exit
exit /b 0