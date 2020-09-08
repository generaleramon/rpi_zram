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

## Enable 2 Zram devices
modprobe zram num_devices=2

## Set LZ4 and LZ4HC as compression algorithms
echo lz4 > /sys/block/zram0/comp_algorithm
echo lz4hc > /sys/block/zram1/comp_algorithm

##Set 2GB as -Total- ZRAM Size
mem=2150000000

##Set size and create swap devices
##LZ4 as 1th level and LZ4HC as 2th level
##Max number of compression streams(Cores) is detected automatically
echo $mem > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon -p 1 /dev/zram0
echo $mem > /sys/block/zram1/disksize
mkswap /dev/zram1
swapon -p 0 /dev/zram1
