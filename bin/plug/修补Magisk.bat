:Patch_boot
if not exist boot.img (
	ECHO.未发现boot
	!busybox! sleep 2
	exit /b 0
)
if exist "%local%\bin\Magisk\Magisk.apk" (
echo 正在修补boot.img
!busybox! unzip %local%\bin\Magisk\Magisk.apk -od %local%\bin\Magisk\ lib/armeabi-v7a/*
!busybox! unzip %local%\bin\Magisk\Magisk.apk -od %local%\bin\Magisk\ lib/arm64-v8a/*
!rm! -rf "%local%\bin\Magisk\magisk64"
!rm! -rf "%local%\bin\Magisk\magisk32"
!rm! -rf "%local%\bin\Magisk\magiskinit"
if exist "%local%\bin\Magisk\lib\arm64-v8a\libmagisk64.so" !busybox! cp -r  "%local%\bin\Magisk\lib\arm64-v8a\libmagisk64.so" "%local%\bin\Magisk\magisk64" %slog%
if exist "%local%\bin\Magisk\lib\arm64-v8a\libmagiskinit.so" !busybox! cp -r  "%local%\bin\Magisk\lib\arm64-v8a\libmagiskinit.so" "%local%\bin\Magisk\magiskinit" %slog%
if exist "%local%\bin\Magisk\lib\armeabi-v7a\libmagisk32.so" !busybox! cp -r  "%local%\bin\Magisk\lib\armeabi-v7a\libmagisk32.so" "%local%\bin\Magisk\magisk32" %slog%
%rm% -rf %local%\bin\Magisk\lib)
cd %local%
!busybox! ash %local%\bin\Magisk\boot_patch.sh %local%\%xmmc%\boot.img
!rm! -rf %xmmc%\boot.img
!busybox! sleep 2
move new-boot.img %xmmc%\boot.img
cd %xmmc%
if exist boot.img (echo 修补完成) else (echo 生成失败...)
exit /b 0