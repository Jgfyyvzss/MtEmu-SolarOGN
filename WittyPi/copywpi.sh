# if standalone
# ensure chmod +x copywpi.sh
# run using ./copywpi.sh

lastupdate=$(date -r schedule.wpi +"%m.wpi")
thismonth=$(date "+%m.wpi")
[ $lastupdate != $thismonth ] \
&& cp -f "$thismonth" schedule.wpi
