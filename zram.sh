#!/bin/bash

export LANG=C

cores=4

## Disable Zram
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
echo lz4 > /sys/block/zram1/comp_algorithm
echo lz4 > /sys/block/zram2/comp_algorithm
echo lz4 > /sys/block/zram3/comp_algorithm

##1000MB Total ZRAM
mem=262100000

##Set size and create swap device
echo $mem > /sys/block/zram0/disksize
mkswap /dev/zram0
swapon -p 0 /dev/zram0
echo $mem > /sys/block/zram1/disksize
mkswap /dev/zram1
swapon -p 0 /dev/zram1
echo $mem > /sys/block/zram2/disksize
mkswap /dev/zram2
swapon -p 0 /dev/zram2
echo $mem > /sys/block/zram3/disksize
mkswap /dev/zram3
swapon -p 0 /dev/zram3
