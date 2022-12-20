@echo off
title MIO-KITCHEN
::DXY抄袭此批处理，他老婆就给他戴绿帽子，他女朋友就和他分手
::DXY及其附属成员不得使用任何依赖，用了DXY死全家
::DXY圈钱行为我们有目共睹
rem Batch by MIO
:load
setlocal enabledelayedexpansion
cd %~dp0
set zl=%1
set cjgl=!cd!\bin\plug\Manager.cmd
mode con cols=60 lines=32
set angxjb=META-INF/com/google/android/update-binary
set setsave=%cd%\bin\setting.ini
for /f  %%u in ('findstr /v /b "@" %setsave%') do (set "%%u")
if "!debug!"=="0" (set slog=) else (set slog=1^>nul 2^>nul)
set bls=!busybox! ls
set du=!busybox! du
if not exist bin\language\%language_u%.txt (
set qyts=Set your language
call :set_language
goto :load
) else (
set ln=1
for /f %%l in (bin\language\%language_u%.txt) do (
set "t!ln!=%%l"
set /a ln=!ln!+1
)
if "!zl!" == "" goto :hm
if exist !zl! (call :jbz !zl!)
goto :hm)
:hm
set sparse=0
for /f %%u in ('findstr /v /b "@" %setsave%') do set "%%u"
for %%i in (romxa xz rom zyxz romdz xmmc modbj xz zl) do (set %%i=)
set dat=1
set br=1
set dbzl=0
cls
echo.%fgf%
!figlet! -f !figletfont! !zywz!|!lolcat!
echo. %local%
echo.%fgf%
echo.  %t1%
echo.%fgf%
set nuu=1
for /f %%a in ('dir /a:d /b^|findstr /v bin') do (
echo [!nuu!] [%%a] |!iconv! -f gbk -t utf-8|!lolcat!
set g!nuu!=%%a
set /a nuu=!nuu!+1
)
echo.%fgf%
echo.%PROCESSOR_ARCHITECTURE%
echo.Super %t65%=!supers!
echo.%fgf%
echo.[22].%t3% [33].%t31%
if "!lwms!"=="ON" (echo.[44].%t24% [55].%t74%)
echo.[88].%t73% [99].%t26%
echo.[00].%t21% [01].%t4%
set /p zyxz=%t7%
if "%zyxz%"=="00" goto :delxm
if "%zyxz%"=="22" call :jbsz
if "%zyxz%"=="33" goto :mp
if "%zyxz%"=="44" goto :download-rom
if "%zyxz%"=="55" goto :hqmiui
if "%zyxz%"=="66" call :cu
if "%zyxz%"=="88" goto :miui-mod
if "%zyxz%"=="99" call :setting
if "%zyxz%"=="01" exit
if exist !zyxz! (call :jbz !zyxz!)
if exist !g%zyxz%! (set xmmc=!g%zyxz%!&cd !g%zyxz%!&goto :menu)
echo.%t5%&pause&goto :hm
:delxm
set /p xmmcd=%t16%
for %%i in (!xmmcd!) do (
if "%%i"=="" (call :er Project)
if exist !g%%i! (echo.%t51%!g%%i!&!rm! -rf !g%%i!)
)
goto :hm
:hqmiui
call :tgui !t83! !t83! Device Device
if "!Device!"=="" (pause&goto :hqmiui)
ECHO.%t79%...
set sfxz=
for /f "tokens=*" %%i in ('!busybox! bash bin\getRecoveryROM.sh !Device!') do (
	echo.%t80%:%%i
	set /p sfxz=%t81%[Y/N] %t82%[M] --^>
	if "!sfxz!"=="M" (set dbzl=1&set modbj=1&set xzlj=%%i&goto :download)
	if "!sfxz!"=="Y" (set xzlj=%%i&call :download)
)
pause
goto :hm
:mp
cd %local%
call :tgui %t17% %t17% New xjxm
if exist !xjxm! (echo.%t11%&goto :mp)
if "!xjxm!"=="" goto :hm
md !xjxm!
goto :hm
:bandizip
if "%1"=="j" (!bz! x %2 %3 %slog% || goto :hm)
if "%1"=="d" !bz! a -r -aoa !local!\%2.zip !cd!\* %slog%
exit /b 0
:p7zip
if "%1"=="j" (!p7zip! x %2 -o./%3/ -y %slog% || goto :hm)
if "%1"=="d" !p7zip! a -tzip !local!\%2.zip !cd!\* %slog%
exit /b 0
:jbsz
set romxa=&set rom=
for /f %%i in ('!zenity! --file-selection --title="%t7%ROM"') do (set rom=%%i)
if "!rom!"=="bin" (echo.%t14%&goto :jbsz)
if "!rom!"=="" (call :er ROM)
if not exist %rom% (call :er ROM)
call :jbz %rom%
:jbz
set kzm=%~x1
set kzms=%~x1
for /f %%i in ('echo%~x1^|!busybox! tr a-z A-Z') do (set kzms=%%i)
if exist %~n1 (set xmmc=%~n1_%time:~9,2%) else (set xmmc=%~n1)
echo.%t19%%xmmc%
echo %t10% [%kzms%]:%~nx1
if "%2"=="link" (set zqlj=) else (set zqlj=%~dp1)
if "!kzm!"==".img" (md !xmmc!
move !zqlj!%~nx1 %xmmc%)
if "!kzm!"==".ozip" (!pybox! ozip2zip !zqlj!%~nx1&!rm! -rf %~nx1&set kzm=.zip)
if "!kzm!"==".ops" (!opscrypto! decrypt !zqlj!%~n1.ops&set kzm=.zip)
if "!kzm!"==".ofp" (
	set /p clqlx=%t49%？[MTK/QC]
	if "!clqlx!"=="MTK" (!pybox! ofp_mtk_decrypt !zqlj!%~n1.ofp %xmmc%) else (!pybox! ofp_qc_decrypt !zqlj!%~n1.ofp %xmmc%))
