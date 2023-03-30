#include <pic14/pic12f683.h>

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);

const char num_decena[] = {
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

const char num_unidad[] = {
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

int unidad(int numero){
	int unidades = numero%10;
	return unidades;
}

int decena(int numero){
	int decenas= numero/10;
	return decenas;
}

 
void main(void)
{
    TRISIO = 0b00000000; //Poner todos los pines como salidas

    int numeros[16];
    int p = 190;
    int q = 151;
    int m = p * q;
    int x0 = 317;

    for (int i = 0; i < 16; i++) {
        x0 = (x0 * x0) % m;
        int numero_pseudoaleatorio = (x0 % 100);
        numeros[i] = numero_pseudoaleatorio;
    }

    int dec = decena(numeros[0]);
    int unid = unidad(numeros[0]);
	while (1)
	{
		
        GPIO = num_decena[dec];
		GPIO = num_unidad[unid];
        
	}
	
	
}


