@echo off
setlocal enabledelayedexpansion&!cecho! {0e}
if exist system\system\build.prop set bui=system\system\build.prop
if exist system\build.prop set bui=system\build.prop
for /f "eol=# tokens=1-3* delims==" %%1 in (!bui!) do (
if %%1==ro.build.version.sdk set SDK=%%2
)
if "%SDK%"=="" echo 检测不到安卓版本！！按任意键返回! & goto 111
if "%SDK%"=="31" echo 检测到为安卓12，跳过破解卡米！按任意键返回！& goto 111
if "%SDK%"=="29" echo 检测到为安卓10，开始破解卡米 & goto :start
if "%SDK%"=="30" echo 检测到为安卓11，开始破解卡米 & goto :start
if %SDK% lss 29 echo 本插件不适用安卓9及其以下破解卡米！按任意键返回！ & goto 111
if %SDK% gtr 31 echo 本插件暂不适配安卓13及其以上版本！按任意键返回！ & goto 111
:start
if exist system\framework\services.jar set saa=system\framework
if exist system\system\framework\services.jar set saa=system\system\framework
if exist %saa%\services.jar set sar=%saa%\services\smali_classes2\com\miui\server\SecurityManagerService.smali
if exist %saa%\services.jar set sar=%saa%\services\smali_classes2\com\miui\server\SecurityManagerService.smali
%busybox% rm -rf %saa%\11 >nul
mkdir %saa%\11 >nul
if exist %saa%\services (robocopy %saa%\11 %saa%\services /purge >nul)
echo 开始反编译services.jar
%java% -jar %apktool% d -r -o %saa%\services %saa%\services.jar -f
echo 反编译完成，祛除删减app卡密权限中
setlocal Disabledelayedexpansion
%sed% -i '/^.method private checkSystemSelfProtection(Z)V/,/^.end method/{//!d}'  "%sar%"
%sed% -i -e '/^.method private checkSystemSelfProtection(Z)V/a\    .locals 1\n\n    return-void' "%sar%"
echo 祛除完毕，正在回编译services
%java% -jar %apktool% b -o %saa%\services.jar %saa%\services -f
robocopy %saa%\11 %saa%\services /purge >nul
%busybox% rm -rf %saa%\11 >nul
%busybox% rm -rf %saa%\services >nul
echo 回编译完成
:111
setlocal enabledelayedexpansion