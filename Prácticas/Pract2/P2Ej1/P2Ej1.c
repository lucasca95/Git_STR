
#include <htc.h>           /* necesaria para funciones y archivos de proteus */
#define _XTAL_FREQ 1000000 /* indicamos la frecuencia del sistema: 1Mhz */
#define LED_ROJO RB4
#define LED_VERDE RB5
#define BOTON1 RA0
#define BOTON2 RA1

void configPORTs(void);
void toggleLeds(void);

void main()
{
    /* estado inicial */
    configPORTs();
    __delay_ms(100);
    LED_ROJO = 1;
    LED_VERDE = 1;
    
    /* esperar una pulsación */
    while (BOTON1 && BOTON2)
    {
        //esperar a que se pulse un botón
    }

    /* loop infinito */
    while (1)
    {
        toggleLeds();
        __delay_ms(250);
    }
}
void toggleLeds()
{
    LED_ROJO = !LED_ROJO;
    LED_VERDE = !LED_VERDE;
}
void configPORTs()
{
    /* Un cero en TRISX setea al puerto X como salida */
    TRISB = 0xCF; /* Configuros pines 4 y 5 del puerto B como salida */
    TRISA = 0x1F; /* Configuros pines 0 y 1 del puerto A como entrada */
}