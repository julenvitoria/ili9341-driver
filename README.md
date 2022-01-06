# ILI9341 driver

**ILI9341 driver**

Script y archivos necesarios para la instalacion del framebuffer copy tool (https://github.com/tasanakorn/rpi-fbcp) para pantallas SPI ILI9341 en RetroPie y, de esta manera, poder obtener 60fps en los diferentes emuladores.


**Requisitos**

1-Activar wifi para poder descragar los archivos necesarios

2-Activar SSH en raspi-config si deseamos trabajar de manera remota desde el pc

3-Activar el bus SPI en raspi-config

4-Si se tiene algun script activo tales como scripts de control de mandos (retrograme, GPIOnext...) o algun otro script que utilice diferentes gpios asegurarse que no interfieran con los gpio con los que están funcionando. Es **MUY** recomendable deshabilitar estos scripts (ya sea comentando la linea que los llama o desinstalando por ejemplo) antes de la instalacion para evitar posibles problemas.


**Pineado de la pantalla**

| Funcion | RPI Pin |   GPIO Pin   |
| --------| ------- | ------------ |
| BL      | 12      | GPIO 18      |
| VCC     | 17      | 3,3V         |
| D/CX    | 18      | GPIO 24      |
| SDO     | 19      | GPIO 10      |
| GND     | 20      | GND          |
| SDI     | 21      | GPIO 09      |
| RESET   | 22      | GPIO 25      |
| SCL     | 23      | GPIO 11      |
| CSX     | 24      | GPIO 08      |

NOTA: a veces los pines anteriormente descritos no corresponderán con la faja de la pantalla. Ésto es debido a las diversas maneras de nombrarlos de los diferentes fabricantes.


Lista de los diferentes nombres de pines y sus posibles nomenclaturas

| Funcion |  Posible nomenclatura  |
| ------- | ---------------------- |
| RESET   | RESET, RST             |
| CSX     | CS, CSX, CX            |
| SCL     | SCL, SCLK, RS, RSX, RX |
| D/CX    | DC, WR, WRX, WX        |
| SDI     | SDI, MISO              |
| SDO     | SDO, MOSI              |
| BL      | BL, CLK                |

**Instrucciones de instalacion**

Para instalarlo conectar por SSH y teclear lo siguiente en la terminal:

`git clone https://gitlab.gameboyzero.es/julenvitoria/ili9341-driver`

`cd ili9341-driver && chmod +x install.sh && ./install.sh`

Una vez realizada la instalación es muy probable que sea necesario jugar un poco con el overscan para que quede perfecto en nuestro proyecto ;)

**License**

Copyright (c) 2013 Tasanakorn Phaipool

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
