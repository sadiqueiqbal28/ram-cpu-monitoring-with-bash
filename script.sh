#!/bin/bash

cpu_usage=$(iostat | awk 'NR==4{print}' | awk '{print $6}' | awk -F. '{print $1}')
mem_usage=$(free -m | grep Mem | awk '{print $3}')
total_mem=$(free -m | grep Mem | awk '{print $2}')
if [[ $cpu_usage -le 20 ]]
then
	echo "WARNING! CPU usage reached 80% on $(date)" >> system_health.log
fi
used_perc=$(( $mem_usage*100/$total_mem ))
if [[ $used_perc -ge 80 ]]
then
	echo "WARNING! Memory usage reached 80% on $(date)" >> system_health.log
fi
