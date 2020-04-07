#Lab04-Grupo 2 

Pedro Alejandro Rozo

Juan Felipe Bulla Valencia

Steven herrera  Monroy

BCD2SSeg



Una vez clone el repositorio, realice lo siguiente:

## Dise�o BCD-7seg

Como por ejemplo  visualizar los resultados en el [ Display 7 Segmentos](https://en.wikipedia.org/wiki/Seven-segment_display) 

En este Ejercicio se propone que realicen el dise�o, sintentizaci�n e implementaci�n del Display de 7 sergmentos, el cual permita visualizar n�meros  en representaci�n hexadecimal (0x0 a 0xF).  En el siguiente gr�fico, se observa cual es el funcionamiento deseado del display:


![gif display](https://riverglennapts.com/images/combinational-circuit/seven-segment-display.gif)

Imagen tomada de [https://riverglennapts.com/es/combinational-circuit/202-seven-segment-display.html)

A continuaci�n se presentan los pasos recomendados para el ejercicio:

**Definir la caja funcional del BCD**: 

![bcd_black](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab03-BCD2SSeg/doc/BCD2SSeg.jpg)

Si observa la caja negra/ funcional  ademas  de la salidad de 7 segmentos contiene  una salida `An`. esta salida es para conectar eventualmente el �nodo del display y  poder hacer visualizaci�n din�mica, cuando se tiene mas de un display conectado.

Es de aclarar que deben ser de la misma caracteristica, dado que existen display tanto anodo com�n como catodo com�n.

![Carac](https://github.com/ELINGAP-7545/lab04-grupo-2/blob/master/Anodo%20Catodo.JPG)

**Definir la descripci�n Funcional**

Para ello recuerde  que puede hacer uso, bien sea, de las tablas de verdad o de la descripci�n algor�tmica del BCD a  siete segmentos. Recuerde que cada Segmento es una salida  del dise�o. Ejemplo, si desea  visualizar el n�mero **1**, la salida seria  de `Sseg es 0110000`. observe la gr�fica a continuaci�n, para generar las salidas acorde al n�mero de entrada.

![sseg](http://www.coffeebrain.org/wiki/images/4/4b/Display_8.png)


* Definir en  HDL el comportamiento del sistema ** :  Use Verilog para hacer la descripci�n funcional
**simulaci�n de Sistema** :  Use el Testbench para este fin.


# Ejercicio - Visualizaci�n Din�mica 4 Display


Si el dise�o digital de alg�n sistema se requiere mas de un display de 7 segmentos, es necesario generar una visualizaci�n tal que sea necesario el menor n�mero de pines para conectar todos los display en con la FPGA.

Por ahora, se ha visualizado el n�mero en un solo display de 7 segmentos. Pero en la mayor�a de los casos, los 7 pines de los c�todos est�n inter-conectados entre cada display, como se observa en la figura:

![conex](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/conex.png)

Por lo tanto, se debe  realizar una multiplexaci�n  entre los Anodos de cada Display, con el fin de visualizar en cada display un n�mero diferente.  En otras palabras, en cada instante de tiempo, solo un display se encuentra activo. En este sentido, se debe garantizar que el destello en la visualizaci�n entre cada display no se perciba. Para ello, cada display debe activarse m�ximo cada 16 ms.

![gif display](https://controlautomaticoeducacion.com/wp-content/uploads/4x7seg_slow.gif)
Imagen tomada de [https://controlautomaticoeducacion.com/arduino/multiplexar-display-7-segmentos/)

Visualmente esto se entiende mas con la siguiente simulaci�n, donde se desea visualizar el n�mero en representaci�n hexadecimal `0x4321`:

![diagrama](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/4sseg.jpg)


## Diagrama Caja negra 

Como siempre, antes de realizar la descripci�n del hardware se debe dise�ar la caja funcional del modulo, con las entradas y salidas

![diagrama caja negra ](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4.jpg)

En este sentido, se adiciona al HDL de siete segmentos 4 se�ales de control para el LCD, llamadas An. cada bit de la se�al `An` debe ser modificado en el tiempo, con el fin de activar solo un display.  

![4_se�ales](http://www.coffeebrain.org/wiki/images/thumb/b/b6/CNBCD7S.png/800px-CNBCD7S.png)


## Diagrama Estructural 

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/doc/display_7segx4_Diag_Estructural.jpg)

Se evidencia que se deben construir cuatro m�dulos  b�sicos, de los cuales uno de ellos esta descrito en el ejercicio anterior, [BCDtoSSeg.v](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab04_display_7segx4/src_ise_basys2/display_7segx4/BCDtoSSeg.v) . Los otros tres bloques son:

* Divisor de frecuencia: Su funci�n es dividir la frecuencia de  `clk` de entrada, en el tiempo requerido para cada cambio de �nodo
* Selector de �nodo: Sincronizado con la frecuencia  que genera el divisor, cambia en cada instante de tiempo el �nodo, se puede ver como un registro de desplazamiento del bit 0 `1110 1101 1011 0111`
* Selector de Datos: dependiendo del �nodo activado, activa los datos correspondientes.


# Entregables

Una vez clone el repositorio y lea la anterior guia, realice lo siguiente:

En el paquete de trabajo [WP04](https://classroom.github.com/g/zCBwHHKX)   esta la descripci�n del hardware que se implementa para visualizar un n�mero hexadecimal de 32 bits en un display  y en 4 display de 7 segmentos.

* Comprenda cada l�nea del c�digo HDL de los  archivos que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente
* Realice en quartus la simulaci�n para el BCD-7seg, analice los resultados.
* Cree el nuevo proyecto HDL para Visualizaci�n Din�mica 4 Display, tomando como base los archivos dados.
* Creer el archivo testbench.v
* Genera la simulaci�n, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.
* Modificar o A�adir los bloques necesarios para que la visualizaci�n sea en representaci�n Decimal y no Hexadecimal.
* Realice la respectiva publicaci�n del repositorio antes de la fecha dada con todo el c�digo  fuente 


# SOLUCI�N



````timescale 1ns / 1ps
module display(
    input [15:0] num,
    input clk,
    output [0:6] sseg,
    output reg [3:0] an,
	 input rst,
	 output led
    );



reg [3:0]bcd=0;
//wire [15:0] num=16'h4321;
 
BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg));

reg [26:0] cfreq=0;
wire enable;

// Divisor de frecuecia 

assign enable = cfreq[16];
assign led =enable;
always @(posedge clk) begin
  if(rst==1) begin
		cfreq <= 0;
	end else begin
		cfreq <=cfreq+1;
	end
end

reg [1:0] count =0;
always @(posedge enable) begin
		if(rst==1) begin
			count<= 0;
			an<=4'b1111; 
		end else begin 
			count<= count+1;
			an<=4'b1101; 
			case (count) 
				2'h0: begin bcd <= num[3:0];   an<=4'b1110; end 
				2'h1: begin bcd <= num[7:4];   an<=4'b1101; end 
				2'h2: begin bcd <= num[11:8];  an<=4'b1011; end 
				2'h3: begin bcd <= num[15:12]; an<=4'b0111; end 
			endcase
		end
end

endmodule
```



