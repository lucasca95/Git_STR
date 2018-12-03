
#include <htc.h>           /* necesaria para funciones y archivos de proteus */
#define _XTAL_FREQ 1000000 /* indicamos la frecuencia del sistema: 1Mhz */
#define LED_ROJO RB4
#define LED_VERDE RB5
#define BOTON1 RA0
#define BOTON2 RA1

void config(void);
void toggleLeds(void);
void interrupt handler(void);
unsigned char desborde=0;

void main()
{
    /* estado inicial */
    config();
    LED_ROJO = 1;
    LED_VERDE = 1;

    /* esperar una pulsación */
    while (BOTON1 && BOTON2)
    {
        //esperar a que se pulse un botón
    }

    /* habilitar interrupción de timer0 */
    T0IE = 1;

    /* loop infinito */
    while (1)
    {
        if (desborde)
        {
            toggleLeds();
            desborde = 0;
        }
    }
}
void toggleLeds()
{
    LED_ROJO = !LED_ROJO;
    LED_VERDE = !LED_VERDE;
}
void config()
{
    /* Un cero en TRISX setea al puerto X como salida */
    TRISB = 0xCF; /* Configuros pines 4 y 5 del puerto B como salida */
    TRISA = 0x1F; /* Configuros pines 0 y 1 del puerto A como entrada */

    /* configuración del timer0 */
    T0CS = 0; /* elegimos como fuene el reloj interno. timer como temporizador */
    T0SE = 1; /* contamos cada flanco descendente de clk */
    PSA = 0;  /* le asignamos el prescalador al Timer0 */
    PS2 = 1;  /* Ponemos el prescalador en 256*/
    PS1 = 1;  /* Ponemos el prescalador en 256*/
    PS0 = 1;  /* Ponemos el prescalador en 256*/
    GIE = 1;  /* habilitamos instrrupciones en general */
}

void interrupt handler(){
    GIE=0; /* deshabilitamoms interrupciones */
    desborde=1;
    T0IF=0;
}