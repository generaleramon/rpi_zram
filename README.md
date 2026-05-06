# Simple ZRAM Enabler Script
Fixed `16GB` Swap with multiple streams and `ZSTD Level 8` compression algorithms are set by default

-----------------------------------------------------------------

### Easy  Copy-Paste solution:

`sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.sh`

`sudo chmod +x /usr/bin/zram.sh`

`sudo wget -O /etc/cron.hourly/compact.sh https://raw.githubusercontent.com/generaleramon/rpi_zram/master/compact.sh`

`sudo chmod +x /etc/cron.hourly/compact.sh`

`sudo wget -O /etc/systemd/system/zram.service https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.service`

`sudo systemctl enable zram.service`

`sudo systemctl start zram.service`

-----------------------------------------------------------------

### Show supported compression algorithms
`cat /sys/block/zram0/comp_algorithm`

### Show ZRam stats
`cat /sys/block/zram0/mm_stat`

### Check if the script/zram is working with:
`sudo zramctl`
