#!/bin/bash
# file: beforeScript.sh
#
# This script will run after Raspberry Pi boot up, and before running the schedule script.
# If you want to change the schedule script before running it, you may do so here.
#
# Remarks: please use absolute path of the command, or it can not be found (by root user).
# Remarks: you may append '&' at the end of command to avoid blocking the main daemon.sh.
#
lastupdate=$(date -r schedule.wpi +"%m.wpi")
thismonth=$(date "+%m.wpi")
[ $lastupdate != $thismonth ] \
&& cp -f "$thismonth" schedule.wpi
