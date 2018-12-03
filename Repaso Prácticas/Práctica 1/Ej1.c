#include <stdio.h>
#include <dos.h>
#include <math.h>
#include <float.h>

#define FREC_BASE 1193000.0
#define CONT_0 0x40
#define CWR 0x43
#define INTERR 0x1C

void interrupt (*viejoHandler)(void);
void interrupt nuevoHandler(void *param);

int vecesHandler = 0;

int main()
{
    unsigned char segundos = 0;
    double frecDeseada;
    unsigned char contador_low = 0xFF;
    unsigned char contador_high = 0xFF;
    int contador;

    printf("Ingresar valor de frecuencia deseado\n");
    scanf("%f", &frecDeseada);

    if ((frecDeseada > 18.3) && (frecDeseada < FREC_BASE))
    {

        viejoHandler = getvect(INTERR);

        disable();

        outportb(CWR, 0x36);
        contador = ceil(FREC_BASE / frecDeseada);
        contador_high = contador / 256;
        contador_low = contador % 256;
        outportb(CONT_0, contador_low);
        outportb(CONT_0, contador_high);

        setvect(INTERR, nuevoHandler);

        enable();

        while (segundos < 20)
        {
            if (vecesHandler >= ceil(frecDeseada))
            {
                segundos++;
                printf("\nSegundo %d\nEl handler fue llamado %d veces", segundos, vecesHandler);
                vecesHandler = 0;
            }
        }
    }
    else
    {
        printf("No se puede ejecutar porque '%0.2f' es valor invalido de frecuencia.", frecDeseada);
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
