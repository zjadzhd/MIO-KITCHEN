if "!modbj!"=="1" (exit /b 0)
if exist boot\ramdisk\verity_key (%busybox% rm -rf boot\ramdisk\verity_key)
if exist boot\ramdisk\fstab.* for /f "delims=" %%a in ('dir /b /s "boot\ramdisk\fstab.*"') do (
echo. - 已检测到boot下%%~nxa挂载文件，正在去除AVB
%sed% -i 's/,avb_keys=\/avb\/q-gsi.avbpubkey:\/avb\/r-gsi.avbpubkey:\/avb\/s-gsi.avbpubkey//g' boot\ramdisk\%%~nxa
%sed% -i 's/,avb//g'  boot\ramdisk\%%~nxa
%sed% -i 's/=vbmeta_system//g'  boot\ramdisk\%%~nxa
%sed% -i 's/fileencryption/encryptable/g'  boot\ramdisk\%%~nxa
%sed% -i 's/=vbmeta//g'  boot\ramdisk\%%~nxa
)
if exist vendor\etc\fstab.* for /f "delims=" %%a in ('dir /b "vendor\etc\fstab.*"') do (
echo - 已检测到系统分区下%%~nxa挂载文件
echo - 正在去除AVB2.0效验
%sed% -i 's/,avb_keys=\/avb\/q-gsi.avbpubkey:\/avb\/r-gsi.avbpubkey:\/avb\/s-gsi.avbpubkey//g'  vendor\etc\%%~nxa
%sed% -i 's/,avb//g'  vendor\etc\%%~nxa
%sed% -i 's/=vbmeta_system//g'  vendor\etc\%%~nxa
%sed% -i 's/fileencryption/encryptable/g'  vendor\etc\%%~nxa
%sed% -i 's/=vbmeta//g'  vendor\etc\%%~nxa
)
if exist boot\ramdisk\system\etc\*.fstab for /f "delims=" %%a in ('dir /b "boot\ramdisk\system\etc\*.fstab"') do (
echo - 已检测到vab_boot目录下%%~nxa挂载文件
echo - 正在去除AVB2.0效验
%sed% -i 's/,avb_keys=\/avb\/q-gsi.avbpubkey:\/avb\/r-gsi.avbpubkey:\/avb\/s-gsi.avbpubkey//g' boot\ramdisk\system\etc\%%~nxa
%sed% -i 's/,avb//g'  boot\ramdisk\system\etc\%%~nxa
%sed% -i 's/=vbmeta_system//g'  boot\ramdisk\system\etc\%%~nxa
%sed% -i 's/fileencryption/encryptable/g' boot\ramdisk\system\etc\%%~nxa
%sed% -i 's/=vbmeta//g' boot\ramdisk\system\etc\%%~nxa
)