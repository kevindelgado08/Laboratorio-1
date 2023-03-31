/*Universidad de Costa Rica
IE-0624 Laboratorio de Microcontroladores
Estudiante: Kevin Delgado Rojas - B82566*/

#include <pic14/pic12f683.h>

/*Para compilar use: sdcc --use-non-free -mpic14 -p12f683 -I. -I/usr/local/share/sdcc/non-free/include -o bingo bingo.c*/

typedef unsigned int word ;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF);

unsigned const char num_decena[] = {
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

unsigned const char num_unidad[] = {
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

void delay(unsigned int tiempo);

int numero;    
int retener;  
              

void num_display( )
{
    int unid;
    int dec;

    //Para multiplexar el numero en decena y unidad
    dec=numero/10;
    unid=numero%10;
    
    GPIO=(num_unidad[unid]); 
    delay(1);
    GPIO=(num_decena[dec]);
    delay(1);                     
   
}

void retener_display() 
{
   retener=2; 
   while (retener>0, retener--) 
    {
      num_display();        
    }
}
void main(void)
{
    TRISIO = 0b00001000; //Poner todos los pines como salidas
    
    //Variables para generar numeros pseudoaleatorios
    //Algoritmo BBS
    int p = 9;
    int q = 27;
    int m = p * q;
    int x0 = 2;

    for (int i = 0; i < 16; i++) {
        x0 = (x0 * x0) % m;
        int numero_pseudoaleatorio = (x0 % 100);
        numero = numero_pseudoaleatorio;
        //

        if(numero<100) //si el numero pseudoaleatorio es menor que 100
        {
            while (GP3 == 0){
                retener_display(); 
            }
            
            while (GP3 == 1){
                //Botón presionado para cambiar de número
            }
            
        }
    
   }
}

void delay(unsigned int tiempo) //Se crea un tiempo de espera
{
    unsigned int i ;
    unsigned int j ;

    for( i=0; i <tiempo; i ++)
        for( j =0; j <1000; j ++);
}