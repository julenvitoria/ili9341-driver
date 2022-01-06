#!/bin/bash
# By tanstaafl updated by julenvitoria
dialog --backtitle "Instalador TFT ILI9341" --title " ¡¡¡¡Informacion!!!! " \
--infobox "


                 ¡¡¡ATENCION!!!
Es IMPRESCINDIBLE haber activado el bus SPI
a traves de raspi-config. En el siguiente menu
podras instalar el driver dependiendo del lado
en el que tu pantalla tenga la faja" 17 55
sleep 8
INPUT=/tmp/ili.sh.$$
dialog --backtitle "Instalador TFT ILI9341" \
--title "Instalacion TFT LCD ILI9341 SPI" \
--default-item 3 \
--ok-label Aplicar \
--cancel-label Salir \
--menu " Por favor, elige tu instalacion del driver ILI9341 " 17 55 4 \
   1 "Faja en lado derecho"\
   2 "Faja en lado izquierdo"\
   3 "Salir" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1) #faja lado derecho
clear
sudo modprobe fbtft_device custom name=fb_ili9341 gpios=reset:25,dc:24 speed=60000000 fps=60 bgr=1 rotate=270
sleep 2
dmesg | tail
sleep 2
fbset -fb /dev/fb1
sleep 2
cat /dev/urandom > /dev/fb1
sleep 2
#cambiamos a tft spi
con2fbmap 1 1
sleep 2
sudo sed -i '$a spi-bcm2835\nfbtft_device' /etc/modules
sudo cp fbtft-right.conf /etc/modprobe.d/fbtft.conf
sleep 2
#descargamos cmake y compilamos el framebuffer copy
sudo apt-get install -y cmake
mkdir build
cd build/
cmake ..
sleep 2
make
sleep 2
sudo install fbcp /usr/local/bin/fbcp
sleep 2
#si se prefiere cargar el driver en rc.local o en crontab -e o en systemd habilitar las lineas segun sea necesario
#para rc.local
#sudo sed -i '/\"exit 0\"/!s/exit 0/fbcp\&\nexit 0/g' /etc/rc.local
#para crontab -e
#echo "@reboot sudo /usr/local/bin/fbcp" >> mycron; crontab mycron;rm mycron
#para systemd
cd .. && sudo cp fbcp-ili9341.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start fbcp-ili9341.service
sudo systemctl enable fbcp-ili9341.service
#sleep 2
#sudo systemctl status fbcp-ili9341.service
sleep 2 ;
    dialog --infobox "



                REALIZADO!!!!
    


  Este mensaje se autocerrara en 3 segundos 
                    Y
          Se reiniciara el sistema" 17 55 ;
sleep 3 ;
sudo reboot ;
exit;;
  2) #faja lado izquierdo
clear
sudo modprobe fbtft_device custom name=fb_ili9341 gpios=reset:25,dc:24 speed=60000000 fps=60 bgr=1 rotate=90
sleep 2
dmesg | tail
sleep 2
fbset -fb /dev/fb1
sleep 2
cat /dev/urandom > /dev/fb1
sleep 2
#cambiamos a tft spi
con2fbmap 1 1
sleep 2
sudo sed -i '$a spi-bcm2835\nfbtft_device' /etc/modules
sudo cp fbtft-left.conf /etc/modprobe.d/fbtft.conf
sleep 2
#descargamos cmake y compilamos el framebuffer copy
sudo apt-get install -y cmake
mkdir build
cd build/
cmake ..
sleep 2
make
sleep 2
sudo install fbcp /usr/local/bin/fbcp
sleep 2
#si se prefiere cargar el driver en rc.local o en crontab -e o en systemd habilitar las lineas segun sea necesario
#para rc.local
#sudo sed -i '/\"exit 0\"/!s/exit 0/fbcp\&\nexit 0/g' /etc/rc.local
#para crontab -e
#echo "@reboot sudo /usr/local/bin/fbcp" >> mycron; crontab mycron;rm mycron
#para systemd
cd .. && sudo cp fbcp-ili9341.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start fbcp-ili9341.service
sudo systemctl enable fbcp-ili9341.service
#sleep 2
#sudo systemctl status fbcp-ili9341.service
sleep 2 ;
    dialog --infobox "



                REALIZADO!!!!
    


  Este mensaje se autocerrara en 3 segundos 
                    Y
          Se reiniciara el sistema" 17 55 ;
sleep 3 ;
sudo reboot ;
exit;;
  3) clear; exit 0;;
esac
