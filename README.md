#Lab04-Grupo 2 

Pedro Alejandro Rozo

Juan Felipe Bulla Valencia

Steven herrera  Monroy

BCD2SSeg



Una vez clone el repositorio, realice lo siguiente:

## Dise駉 BCD-7seg

Como por ejemplo  visualizar los resultados en el [ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

En este Ejercicio se propone que realicen el dise駉, sintentizaci髇 e implementaci髇 del Display de 7 sergmentos, el cual permita visualizar n鷐eros  en representaci髇 hexadecimal (0x0 a 0xF).  En el siguiente gr醘ico, se observa cual es el funcionamiento deseado del display:


![gif display](https://riverglennapts.com/images/combinational-circuit/seven-segment-display.gif)

Imagen tomada de [https://riverglennapts.com/es/combinational-circuit/202-seven-segment-display.html)

A continuaci髇 se presentan los pasos recomendados para el ejercicio:

**Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)

Si observa la caja negra/ funcional  ademas  de la salidad de 7 segmentos contiene  una salida `An`. esta salida es para conectar eventualmente el 羘odo del display y  poder hacer visualizaci髇 din醡ica, cuando se tiene mas de un display conectado.

Es de aclarar que deben ser de la misma caracteristica, dado que existen display tanto anodo com鷑 como catodo com鷑.

![Carac](https://github.com/ELINGAP-7545/lab04-grupo-2/blob/master/Anodo%20Catodo.JPG)

**Definir la descripci髇 Funcional**

Para ello recuerde  que puede hacer uso, bien sea, de las tablas de verdad o de la descripci髇 algor憝tmica del BCD a  siete segmentos. Recuerde que cada Segmento es una salida  del dise駉. Ejemplo, si desea  visualizar el n鷐ero **1**, la salida seria  de `Sseg es 0110000`. observe la gr醘ica a continuaci髇, para generar las salidas acorde al n鷐ero de entrada.

![sseg](http://www.coffeebrain.org/wiki/images/4/4b/Display_8.png)


* Definir en  HDL el comportamiento del sistema ** :  Use Verilog para hacer la descripci髇 funcional
**simulaci髇 de Sistema** :  Use el Testbench para este fin.


# Ejercicio - Visualizaci髇 Din醡ica 4 Display


Si el dise帽o digital de alg煤n sistema se requiere mas de un display de 7 segmentos, es necesario  generar una visualizaci贸n tal que sea necesario el menor n煤mero de pines para conectar todos los display en con la FPGA.

Por ahora, se ha visualizado el n煤meros en un solo display de 7 segmentos. Pero en la mayor铆a de los casos, los 7 pines de los c谩todos est谩n inter-conectados entre cada display, como se observa en la figura:



![conex](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/conex.png)

Por lo tanto, se debe  realizar una multiplexaci贸n  entre los Anodos de cada Display, con el fin de visualizar en cada display un n煤mero diferente.  En otras palabras, en cada instante de tiempo, solo un display se encuentra activo. En este sentido, se debe garantizar que el destello en la visualizaci贸n entre cada display no se perciba. Para ello, cada display debe activarse m谩ximo cada 16 ms.

![gif display](https://controlautomaticoeducacion.com/wp-content/uploads/4x7seg_slow.gif)
Imagen tomada de [https://controlautomaticoeducacion.com/arduino/multiplexar-display-7-segmentos/)

Visualmente esto se entiende mas con la siguiente simulaci贸n, donde se desea visualizar el  n煤mero en representaci贸n hexadecimal `0x4321`:


![diagrama](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/4sseg.jpg)


## Diagrama Caja negra 

Como siempre, antes de realizar la descripci贸n del hardware se debe dise帽ar la caja funcional del modulo, con las entradas y salidas

![diagrama caja negra ](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4.jpg)

En este sentido, se adiciona al HDL de siete segmentos 4 se帽ales de control para el LCD, llamadas An. cada bit de la se帽al `An` debe ser modificado en el tiempo, con el fin de activar solo un display.  

## Diagrama Estructural 

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4_Diag_Estructural.jpg)

Se evidencia que se deben construir cuatro m贸dulos  b谩sicos, de los cuales uno de ellos esta descrito en el ejercicio anterior, [BCDtoSSeg.v](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/src_ise_basys2/display_7segx4/BCDtoSSeg.v) . Los otros tres bloques son:

* Divisor de frecuencia: Su funci贸n es dividir la frecuencia de  `clk` de entrada, en el tiempo requerido para cada camvio de 谩nodo
* Selector de 脕nodo: Sincronizado con la frecuencia  que genera el divisor, cambia en cada instante de tiempo el  谩nodo, se puede ver como un registro de desplazamiento del bit 0 `1110 1101 1011 0111`
* Selector de Datos: dependiendo del 谩nodo activado, activa los datos correspondientes.

# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo [WP04](https://classroom.github.com/g/zCBwHHKX)   esta la descripci贸n del hardware que se implementa para visualizar un n煤mero hexadecimal de 32 bits en un display  y en 4 display de 7 segmentos.

* Comprenda cada l铆nea del c贸digo HDL de los  archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente
* Realice en quartus la simulaci贸n para el BCD-7seg, analice los resultados.
* Cree el nuevo proyecto HDL para Visualizaci贸n Din谩mica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v
* Genera la simulaci贸n, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Modificar o A帽adir los bloques necesarios para que la visualizaci贸n sea en representaci贸n Decimal y no Hexadecimal.
* Realice la respectiva publicaci贸n del repositorio antes de la fecha dada con todo el c贸digo  fuente 

