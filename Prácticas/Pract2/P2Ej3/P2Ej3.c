#include <htc.h>
#define _XTAL_FREQ 1000000

void configADC(void);
void configSalidas(void);

void main()
{
    unsigned short resul = 0;

    configADC();
    configSalidas();
    RD7 = 0;
    RD6 = 0;

    GO = 1; /* iniciar conversión */
    while (1)
    {
        while (GO)
        {
        }
        /* termine de convertir */
        resul = ADRESH << 8 | ADRESL;
        /* INICIO mandar a imprimir al display */
        PORTB = ADRESH; /* mando a copiar el valor al latch superior */
        RD7 = 1;
        __delay_ms(100); /* espero 100ms a que el latch copie el valor */
        RD7 = 0;
        PORTB = ADRESL; /* mando a copiar el valor al latch inferior */
        RD6 = 1;
        __delay_ms(100); /* espero 100ms a que el latch copie el valor */
        RD6 = 0;
        /* FIN mandar a imprimir al display */
        GO = 1;
    }
}

void configADC()
{
    ADCON1 = 0b10000101; /* bits justificados a derecha
    RA3 es Vref+, RA0 es entrada analógica */

    ADCON0 = 0b01000001; /* una conversión tarda 8 tics. vamos a convertir el canal 0.
    actualmente no hay conversión en proceso. el adc está encendido */

    TRISA = 0b00001001; /* configurar pines A0 y A3 como entradas */

    ADIE = 0; /* no trabajamos con adc por interrupción */
}

void configSalidas()
{
    TRISB = 0b00000000; /* pongo todo el puerto B como salida a los latch */
    TRISD = 0b00000000; /* pongo todo el puerto D como salida a los latch*/
}