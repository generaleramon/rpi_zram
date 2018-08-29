#!/bin/bash
cores=$(nproc --all)
modprobe zram

swapoff -a

totalmem=`free | grep -e "^Mem:" | awk '{print $2}'`
mem=$(( ($totalmem / $cores)* 1024 ))

core=0
while [ $core -lt $cores ]; do
  dev=$(zramctl -a lz4 -s $mem --find)
  echo $dev
  mkswap $dev
  swapon -p 5 $dev
  let core=core+1
done
