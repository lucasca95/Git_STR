#include <htc.h>

#define _XTAL_FREQ 1000000

void interrupt handler(void);
unsigned char toggleLeds = 0;
int main()
{
    T0IE = 0;
    GIE = 0;

    //config pines
    TRISA = 0b00000011;
    TRISB = 0b00000000;
    //leds comienzan encendidos
    RB4 = 1;
    RB5 = 1;

    //config timer
    T0CS = 0;
    T0SE = 1;
    PSA = 0;
    PS2 = 1;
    PS1 = 1;
    PS0 = 1; //prescalador en 256

    while ((RA0) && (RA1))
    {
        //esperar
    }
    //habilitar interrupciones
    GIE = 1;
    T0IE = 1;

    for (;;)
    {
        if (toggleLeds)
        {
            toggleLeds=0;
            RB4 = !RB4;
            RB5 = !RB5;
        }
    }

    return 0;
}

void interrupt handler()
{
    GIE=0;
    T0IE=0;
    toggleLeds = 1;
    T0IF = 0;
    T0IE=1;
    GIE=1;
}