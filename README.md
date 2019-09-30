# rpi_zram
Script to enable ZRAM on a Raspberry Pi or other Linux system.

Download the script and copy to /usr/bin/ folder
> sudo wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.sh

make file executable
> sudo chmod +x /usr/bin/zram.sh

-----------------------------------------------------------------

#To run the script with a systemd service do:
Download the service file and copy to /etc/systemd/system
> sudo wget -O /etc/systemd/system/zram.service https://raw.githubusercontent.com/generaleramon/rpi_zram/master/zram.service

Enable the service
> sudo systemctl enable zram.service

-----------------------------------------------------------------

#To run the script from rc.local do:
edit /etc/rc.local file to run script on boot
> sudo nano /etc/rc.local

add line before exit 0
> /usr/bin/zram.sh &
