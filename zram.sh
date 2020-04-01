#!/bin/bash

export LANG=C

## Disable existing ZRam devices
swapoff /dev/zram0
swapoff /dev/zram1
swapoff /dev/zram2
swapoff /dev/zram3

## Remove All SWAP+ZRAM
if [[ -n $(lsmod | grep zram) ]]; then
rmmod zram
fi
if [[ $1 == stop ]]; then
exit 0
fi
swapoff -a

## Enable Zram
modprobe zram num_devices=4

## Set LZ4 as compression algorithm
echo lz4 > /sys/block/zram0/comp_algorithm

##Set 1000MB as Total ZRAM Size
mem=1048400000

##Set size and create swap device
##Max number of compression streams(Cores) is detected automatically
echo $mem > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon -p 0 /dev/zram0
