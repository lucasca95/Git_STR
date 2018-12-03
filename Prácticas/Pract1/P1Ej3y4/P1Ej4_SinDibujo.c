#pragma inline /* declara que hay instrucciones en ensamblador */

#include <stdio.h>
#include <stdlib.h> /* random() */
#include <dos.h>    /* enable(), disable(), getvec(), setvec() */
#include <math.h>   /* ceil(), fmod() */
#include <float.h>  /* _clear87() */
#include <conio.h>
#include <graphics.h> /* Librería para graficar */

#define STINR 0x300   /* direcc STINR. Registro donde los tres bits de mayor peso guardan */
                      /* la salida del conversor A/D. El sexto bit tiene un 1 si se terminó la conversión */
#define OUTBR 0x304   // direcc del OUTBR para controlar salidas digitales
#define CTREG 0x300   /* registro de configuración */
                      /* bit 7: (1) habilitar interr PACER */
                      /*        (0) enmascarar interr PACER */
                      /* bit 6: (1) Disparar PACER */
                      /*        (0) Bloquear PACER */
                      /* bits 5-4: Configurar fondo de escala del AmpOp */
                      /*        (00) 5V */
                      /*        (01) 2V */
                      /*        (10) 1V */
                      /*        (11) 0V */
                      /* bits 3-2-1-0: Elección de canal analógico */
#define AD_HIGH 0x309 /* Se guarda el dato convertido por A/D */
#define AD_LOW 0x308  /* Una lectura de este registro inicia una conversión */
#define FE 5          /* Fondo escala = 5V */

#define PORT_CONFIG 0x43
#define PORT_TIMER0 0x40

int vecesQueEntroAlHandler = 0;

void interrupt (*viejotimer)(void);
void interrupt far nuevotimer(void)
{
        char *data87[94]; /* Se reserva espacio para los registros del copro */
        asm fsave data87  /* Se salvan los registros del copro */
        _clear87();       /* Se inicializa el copro */

        /* EMPIEZA EL CUERPO DEL MANEJADOR DE INTERRUPCION */
        vecesQueEntroAlHandler++;
        //TERMINA EL CUERPO DEL MANEJADOR DE INTERRUPCION

        asm frstor data87 /* Para salir se recuperan los registros del copro */
}

int encenderLed(unsigned char);
int apagarLed(unsigned char);

