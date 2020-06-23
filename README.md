# Simple ZRAM Enabler Script
The script is pre-tuned for the Raspberry Pi 3/4 

Fixed `1500MB` Swap with multiple streams and `LZ4`+`ZSTD` compression algorithms are set by default

The first ZRAM device using `LZ4`(Fast) has max priority, the `ZSTD`(Best Compression) device is only used when the first is full 

-----------------------------------------------------------------

Download the script and copy to /usr/bin/ folder

`sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.sh`

make file executable

`sudo chmod +x /usr/bin/zram.sh`

-----------------------------------------------------------------

### To run the script with a systemd service:
Download the service file and copy to /etc/systemd/system

`sudo wget -O /etc/systemd/system/zram.service https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.service`

Enable the service

`sudo systemctl enable zram.service`

-----------------------------------------------------------------

### To run the script from rc.local:
edit /etc/rc.local file to run script on boot

`sudo nano /etc/rc.local`

add line before exit 0

`/usr/bin/zram.sh &`

-----------------------------------------------------------------

### Easy  Copy-Paste solution:

`sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.sh`

`sudo chmod +x /usr/bin/zram.sh`

`sudo wget -O /etc/systemd/system/zram.service https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.service`

`sudo systemctl enable zram.service`

-----------------------------------------------------------------

### Show supported compression algorithms
`cat /sys/block/zram0/comp_algorithm`

### Show ZRam stats
`cat /sys/block/zram0/mm_stat`

### Check if the script/zram is working with:
`sudo zramctl`