if "!kzm!"==".zip" (mkdir !xmmc!&call :!yscx! j !zqlj!%~n1!kzm! !xmmc!)
if "!kzm!"==".md5" (mkdir !xmmc!&call :!yscx! j !zqlj!%~n1!kzm! !xmmc!)
if "!zqlj!"=="" (
	if exist %~n1%kzm% (!rm! -rf %~n1%kzm%)
	if exist %~nx1 (!rm! -rf %~nx1))
cd %cd%\%xmmc%\
:jb
if exist UPDATE.APP (
	echo.%t9% [APP]:UPDATE.APP
	!splituapp! -f ./UPDATE.APP %slog%
	if exist UPDATE.APP del UPDATE.APP
	if exist super.img (!simg2img! super.img super_raw.img
	del super.img
	move super_raw.img super.img)
	if exist super_2.img (!simg2img! super_2.img super_2_raw.img
	del super_2.img
	move super_2_raw.img super_2.img)
	)
if exist images (!mv! images/* ./)
if exist super.img.zst (!zstd! --rm -d super.img.zst -o super.img)
if exist super.dxy (!zstd! --rm -d super.dxy -o super.img)
if exist system.new.dat.1 (
echo.vivo>vivo
for /f %%h in ('dir /b *.new.dat'^|!sed! 's/.new.dat//g') do (
echo.%%h
if exist %%h.new.dat.1 (
ECHO.%t46% %%h
set fd=1
for /f %%a in ('!ls! -d %%h.new.dat.*') do (
	set fdjx=!fdjx! %%h.new.dat.!fd!
	set /a fd=!fd!+1
	)
type %%h.new.dat !fdjx!>%%h.new.dat2
!rm! -rf %%h.new.dat.*
!rm! -rf %%h.new.dat
move %%h.new.dat2 %%h.new.dat
set fdjx=&set fd=1
)
)
)
for /f %%h in ('dir /b *.lz4 2^>nul') do (
if exist %%h (
	echo.%t9% [LZ4]:%%h
	!lz4! -d %%h %%~nh
!rm! -rf %%h))
if exist payload.bin (
	echo %t9% [Payload]:payload.bin
	!payloadunpack! -o !cd! !cd!\payload.bin
	ECHO.2>supersz
	if exist boot.img !rm! -rf payload.bin)
if exist super.img (
	echo %t9% [Super]:Super.img
	for /f "delims=" %%h in ('!xxd! -p -l 4 super.img 2^>nul') do ( if "%%h"=="3aff26ed" (call :simg2img super))
	for /f "delims=" %%h in ('!xxd! -p -l 4 super_2.img 2^>nul') do ( if "%%h"=="3aff26ed" (call :simg2img super_2))
	if exist super.img  %lpunpack% %cd%\super.img %cd%  %slog%
	if exist super_2.img  %lpunpack% %cd%\super_2.img %cd% %slog%
	if exist system_a.img (
		ECHO.2>supersz
		!rm! -rf super.img
		!rm! -rf super_2.img
		for /f %%i in ('!bls! "*_a.img"^|!sed! 's/_a//g'') do  (ren %%~ni_a.img %%~ni.img )
	) else (
		ECHO.1>supersz
		!rm! -rf super.img
		!rm! -rf super_2.img
)
)
if exist system.img_sparsechunk* (
	ECHO.%t46% system.img_sparsechunk^*
	for %%a in (system.img_sparsechunk*) do (!sparse2img! %%a system.img))
for /f %%k in ('dir /b *.new.dat.br *.new.dat *.img 2^>nul ^|!sed! 's/.new.dat//g' ') do (
if not exist config (md config)
if exist %%~nk.new.dat.br echo %t9% [BR]:%%~nk.new.dat.br&%brotli% -dj %%~nk.new.dat.br
if exist %%~nk.new.dat (
echo %t9% [DAT]:%%~nk.new.dat
!pybox! sdat2img %%~nk.transfer.list %%~nk.new.dat %%~nk.img %slog%
if exist %%~nk.img del %%~nk.new.dat %%~nk.transfer.list %%~nk.patch.dat )
if exist %%~nk.img for /f "delims=" %%h in ('!xxd! -p -l 4 %%~nk.img ') do ( if "%%h"=="3aff26ed" (call :simg2img %%~nk ))
if exist %%~nk.img for /f "delims=" %%e in ('!xxd! -p -s "!erofsoff!" -l !len! %%~nk.img ') do ( if "%%e"=="!erofsmagic!" (
ECHO.%t9% [IMG-EROFS]:%%~nk.img
!erofsUnpack! %%~nk.img %cd%\ > config\%%~nk_erofs
if exist %%~nk !rm! -rf %%~nk.img ))
if exist %%~nk.img for /f "delims=" %%w in ('!xxd! -p -s "!ext4off!" -l !len! %%~nk.img ') do (
if "%%w"=="!ext4magic!" (
ECHO.%t9% [IMG-EXT]:%%~nk.img
!pybox! imgextractor %%~nk.img %cd%\ %slog%
if exist %%~nk !rm! -rf %%~nk.img ))
)
if "!modbj!"=="1" (goto :zdxg) else (goto :menu)
:simg2img
ECHO.%t9% [SPARSE]:%1.img
!simg2img! %1.img %1_raw.img
if exist %1_raw.img (!rm! -rf %1.img)
move %1_raw.img %1.img
exit /b 0
:miui-mod
cls
set modbj=
echo.%t84%
if "!lwms!"=="ON" (echo.[1].%t86%)
echo.[2].%t85%
set /p miuixz=!t7!
set modbj=1
if "!miuixz!"=="1" (set /p xzlj=%t71% %t80%:&goto :download)
if "!miuixz!"=="2" (goto :jbsz)
goto :hm
:menu
cls
set xz=&set zl=&set dat=1&set br=1&set dbzl=0&set sparse=0&set payload=0
for /f %%i in ('dir /b /s system\build.prop 2^>nul') do set buildinfo=%%i
if "%buildinfo%"=="" set buildinfo=Unknow
!cecho! {0b}
if exist %buildinfo% (
	echo.%fgf%
	for /f "eol=# tokens=1-3* delims==" %%1 in (%buildinfo%) do (
	if %%1==ro.miui.ui.version.name echo.%t87%:%%2
	if %%1==ro.build.version.sdk echo.%t88%:%%2
	if %%1==ro.build.version.release echo.%t89%:%%2
	if %%1==ro.product.locale echo.%t90%:%%2
	if %%1==ro.product.model echo.%t91%:%%2
	if %%1==ro.dolby.model echo.%t91%:%%2
	if %%1==ro.product.name echo.%t92%:%%2
	if %%1==ro.dolby.device echo.%t92%:%%2
	if %%1==ro.product.cpu.abi echo.%t93%：%%2
	)
	echo.%fgf%
)
!cecho! {0a}!t19!%xmmc%{#}{\n}
set romdz=%cd%
!cecho! {0e}[11].%t23% [22].%t20% %xmmc%{\n}
echo.[33].%t35% [44].%t30%
echo.[05].%t58% boot [55].%t57% boot
echo.[06].%t58% dtbo [66].%t57% dtbo
echo.[07].%t58% logo [77].%t57% logo
echo.[08].%t57% super.img [88].%t73%
echo.[09].%t99% [99].%t59%
echo.[10].%t57% Image [12].%t57% DAT
echo.[13] %t57% Payload
!cecho! {0c}[0].%t22% {#}{\n}
!cecho! {07}
set /p xz=%t7%
if "!xz!"=="" cls&goto :menu
if "!xz!"=="11" set dbzl=1&call :dbrom
if "!xz!"=="22" cd %local%&echo.%t51%%romdz%&!rm! -rf %romdz%&goto :hm
if "!xz!"=="33" call !cjgl!
if "!xz!"=="44" call :jb
if "!xz!"=="05" call :jboot
if "!xz!"=="55" call :dboot
if "!xz!"=="06" call :jdtbo
if "!xz!"=="66" call :ddtbo
if "!xz!"=="07" call :jlogo
if "!xz!"=="77" call :dlogo
if "!xz!"=="08" set dat=0&goto :psuper
if "!xz!"=="88" set dbzl=1&set modbj=1&call :zdxg
if "!xz!"=="09" set modbj=1&call :dbrom
if "!xz!"=="99" call :tqdgjx
if "!xz!"=="10" set dat=0&goto :PIMG
if "!xz!"=="12" set br=0&call :dbrom
if "!xz!"=="0" cd %local%&goto :hm
if "!xz!"=="13" set payload=1&call :dbrom
pause
goto :menu
:loadsuper
for /f %%k in ('dir /b *.img 2^>nul^|!busybox! sed "s/dsp//g;s/vm-bootsys//g;s/cust//g"') do (
if exist %%~nk.img for /f "delims=" %%e in ('!xxd! -p -s "!erofsoff!" -l !len! %%~nk.img ') do (if "%%e"=="!erofsmagic!" (set superlb=%%~nk !superlb!))
if exist %%~nk.img for /f "delims=" %%e in ('!xxd! -p -s "!ext4off!" -l !len! %%~nk.img ') do (if "%%e"=="!ext4magic!" (set superlb=%%~nk !superlb!))
)
exit /b 0
:psuper
cls
if "!ssparse!"=="0" (set sparse_xz=ON) else (set sparse_xz=OFF)
echo.%t57%super
set superlb=
if exist !dtbj! (call :readsuper) else (call :loadsuper)
call :super-info
echo.[1].VAB [2].A-only
ECHO.[3].Sparse:%sparse_xz%
set /p sfqlx=%t60%？
if "!sfqlx!"=="1" echo.2>supersz&call :dbrom
if "!sfqlx!"=="2" echo.1>supersz&call :dbrom
if "!sfqlx!"=="3" (if "!ssparse!"=="0" (set ssparse=1) else (set ssparse=0)
goto :psuper)
goto :menu
:jlogo
for /f %%i in ('dir /b /s logo.img') do set logo=%%i
if "!logo!"=="" call :er LOGO menu
if exist !logo! (md logo&call !logo_dumper! !logo! extract %cd%\ %slog%) else (call :er LOGO menu)
exit /b 0
:dlogo
for /f %%i in ('dir /b /s logo.img') do set logo=%%i
if "!logo!"=="" call :er LOGO menu
if exist !logo! (call !logo_dumper! !logo! inject %cd%\ %slog%) else (call :er menu)
exit /b 0
:jdtbo
for /f %%i in ('dir /b /s dtbo.img') do (set dtbofile=%%i)
if "!dtbofile!"=="" (call :er !dtbofile! menu)
if not exist !dtbofile! (call :er !dtbofile! menu)
set csd=
!rm! -rf dtbo
mkdir dtbo\dtbo 2>nul
mkdir dtbo\dts 2>nul
!mkdtboimg! dump !dtbofile! -b %cd%\dtbo\dtbo\dtbo > %cd%\dtbo\dtbo_imageinfo.txt
if exist !dtbofile! (!rm! -rf !dtbofile!)
for /f "tokens=*" %%i in ('!bls! %cd%\dtbo\dtbo\') do (
if "!csd!"=="" set csd=-1
set /a csd=!csd!+1
echo %t97% dtbo.!csd!为dts.!csd!
!dtc! -@ -i "dtb" -O "dts" %cd%\dtbo\dtbo\dtbo.!csd! -o %cd%\dtbo\dts\dts.!csd! %slog%)
!rm! -rf %cd%\dtbo\dtbo
echo.Done!
exit /b 0
:ddtbo
if not exist %cd%\dtbo\dts\ call :er dts menu
set csd=&set wjs=
!rm! -rf %cd%\dtbo\dtbo
mkdir dtbo\dtbo
for /f "tokens=*" %%i in ('!bls! %cd%\dtbo\dts\') do (
if  "!csd!"=="" set csd=-1
set /a csd=!csd!+1
echo %t98% dts.!csd!为dtbo.!csd!
set wjs=!wjs! %cd%\dtbo\dtbo\dtbo.!csd!
!dtc! -@ -i "dts" -O "dtb" %cd%\dtbo\dts\dts.!csd! -o %cd%\dtbo\dtbo\dtbo.!csd! %slog%
)
!mkdtboimg! create %cd%\dtbo.img --page_size=4096 !wjs!
!rm! -rf dtbo
ECHO Done!
exit /b 0
:jboot
if exist boot (rd  /s /q boot)
mkdir boot
if exist boot.img (call !jboot! %cd%\boot.img) else (call :er boot menu)
exit /b 0
:dboot
if exist boot (call !dboot!) else (call :er boot menu)
exit /b 0
:jtdq
if exist config\%1_size.txt echo.%t32% [%t33%]:%1&set /p size=<"config\%1_size.txt"
if exist %1 !pybox! fspatch %1 config\%1_fs_config %slog%
exit /b 0
:dtdq
if exist %1 (
!pybox! fspatch %1 config\%1_fs_config %slog%
echo.%t32% [%t34%]:%1
for /f %%i in ('!busybox! du -sb !cd!\%1^|!busybox! cut -f 1') do (set ts=%%i)
if "!ts!"=="0" set ts=4096
for /f %%u in ('!rsize! !ts!') do (set size=%%u)
if exist !dtbj! (
!sed! -i "s/resize %1\s.*/resize %1 !size!/" !dtbj! %slog%
!sed! -i "s/# Grow partition %1 from 0 to\s.*/# Grow partition %1 from 0 to !size!/" !dtbj! %slog%
!sed! -i "s/resize %1_a\s.*/resize %1_a !size!/" !dtbj! %slog%
!sed! -i "s/# Grow partition %1_a from 0 to\s.*/# Grow partition %1_a from 0 to !size!/" !dtbj! %slog%)
)
exit /b 0
:readsuper
for /f "eol=# tokens=1-3* delims= " %%1 in (!dtbj!) do (
if %%1==add_group (set dbfz=%%2&set supers=%%3)
if %%1==resize (set superlb=%%2 !superlb!)
)
exit /b 0
:dbrom
if exist boot (call !dboot!)
cd %romdz%
if "!modbj!"=="1" (
set dbzl=1
set ssparse=1
if exist !dtbj! (
if exist META-INF !rm! -rf META-INF
!busybox! cp -r !local!/bin/FlashTool/* ./
echo.1>supersz))
if exist supersz (set sparse=1)
for /f %%a in ('dir /a:d /b 2^>nul') do (
if exist config\%%a_file_contexts (
if exist !dtbj! (call :dtdq %%a) else (
if exist supersz (if exist !dtbj! (call :dtdq %%a) else (call :dtdq %%a)) else (if not exist config\%%a_size.txt (call :dtdq %%a) else (call :jtdq %%a)))
if exist %%a if exist config\%%a_erofs (
echo.%t15% [IMG-EROFS]:%%a.img
!mkerofs! --mount-point %%a --fs-config-file config\%%a_fs_config --file-contexts config\%%a_file_contexts %%a.img %%a -z !erofsgs!
if exist %%a.img !rm! -rf %%a
) else (
if "!dbfs!"=="1" (call :mke2fs %%a) else (call :make_ext4fs %%a)
)
)
)
if exist vm.img (move vm.img vm-bootsys.img)
if exist supersz (
	if "!ssparse!"=="0" (set spa=--sparse) else (set spa=)
	set /p sf=<supersz
	set superlb=
	if exist !dtbj! (call :readsuper)
	echo.%t15% [Super]:super.img
if exist super (!rm! -rf super&md super) else (md super)
if not defined superlb (call :loadsuper)
if "!superlb!"=="" (call :loadsuper)
call :super-info
if "!sf!"=="1" (
if not exist super (mkdir super)
md super
for %%i in (!superlb!) do (if exist %%i.img (move %%i.img %cd%\super\%%i.img))
for /f %%i in ('!bls! "super/*.img"') do (
set size=%%~zi
set command=--partition %%~ni:!supersx!:!size!:!dbfz! --image %%~ni^=super\%%~ni.img
set full=!full! !command!
set command=)
ECHO.A-only
if "!modbj!"=="1" (echo.A>META-INF/ota&set scriptmt=A)
%lpmake% --metadata-size 65536 -super-name super -metadata-slots 2 -device super:!supers! --group !dbfz!:!supers! !full! !spa! --out super.img
set sparse=0
if exist super.img (!rm! -rf super)
)

if "!sf!"=="2" (
if not exist super (mkdir super)
md super
for %%i in (!superlb!) do (if exist %%i.img (move %cd%\%%i.img %cd%\super\%%i_a.img&echo.2>super\%%i_b.img ))
for /f %%d in ('!bls! "super/*_a.img"') do (
set size2=%%~zd
set ml1=--partition %%~nd:!supersx!:!size2!:!dbfz!_a --image %%~nd^=super\%%~nd.img
set "full=!full! !ml1!"
set ml1=
)

for /f %%r in ('!bls! "super/*_b.img"') do (
set size3=%%~zr
set ml2=--partition %%~nr:!supersx!:!size3!:!dbfz!_b %%~nr^=super\%%~nr.img
set "full1=!full1! !ml2!"
set ml2=
)
ECHO.V-AB
if "!modbj!"=="1" (echo.AB>META-INF/ota&set scriptmt=AB)
%lpmake% --metadata-size 65536 -super-name super -metadata-slots 3 -device super:!supers! --group !dbfz!_a:!supers! --group !dbfz!_b:!supers! !full! !full1! --virtual-ab !spa! --out super.img
if exist super.img (!rm! -rf super)
set sparse=0
)
if "!modbj!"=="1" (
	if not exist images md images
	if not exist image md image
	!mv! firmware-update/* ./image
	!rm! -rf firmware-update
	if exist super.img (
	!zstd! -5 --rm super.img
	!mv! super.img.zst ./images
	!mv! *.bin ./image)
	!mv! *.img ./image
	for %%i in (preloader_raw boot boot_Magisk boot_twrp recovery preloader_ufs preloader_emmc) do (if exist image\%%i.img move image\%%i.img images\%%i.img)
	for /f %%g in ('!bls! "image/*.img"') do (
	if exist image\%%~ng.img (
	move image\%%~ng.img images\%%~ng.img
	if "!scriptmt!"=="AB" (
    !busybox! sed -i "/#oi/i package_extract_file \"images/%%~ng.img\" \"/dev/block/bootdevice/by-name/%%~ng_a\"" !angxjb!
    !busybox! sed -i "/#oi/i package_extract_file \"images/%%~ng.img\" \"/dev/block/bootdevice/by-name/%%~ng_b\"" !angxjb!
    )
    if "!scriptmt!"=="A" (!busybox! sed -i "/#oi/i package_extract_file \"images/%%~ng.img\" \"/dev/block/bootdevice/by-name/%%~ng\"" !angxjb!
    )
    ))
    echo.#MIO-MIUI>META-INF\com\google\android\update-script
    !busybox! dos2unix !angxjb!
    !busybox! cp -r image/* ./images/
	!rm! -rf image
)
)
if "!payload!"=="1" goto :ppayload
for /f  %%o in ('dir /b *.img 2^>nul ^|!sed! 's/_new//g'') do (
if exist %%~no_new.img echo.%t15% [sparse]:%%~no_new.img& !img2simg! %cd%\%%~no_new.img %cd%\%%~no.img %slog%&!rm! -rf %%~no_new.img
if exist %%~no.img for /f "delims=" %%z in ('!xxd! -p -s "!ext4off2!" -l !len! "%%~no.img"') do (
if "%%z"=="!ext4magic!" if "!dat!"=="1" echo.%t15% [DAT]:%%~no.new.dat&!img2sdat! %%~no.img -o %cd%\ -v 4 -p %%~no %slog%
if exist %%~no.new.dat !rm! -rf %%~no.img)
if exist %%~no.new.dat if "!br!"=="1" echo.%t15% [BR]:%%~no.new.dat.br&!brotli! -q !brgl! -j -w 24 %%~no.new.dat -o %%~no.new.dat.br&!rm! -rf %%~no.new.dat
)
if "!dbzl!"=="1" !rm! -rf config&echo.%t15% [ZIP]:%xmmc%.zip&call :!yscx! d !xmmc!
if "!modbj!"=="1" (cd !local!
if exist !local!\!xmmc!.zip !rm! -rf !xmmc!)
if "!modbj!"=="1" (echo.%t96%:!local!\!xmmc!.zip)
if "!modbj!"=="1" (pause&goto :hm) else (goto :menu)
:ppayload
for /f %%i in ('dir /b *.img') do (
set "p1=!p1!:%%~ni"
set "p2=!p2!:%%~ni.img"
echo.%t57% %t78%：%%~nxi
)
if not exist payload_properties.txt (call :er payload_properties.txt menu)
if exist !dtbj! (call :readsuper) else (call :loadsuper)
echo.super_partition_groups^=!dbfz!>info.txt
echo.!dbfz!_size^=!supers!>>info.txt
echo.!dbfz!_partition_list^=!superlb!>>info.txt
wsl !delta_generator! --partition_names^=!p1:~1! --new_partitions^=!p2:~1! --dynamic_partition_info_file^=./info.txt
wsl !delta_generator! --in_file^=./payload.bin --properties_file^=./payload_properties.txt
if exist payload.bin (!rm! -rf *.img)
goto :menu
:super-info
if exist supersz (set /p sf=<supersz)
if "!sf!"=="1" (set sfs=A-only) else (if "!sf!"=="2" (set sfs=Virtual-AB) else (set sfs=Unknow))
echo.%fgf%
echo.super%t65%:!supers!
echo.super%t40%:!dbfz!
echo.super%t76%:!superlb!
echo.super%t77%:!sfs!
echo.%fgf%
exit /b 0
:PIMG
cls
ECHO.%t57% %t78%
ECHO.[1].%t57% Sparse %t78%
ECHO.[2].%t57% Raw %t78%
ECHO.[3].%t57% Erofs ==^> EXT4
ECHO.[4].%t43%
set /p pixz=%t7%
if "!pixz!"=="1" (set dat=0&set sparse=0&call :dbrom)
if "!pixz!"=="2" (set sparse=1&set dat=0&call :dbrom)
if "!pixz!"=="3" (!rm! -rf config/*_erofs&set sparse=1&set dat=0&call :dbrom)
if "!pixz!"=="4" goto :menu
goto :PIMG
:make_ext4fs
echo.%t15% [IMG]:%1.img...!size! B
if "!sparse!"=="0" (set sp=-s) else (set sp=)
if exist %1 (!makextfs! -J -T 1 !sp! -S config\%1_file_contexts -l !size! -C config\%1_fs_config -L %1 -a %1 %cd%\%1.img %cd%\%1\ %slog%)
if exist %1.img !rm! -rf %1
if "!jxys!"=="ON" if "!sparse!"=="1" !resize2fs! -M %cd%\%1.img %slog%
exit /b 0
:mke2fs
if exist %1 (for /f "tokens=1 delims=." %%u in ('echo !size!/4096^|!bc!') do (set size2=%%u))
echo.%t15% [IMG]:%1.img....!size2! Blocks
!mke2fs! -O ^has_journal -L %1 -I 256 -M /%1 -m 0 -t ext4 -b 4096 %cd%\%1_new.img !size2! %slog%
if exist %1_new.img (
	!e2fsdroid! -e -T 0 -S config/%1_file_contexts -C config/%1_fs_config -a /%1 -f %1 %1_new.img %slog%
	!rm! -rf %1)
if "!jxys!"=="ON" (!resize2fs! -M %cd%\%1_new.img %slog%)
if "!sparse!"=="0" (if exist %1_new.img !img2simg! %cd%\%1_new.img %cd%\%1.img&!rm! -rf %1_new.img) else (move %cd%\%1_new.img %cd%\%1.img )
if exist %1.img !rm! -rf %1_new.img
exit /b 0
:download-rom
set xzlj=
call :tgui %t25% %t25% Link xzlj
if "%xzlj%"=="" (goto :hm) else (goto :download)
:download
if "!xzyq!"=="1" (
	!aria2c! --max-concurrent-downloads=16 --max-connection-per-server=16 --split=16 --file-allocation=none %xzlj%||goto :hm
) else (
	!axel! -a -n 10 -k %xzlj% ||goto :hm
)
if "!modbj!"=="1" (call :jbz %xzlj% link) else (
!zenity! -question -text="!t44!" -title="MIO-KITCHEN"
if "!errorlevel!"=="1" (call :jbz %xzlj% link) else (goto :hm))
:setting
cls
if "!dbfs!"=="1" (set dbfsn=mke2fs+e2fsdroid) else (set dbfsn=make_ext4fs)
if "!xzyq!"=="1" (set xzyqn=aria2c) else (set xzyqn=axel)
if "!debug!"=="1" (set debugn=OFF) else (set debugn=ON)
ECHO.MIO-KITCHEN V%VERSION%|!lolcat!
ECHO.%fgf%
echo.[Language]:%language_u%|!lolcat!
!cecho! {0a}[1].%t28%{#}{\n}
!cecho! {0c}%t27%{#}{09}%dbfsn%{#}{\n}
!cecho! {0a}[2].mke2fs+e2fsdroid  [3].make_ext4fs{#}{\n}
!cecho! {0c}%t40%:{#}{09}%dbfz%{#}{\n}
!cecho! {0a}[4].main [5].qti_dynamic_partitions [05].!t64!Super!t40!{#}{\n}
!cecho! {0c}EROFS%t50%：{#}{09}%erofsgs% {#}{\n}
!cecho! {0a}[7].lz4 [8].lz4hc [9].lzma{#}{\n}
!cecho! {0c}Super %t57%%t65%：{#}{09}!supers!{#}{\n}
!cecho! {0a}[10].%t64% super %t57% %t65%{#}{\n}
!cecho! {0c}br%t70%：{#}{09}!brgl!{#}{\n}
!cecho! {0a}[11].%t64% br %t70%{#}{\n}
!cecho! {0c}%t69%：{#}{09}%xzyqn%{#}{\n}
!cecho! {0a}[12].Aria2c [13].Axel{#}{\n}
!cecho! {0c}%t66%:{#}{09}!zywz!{#}{\n}
!cecho! {0a}[14].%t64% logo %t68% [15].%t64% %t66%{#}{\n}
!cecho! {0c}%t67%:{#}{09}!debugn!{#}{\n}
!cecho! {0a}[16].ON [17].OFF{#}{\n}
!cecho! {0c}!t75!:{#}{09}[!lwms!]{#}{\n}
!cecho! {0a}[18].ON [19].OFF{#}{\n}
!cecho! {0c}%t101%:{#}{09}[!jxys!]{#}{\n}
!cecho! {0a}[20].ON [21].OFF{#}{\n}
!cecho! {0c}Super !t104!:{#}{09}[%supersx%]{#}{\n}
!cecho! {0a}[22].none [23].readonly{#}{\n}
!cecho! {0c}!t105! !t106!:{#}{09}[%yscx%]{#}{\n}
!cecho! {0a}[24].p7zip [25].bandizip{#}{\n}
!cecho! {0e}[0].%t22%{#}{\n}
set /p seti=%t7%
if "!seti!"=="1" call :set_language
if "!seti!"=="2" call :sed dbfs 1
if "!seti!"=="3" call :sed dbfs 2
if "!seti!"=="4" call :sed dbfz main
if "!seti!"=="5" call :sed dbfz qti_dynamic_partitions
if "!seti!"=="05" call :tgui !t64! !t40! !dbfz! ndbfz&call :sed dbfz !ndbfz!
if "!seti!"=="7" call :sed erofsgs lz4
if "!seti!"=="8" call :sed erofsgs lz4hc
if "!seti!"=="9" call :sed erofsgs lzma
if "!seti!"=="10" call :tgui !t71!!t65! %t72% !supers! supersize&call :sed supers !supersize!
if "!seti!"=="11" call :tgui %t71%%t70% [0-9] !brgl! brgls&call :sed brgl !brgls!
if "!seti!"=="12" call :sed xzyq 1
if "!seti!"=="13" call :sed xzyq 2
if "!seti!"=="14" call :zdlogo
if "!seti!"=="15" call :tgui %t71%%t66% M.K.C !zywz! zywzn&call :sed zywz !zywzn!
if "!seti!"=="16" call :sed debug 0
if "!seti!"=="17" call :sed debug 1
if "!seti!"=="18" call :sed lwms ON
if "!seti!"=="19" call :sed lwms OFF
if "!seti!"=="20" call :sed jxys ON
if "!seti!"=="21" call :sed jxys OFF
if "!seti!"=="22" call :sed supersx none
if "!seti!"=="23" call :sed supersx readonly
if "!seti!"=="24" call :sed yscx p7zip
if "!seti!"=="25" call :sed yscx bandizip
if "!seti!"=="0" cls&goto :load
set fjlb_new=&set seti=&set brgls=&set supersize=
for /f  %%u in ('findstr /v /b "@" %setsave%') do (set "%%u")
goto :setting
:tgui
for /f %%i in ('!zenity! --entry --title="%1" --text="%2" --entry-text="%3" -ok-label="!t107!"^|!iconv! -f utf-8 -t gbk') do (set %4=%%i)
if "%4"=="" goto :setting
exit /b 0
:sed
%sed% -i 's/%1=!%1!/%1=%2/g' %setsave%
exit /b 0
:zdlogo
cls
set nu=1
for /f %%a in ('!bls! %~dp0bin\fonts\*.flf') do (
echo [!nu!] [%%~na]
!figlet! -f %~dp0bin\fonts\%%~nxa !zywz!|!lolcat!
set g!nu!=%%~nxa
set /a nu=!nu!+1
)
set /p logox=%t63%？
if exist %~dp0bin\fonts\!g%logox%! (%sed% -i '/figletfont=/d' %setsave%&echo.figletfont=bin\fonts\!g%logox%! >> %setsave%)
exit /b 0
:zdxg
echo.%t94%...
for /f "delims=" %%o in ('!bls! "%local%\bin\plug\*.bat" "%local%\bin\plug\*.sh" "%local%\bin\plug\*.exe" 2^>nul') do (
if exist %local%\bin\plug\%%~no.exe call %local%\bin\plug\%%~no.exe
if exist %local%\bin\plug\%%~no.bat call %local%\bin\plug\%%~no.bat
if exist %local%\bin\plug\%%~no.sh !busybox! bash %local%\bin\plug\%%~no.sh %cd%
)
ECHO.%t95%...
goto :dbrom
:tqdgjx
if exist super.img (ECHO.super.img)
if exist payload.bin (ECHO.payload.bin)
set /p jxmc=!t62!:
if exist payload.bin (!payloadunpack! -output !cd! -partitions !jxmc! payload.bin)
if exist super.img (!lpunpack! -p !jxmc! super.img)
set jxmc=
exit /b 0
:set_language
for /f "delims=" %%a in ('dir /b "bin\language\*.txt"') do (
 set /a num+=1
 echo !num!. %%~na
 set g!num!=%%~na
 set zdy=!num!
)
set num=<nul
set /p cj=%t29%%qyts%
if /i "!cj!" gtr "!zdy!" Goto :set_language
if exist bin\language\!g%cj%!.txt %sed% -i 's/language_u=!language_u!/language_u=!g%cj%!/g' %setsave%
call :load
exit /b 0
:er
!zenity! --notification --title="MIO-KITCHEN" --text="%1 %t8%"
pause
if "%2"=="" (goto :hm) else (goto :%2)