int main()
{
        /* INICIO Varibles relacionadas con graficos */
        int gdriver = DETECT, gmode;
        /* FIN Varibles relacionadas con graficos */

        /* INICIO Variables locales relacionadas con CONVERSOR_AD */
        unsigned int adValue, i;
        unsigned char ad_high, ad_low, conv;
        float analogicValue;
        /* FIN Variables locales relacionadas con CONVERSOR_AD */

        /* INICIO Variables locales relacionadas con interrupcion de CONTADOR */
        unsigned int vecesParaUnSegundo = ceil(1193180 / 65535);
        unsigned char contador_hi = 0xFF, contador_lo = 0xFF; /* 8 bits para cada parte alta y baja del contador */
        /* FIN Variables locales relacionadas con interrupcion de CONTADOR */

        /* INICIO Configuracion de interrupcion de CONTADOR */
        outportb(PORT_CONFIG, 0x36);        /* se escribe el registro de control con el valor
                                        0x36h o ‭00110110‬b para elegir:
                                        Contador 0 || ParteBajaPrimeroParteAltaDespues || Modo 3 || valor 16 bits */
        outportb(PORT_TIMER0, contador_lo); /* escribe el bajo */
        outportb(PORT_TIMER0, contador_hi); /* y luego el alto */
        /* FIN Configuracion de interrupcion de CONTADOR */

        /* INICIO Configuracion de CONVERSOR_AD */
        outportb(CTREG, 0x1); /*Elegir canal 1 y fondo de escala +5V*/
        /* FIN Configuracion de CONVERSOR_AD */

        /* DESACTIVAR interrupciones para cambiar la ISR */
        disable();
        printf("\nSe deshabilitaron las interrupciones\n");
        viejotimer = getvect(0x1C); /* guardar direc vieja */
        setvect(0x1C, nuevotimer);  /* setear direc nueva */
        printf("\nHecho el intercambio de direcciones en el vector de interrupcion\n");
        /* HABILITAR interrupciones */
        enable();

        /* INICIO Programa principal */
        conv = inportb(AD_LOW); /*Iniciar conversión*/
        encenderLed(0);
        apagarLed(1);
        for (;;)
        {
                if (vecesQueEntroAlHandler >= vecesParaUnSegundo)
                {
                        /* E QUE PASO UN SEGUNDO*/
                        /* Reinicio el contador */
                        vecesQueEntroAlHandler = 0;
                        /*Puedo mandar a convertir */
                        do
                        {
                                conv = inportb(STINR);
                                conv = conv && 0x20; /*Quedarme con End Of Conversion
                                        conv = xxxx xxxx
                                        0x20 = 0010 0000
                                        &&   = --!- ----
                                        Marco con ! el bit que me interesa conocer */
                        } while (conv == 0x0);
                        /*Leer el dato convertido*/
                        ad_high = inportb(AD_HIGH);
                        ad_low = inport(AD_LOW);
                        adValue = ad_high * 256 + ad_low;
                        analogicValue = (float)FE / 4096 * adValue;

                        for (i = 1; i < 30; i++)
                        {
                                printf("\n");
                        }

                        /*INICIO actualizar pantalla*/

                        /*FIN actualizar pantalla*/

                        /* analogicValue = 2.7 --> temp = 65°C */
                        /* analogicValue = 3.5 --> temp = 85°C */
                        if (analogicValue >= 2.7)
                        {
                                /* Activar sistema de ventilacion poniendo un 1 en la salida digital N°1 */
                                encenderLed(1);
                                printf("\nVENTILACION ON. %1.3f >> 2.7 V", analogicValue);
                        }
                        else
                        {
                                apagarLed(1);
                                printf("\nVENTILACION OFF. %1.3f << 2.7 V", analogicValue);
                        }

                        if (analogicValue >= 3.5)
                        {
                                /* Apagar motor poniendo un 1 en la salida digital N°0 */
                                apagarLed(0);
                                printf("\nMOTOR OFF. %1.3f >> 3.5 V", analogicValue);
                        }
                        else
                        {
                                encenderLed(0);
                                printf("\nMOTOR ON. %1.3f << 3.5 V", analogicValue);
                        }
                }
        }
        /* FIN Programa principal */
        /* Volver a condiciones originales */
        disable();                   /* desactiva interrupciones para cambiar la ISR */
        setvect(0x1C, viejotimer);   /* restaura la vieja ISR */
        outportb(PORT_CONFIG, 0x36); /* restaura la velocidad del reloj */
        outportb(PORT_TIMER0, 0xFF); /* cargando el contador 0, con unos */
        outportb(PORT_TIMER0, 0xFF);
        enable(); /* habilita interrupciones */

        return 0;
}

int encenderLed(unsigned char num)
{

        switch (num)
        {
        case 0:
                outportb(OUTBR, 0x8);
                break;
        case 1:
                outportb(OUTBR, 0x9);
                break;
        case 2:
                outportb(OUTBR, 0xA);
                break;
        case 3:
                outportb(OUTBR, 0xB);
                break;
        case 4:
                outportb(OUTBR, 0xC);
                break;
        case 5:
                outportb(OUTBR, 0xD);
                break;
        case 6:
                outportb(OUTBR, 0xE);
                break;
        case 7:
                outportb(OUTBR, 0xF);
                break;
        }

        if (num < 0 || num > 7)
        {
                printf("\nValor de led invalido para encender");
        }
        return 0;
}

int apagarLed(unsigned char num)
{
        switch (num)
        {
        case 0:
                outportb(OUTBR, 0x0);
                break;
        case 1:
                outportb(OUTBR, 0x1);
                break;
        case 2:
                outportb(OUTBR, 0x2);
                break;
        case 3:
                outportb(OUTBR, 0x3);
                break;
        case 4:
                outportb(OUTBR, 0x4);
                break;
        case 5:
                outportb(OUTBR, 0x5);
                break;
        case 6:
                outportb(OUTBR, 0x6);
                break;
        case 7:
                outportb(OUTBR, 0x7);
                break;
        }

        if (num < 0 || num > 7)
        {
                printf("\nValor de led invalido para apagar");
        }
        return 0;
}
