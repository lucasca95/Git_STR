#include <htc.h>
#define _XTAL_FREQ 1000000

int main()
{
    unsigned int resulADC=0;
    //configuracion de pines
    TRISA = 0b00000001;
    TRISB = 0b00000000;
    TRISD = 0b00000000;

    ADCON1 = 0b10001110;
    ADCON0 = 0b01000001;

    ADIE = 0;

    GO = 1;
    for (;;)
    {
        while (GO)
        {
            //esperar
        }
        resulADC= ADRESH << 8 | ADRESL;
        PORTB=resulADC%256;
        RD6=1;
        __delay_ms(100);
        RD6=0;
        PORTB=resulADC/256;
        RD7=1;
        __delay_ms(100);
        RD7=0;
        GO=1;
    }

    return 0;
}