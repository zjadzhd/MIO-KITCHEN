
if exist product\media\bootanimation.zip (
set sr="product"
) else (
if exist system\build.prop  set sr="system"
if exist system\system\build.prop set sr="system\system"
!rm! -rf vendor\data-app
!rm! -rf product\data-app
)
echo 处理data路径：!sr!
echo 处理毒瘤替换毒瘤文件！
!rm! -rf !sr!\app\AnalyticsCore
echo     开始精简其他无用APP....
rem =====================精简system\app==============================
rem 官方recovery恢复文件 及 系统验证
!rm! -rf system\verity_key
!rm! -rf vendor\recovery-from-boot.p
!rm! -rf !sr!\recovery-from-boot.p
::车载CarWith
!rm! -rf !sr!\app\CarWith
::游戏 gamepal
!rm! -rf !sr!\app\appEmapal
::小爱翻译
!rm! -rf !sr!\app\AiAsstVision
::快应用服务框架
!rm! -rf !sr!\app\HybridAccessory
!rm! -rf !sr!\app\HybridPlatform
::logd 获取
rem !rm! -rf !sr!\app\MiuiBugReport
::系统升级
!rm! -rf !sr!\app\Updater
!rm! -rf !sr!\app\MiuiUpdater
::内置app启动广告服务
!rm! -rf !sr!\app\MSA
!rm! -rf !sr!\app\Msa
!rm! -rf !sr!\app\msa
!rm! -rf !sr!\app\MSa
!rm! -rf !sr!\app\mab
rem 小米音乐
!rm! -rf !sr!\app\Music
rem =====================精简system\piiv-app==============================
rem 小米服务
!rm! -rf !sr!\priv-app\MIUIVipService
!rm! -rf !sr!\priv-app\MIService
::小米视频 音乐
!rm! -rf !sr!\priv-app\MiuiVideo
!rm! -rf !sr!\priv-app\MIUIMusic
!rm! -rf !sr!\priv-app\Music
::游戏服务
::!rm! -rf !sr!\priv-app\MiGameCenterSDKService
::桌面快捷搜索
!rm! -rf !sr!\priv-app\MIUIQuickSearchBox
!rm! -rf !sr!\priv-app\QuickSearchBox
::我得服务
!rm! -rf !sr!\priv-app\MIUIVipService
rem 精简data-app
set "rmm=!sr!\data-app\com*"
for /f "delims=" %%a in ('dir /b /s "%rmm%"') do (
echo    清理%%~a
!del! %%~a
)
echo  com.*  推广广清理完毕
!rm! -rf !sr!\data-app\MiuiHealth
!rm! -rf !sr!\data-app\MIUINewHome_Removable
!rm! -rf !sr!\data-app\MIRadio
!rm! -rf !sr!\data-app\MIMediaEditor
!rm! -rf !sr!\data-app\BaiduIME
!rm! -rf !sr!\data-app\O2O
!rm! -rf !sr!\data-app\WaliLive
!rm! -rf !sr!\data-app\cn.wps.moffice_eng
!rm! -rf !sr!\data-app\MiLens
!rm! -rf !sr!\data-app\MiDrop
!rm! -rf !sr!\data-app\XMPass
!rm! -rf !sr!\data-app\miuivideoflobal
!rm! -rf !sr!\data-app\MiMobileNoti
!rm! -rf !sr!\data-app\freereader
!rm! -rf !sr!\data-app\NewHomeForL2L3
!rm! -rf !sr!\data-app\XMRemoteController
!rm! -rf !sr!\data-app\wps-lite
!rm! -rf !sr!\data-app\ctrip.android.view_124
!rm! -rf !sr!\data-app\SmartHome
!rm! -rf !sr!\data-app\VipAccountPad
!rm! -rf !sr!\data-app\MIUIVirtualSim
!rm! -rf !sr!\data-app\MIUIDuokanReader
!rm! -rf !sr!\data-app\MIUISmartTravel
!rm! -rf !sr!\data-app\Health
!rm! -rf !sr!\data-app\Userguide
!rm! -rf !sr!\data-app\Email
!rm! -rf !sr!\data-app\Huanji
!rm! -rf !sr!\data-app\VipAccount
!rm! -rf !sr!\data-app\MIUIVipAccount
!rm! -rf !sr!\data-app\GameCenter
!rm! -rf !sr!\data-app\GoogleContactsSyncAdapter
!rm! -rf !sr!\data-app\MiFinance
!rm! -rf !sr!\data-app\MIGalleryLockscreen
!rm! -rf !sr!\data-app\MiLiveAssistant
!rm! -rf !sr!\data-app\MiShop
!rm! -rf !sr!\data-app\MiuiDriveMode
!rm! -rf !sr!\data-app\MIUIEmail
!rm! -rf !sr!\data-app\MIUIHuanji
!rm! -rf !sr!\data-app\NewHome
!rm! -rf !sr!\data-app\SmartTravel
!rm! -rf !sr!\data-app\ThirdAppAssistant
!rm! -rf !sr!\data-app\tv.danmaku.bili_26
!rm! -rf !sr!\data-app\Youpin
!rm! -rf !sr!\data-app\MIUIGameCenter
!rm! -rf !sr!\data-app\MIUIYoupin
!rm! -rf !sr!\data-app\VirtualSim
!rm! -rf !sr!\data-app\MIUINewHome
!rm! -rf !sr!\data-app\MIUIXiaoAiSpeechEngine
echo.
echo     精简无用APP完毕......