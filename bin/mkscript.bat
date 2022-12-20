::Batch by mio
set update_script=%cd%/META-INF/com/google/android/updater-script
if exist META-INF (
echo ui_print("===MIO-KITCHEN==="); >> !update_script!
if exist dynamic_partitions_op_list (echo assert(update_dynamic_partitions(package_extract_file("dynamic_partitions_op_list"))); >> !update_script!)
for /f %%b in ('!bls! *.new.dat.br 2^nul ^|!sed! 's/.new.dat//g' ') do (
set mc=%%~nk
echo ui_print("Patching !mc! image unconditionally..."); >> !update_script!
echo show_progress(0.100000, 0); >> !update_script!
if exist dynamic_partitions_op_list (
echo block_image_update(map_partition("!mc!"), package_extract_file("!mc!.transfer.list"), "!mc!.new.dat.br", "!mc!.patch.dat") ^|^| >> !update_script!
) else (
echo block_image_update("/dev/block/bootdevice/by-name/!mc!", package_extract_file("!mc!.transfer.list"), "!mc!.new.dat.br", "!mc!.patch.dat") ^|^| >> !update_script!
)
echo.  abort("E2001: Failed to update !mc! image."); >> !update_script!
)

for /f %%b in ('!bls! *.img 2^nul') do (
echo package_extract_file("%%~nb.img", "/dev/block/bootdevice/by-name/%%~nb"); >> !update_script!
echo show_progress(0.100000, 10); >> !update_script!
)
)

)