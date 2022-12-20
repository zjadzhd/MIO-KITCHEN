echo - 开始精简无用APP....
rem system/app精简列表
set system_app=AnalyticsCore AiAsstVision HybridAccessory HybridPlatform MaintenanceMode MiuiBugReport PaymentService MSA Msa msa MSa Music mab
rem 精简system\app
!rm! -rf system\verity_key
!rm! -rf vendor\recovery-from-boot.p
!rm! -rf system\system\recovery-from-boot.p
for %%j in ("system_app") do (!rm! -rf system\system\app\%%j)
rem 精简priv-app
!rm! -rf system\system\priv-app\MIService
!rm! -rf system\system\priv-app\MiuiVideo
!rm! -rf system\system\priv-app\MIUIQuickSearchBox
!rm! -rf system\system\priv-app\QuickSearchBox
!rm! -rf vendor\data-app
!rm! -rf product\data-app
!rm! -rf system\data-app
rem 精简data-app
set "rmm=system\system\data-app\com*"
for /f "delims=" %%a in ('dir /b /s "%rmm%"') do (
echo - 正在清理%%~a&!rm! -rf %%~a )
for /f %%a in ('dir /b /s system\system\data-app\*') do (
echo. - 正在删除%%a&!rm! -rf %%a)
echo - 精简无用APP完毕......