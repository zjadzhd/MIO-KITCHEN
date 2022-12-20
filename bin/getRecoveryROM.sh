#Changed by MIO
DeviceCode=$(echo $1 |tr A-Z a-z)
CurrentPage=$(curl -sS https://xiaomirom.com/series/ |sed "s/</<\n/g" |grep "china" |grep $DeviceCode |cut -d "=" -f3 |cut -d " " -f1)
for ROM in $(curl -sS $CurrentPage |sed "s/</<\n/g" |grep zip |cut -d ">" -f 2 |cut -d "|" -f 1 |sed 's/ //g');do
    if [ "$(echo $ROM |grep "_pre_")" = "" ];then
        Version=$(echo $ROM |cut -d '_' -f 3)
    else
        Version=$(echo $ROM |cut -d '_' -f 4)
    fi
    echo http://bigota.d.miui.com/$Version/$ROM
done