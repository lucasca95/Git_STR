#include <stdio.h>
#include <dos.h>
#include <math.h>
#include <float.h>

#define FREC_BASE 1193000.0
#define CONT_0 0x40
#define CWR 0x43
#define INTERR 0x1C

#define ADQ_CONFIG 0x300
#define ADQ_IN 0x300
#define ADQ_OUT 0x304
#define ADQ_LOW 0x308
#define ADQ_HIGH 0x309

void interrupt (*viejoHandler)(void);
void interrupt nuevoHandler(void *param);

int vecesHandler = 0;

int main()
{
    float frecDeseada = 20;
    unsigned char contador_low = 0xFF;
    unsigned char contador_high = 0xFF;
    int contador;

    unsigned char adqLow = 0;
    unsigned char adqHigh = 0;
    unsigned int adqResul = 0;
    unsigned int adqResulAnalogico = 0;
    unsigned char EOC = 0;

    disable();

    outportb(ADQ_CONFIG, 0x1);

    viejoHandler = getvect(INTERR);

    outportb(CWR, 0x36);
    contador = ceil(FREC_BASE / frecDeseada);
    contador_high = contador / 256;
    contador_low = contador % 256;
    outportb(CONT_0, contador_low);
    outportb(CONT_0, contador_high);

    setvect(INTERR, nuevoHandler);

    enable();

    adqLow = inportb(ADQ_LOW);
    
    while (1)
    {
        if (vecesHandler >= ceil(frecDeseada))
        {
            EOC = inportb(ADQ_IN);
            EOC = EOC & 0x20;
            outportb(ADQ_OUT, 0x9);
            while (EOC == 0x0)
            {
                EOC = inportb(ADQ_IN);
                EOC = EOC & 0x20;
            }
            outportb(ADQ_OUT, 0x1);
            adqHigh=inportb(ADQ_HIGH);
            adqLow=inportb(ADQ_LOW);
            adqResul = adqHigh*256 + adqLow;
            adqResulAnalogico= (float)5/4096 * adqResul;
            printf("\nHigh=%d \nLow=%d \nResultado=%f \n", adqHigh, adqLow, adqResulAnalogico);
            vecesHandler = 0;
        }
    }

    outportb(CONT_0, 0xFF);
    outportb(CONT_0, 0xFF);
    setvect(INTERR, viejoHandler);
    getchar();
    return 0;
}

void interrupt nuevoHandler(void *param)
{
    vecesHandler++;
}