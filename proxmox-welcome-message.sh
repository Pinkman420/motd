#!/bin/bash

export TERM=xterm-256color

cpuTemp0=$(cat /sys/class/thermal/thermal_zone2/temp)
cpuTemp1=$(($cpuTemp0/1000))
cpuTemp2=$(($cpuTemp0/100))
cpuTempM=$(($cpuTemp2 % $cpuTemp1))


# Basic info
HOSTNAME=`uname -n`
#ROOT=`df -Ph | grep /dev/root | awk '{print $4}' | tr -d '\n'`
ROOT1=`df -hBM / | awk '/\// {print $(NF-3)"B"}'`
ROOT2=`df -hBM / | awk '/\// {print $(NF-4)"B"}'`

# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`

SWAP1=`free -m | tail -n 1 | awk '{print $3" MB"}'`
SWAP2=`free -m | tail -n 1 | awk '{print $2" MB"}'`


LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

RUNNING=`ps ax | wc -l | tr -d " "`

upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UPTIME=`printf "%d Days, %02d:%02d:%02dh" "$days" "$hours" "$mins" "$secs"`
LANIP=`ip a | grep "global vmbr0" | awk '{print $2}' | head -1 | cut -f1 -d/`


echo "$(tput setaf 2)                   
                   +-+-+-+-+-+-+-+
===================|P|R|O|X|M|O|X|===================
                   +-+-+-+-+-+-+-+

 - Uptime & SystemLoad:$( uptime )
 - Kernel.............: `uname -srmo`
 - Hostname...........: $HOSTNAME
 - Uptime.............: $UPTIME
=====================================================
 - Running Processes..: $RUNNING
 - CPU Temperature....: $cpuTemp1.$cpuTempM°C
 - Memory used........: $MEMORY1 / $MEMORY2
 - Swap in use........: $SWAP1 / $SWAP2
 - IP LAN.............: $LANIP
=====================================================
 - rootFS Disk Space...: $ROOT1 / $ROOT2
 - SSD  Temperature....: `hddtemp /dev/sda`
 - HDD  Temperature....: `hddtemp /dev/sdb`
 - HDD2 Temperature....: `hddtemp /dev/sdc`
=====================================================
$(tput setaf 1)
$(tput sgr0)"


