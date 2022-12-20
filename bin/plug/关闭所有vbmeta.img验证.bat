for %%n in ("vbmeta.img vbmeta_system.img vbmeta_vendor.img") do (
for /f "delims=" %%a in ('dir /b /s "%%n" 2^>nul') do (
echo - 正在关闭%%~na校验
%sed% -i 's/\x00\x00\x00\x00\x00\x61\x76\x62\x74\x6F\x6F\x6C\x20\x31\x2E\x31\x2E\x30/\x02\x00\x00\x00\x00\x61\x76\x62\x74\x6F\x6F\x6C\x20\x31\x2E\x31\x2E\x30/g' "%%~a"
if "!errorlevel!"=="1" (echo. - 关闭%%~a效验失败 ) else (echo. - 关闭%%~a效验成功 )
)
)