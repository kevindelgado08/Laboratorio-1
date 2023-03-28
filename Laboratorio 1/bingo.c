#include <pic14/pic12f683.h>
 
//To compile:
//sdcc -mpic14 -p16f683 bingo.c
 
//To program the chip using picp:
//Assuming /dev/ttyUSB0 is the serial port.
 
//Erase the chip:
//picp /dev/ttyUSB0 16f887 -ef
 
//Write the program:
//picp /dev/ttyUSB0 16f887 -wp bingo.hex
 
//Write the configuration words (optional):
//picp /dev/ttyUSB0 16f887 -wc 0x2ff4 0x3fff
 
//Doing it all at once: erasing, programming, and reading back config words:
//picp /dev/ttyUSB0 16f887 -ef -wp bingo.hex -rc
 
//To program the chip using pk2cmd:
//pk2cmd -M -PPIC16f887 -Fbingo.hex


const char num_entero[] = {
    0b00000000, // 0
    0b00000001, // 1
    0b00000010, // 2
    0b00000011, // 3
    0b00000100, // 4
    0b00000101, // 5
    0b00000110, // 6
    0b00000111, // 7
    0b00010000, // 8
    0b00010001, // 9
};

const char num_decimal[] = {
    0b00100000, // 0
    0b00100001, // 1
    0b00100010, // 2
    0b00100011, // 3
    0b00100100, // 4
    0b00100101, // 5
    0b00100110, // 6
    0b00100111, // 7
    0b00110000, // 8
    0b00110001, // 9
};


void delay (unsigned inttiempo);
 
void main(void)
{
    TRISIO = 0b00000000; //Poner todos los pines como salidas
	
	unsigned int time= 50;
	
	while (1)
	{
		GPIO = num_entero[9];
		GPIO = num_decimal[2];
			
	}
	
	
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}
