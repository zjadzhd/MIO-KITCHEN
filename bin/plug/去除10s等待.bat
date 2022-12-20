set "saa=system\system\priv-app"
if exist %saa%\SecurityCenter\SecurityCenter.apk set ne=SecurityCenter
if exist %saa%\MIUISecurityCenter\MIUISecurityCenter.apk set ne=MIUISecurityCenter
if not exist %saa%\%ne%\%ne%.apk echo 找不到安全中心的包名！&goto end
Setlocal Disab%sc%ledelayedexpansion&cls
!rm! -rf %saa%\%ne%\11
mkdir %saa%\%ne%\11
if exist %saa%\%ne%\%ne% (echo 发现残留文件 正在清除！&robocopy %saa%\%ne%\11 %saa%\%ne%\%ne% /purge)
echo 开始反编译安全中心！
%java% -jar %apktool% d -r -o %saa%\%ne%\%ne% %saa%\%ne%\%ne%.apk -f
echo 反编译完成，开始祛除10秒安全等待
set "sma=smali_classes2\com\miui\permcenter\privacymanager"
if exist %saa%\%ne%\%ne%\%sma%\g.smali (
%sed% -i "s!const\/4 v0, 0x5!const\/4 v0, 0x0!" "%saa%\%ne%\%ne%\%sma%\g.smali"
%sed% -i "s!const\/16 v0, 0xa!const\/16 v0, 0x0!" "%saa%\%ne%\%ne%\%sma%\i.smali"
) else (
%sed% -i "s!const\/4 v0, 0x5!const\/4 v0, 0x0!" "%saa%\%ne%\%ne%\%sma%\InterceptBaseFragment.smali"
%sed% -i "s!const\/16 v0, 0xa!const\/16 v0, 0x0!" "%saa%\%ne%\%ne%\%sma%\InterceptPermissionFragment.smali"
)
echo 祛除完毕，正在回编译%ne%！
%java% -jar %apktool% b -o %saa%\%ne%\%ne%.zip -c %saa%\%ne%\%ne% -f
if exist %saa%\%ne%\%ne%.zip !rm! -rf %saa%\%ne%\%ne%.apk
%zipalign% -p -f -v 4 %saa%\%ne%\%ne%.zip %saa%\%ne%\%ne%.apk
robocopy %saa%\%ne%\11 %saa%\%ne%\%ne% /purge
%rm% -rf %saa%\%ne%\oat
%rm% -rf %saa%\%ne%\%ne%.zip
%rm% -rf %saa%\%ne%\11
%rm% -rf %saa%\%ne%\%ne%
echo 回编译完成！
:end
setlocal enabledelayedexpansion