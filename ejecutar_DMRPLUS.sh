#!/bin/bash

sed -i "6c MMDVMPLUS=ON" /home/pi/status.ini

frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
sed -i "72c $frecuencia" /home/pi/status.ini

puerto=$(awk "NR==51" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $puerto 15 14`
sed -i "73c $puerto" /home/pi/status.ini

cd /home/pi/MMDVMHost
sleep 3
xterm -geometry 87x24+643+213  -bg black -fg white -fa 'serift' -fs 9x -T DMR+ -e sudo ./MMDVMPLUS MMDVMPLUS.ini &


