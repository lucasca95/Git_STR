#pragma inline /* declara que hay instrucciones en ensamblador */
#include <stdio.h>
#include <dos.h>   /* enable(), disable(), getvec(), setvec() */
#include <math.h>  /* ceil(), fmod() */
#include <float.h> /* _clear87() */

#define PORT_CONFIG 0x43
#define PORT_TIMER0 0x40

/* Esqueleto de rutina de interrupcion

   Se programa el timer del PC para elegir una frecuencia de interrupcion 
   entre 18.2 Hz y 1.193MHz. La rutina de interrupcion se instala en la 
   posicion 0x1C del vector para ser ejecutada por la interrupcion del 
   timer, es decir, la interrupcion 0x08.
   Lucas Agustin Camino 1277/0
*/

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

void main(void)
{
    float frec_base = 1193180.0;            /* La frecuencia de entrada es de 1.193 MHz*/
    unsigned int contador;                  /* contador de 16 bits */
    unsigned char contador_hi, contador_lo; /* 8 bits para cada parte alta y baja del contador */
    float ts;
    float frecDeseada = 18.3; /* Periodo deseado en segundos. Inicializa el reloj */
    unsigned char segundos = 0;
    unsigned int vecesParaUnSegundo = 0;
    char sig;

    printf("\nEmpieza programa\nDarEnter"); //Seguir
    scanf("%c", &sig);
    fflush(stdin);

    printf("\nIngresar frecuencia de interrupcion:\n"); //Elegir frecuencia
    scanf("%f", &frecDeseada);
    fflush(stdin);

    ts = 1 / frecDeseada;                                                  // calculo ts
    printf("\nLa frecDeseada es %f, entonces ts = %f\n", frecDeseada, ts); // Seguir
    scanf("%c", &sig);
    fflush(stdin);

    contador = ceil(frec_base * ts); /* se calcula el valor del contador.
                                        La funcion ceil(arg) recibe un decimal y 
                                        devuelve el entero mas cercano, por arriba o abajo */
    printf("\nEl contador tendra el valor %d, ya que frec_base * ts = %f\n", contador, ceil(frec_base * ts));
    scanf("%c", &sig);
    fflush(stdin);

    outportb(PORT_CONFIG, 0x36); /* se escribe el registro de control con el valor
                                        0x36h o ‭00110110‬b para elegir:
                                        Contador 0 || ParteBajaPrimeroParteAltaDespues || Modo 3 || valor 16 bits */
    printf("\nSe configura el registro de control\n");
    scanf("%c", &sig);
    fflush(stdin);

    contador_hi = contador / 256; /* byte alto del contador */
    printf("\nEl contador_hi tiene %d\n", contador_hi);
    scanf("%c", &sig);
    fflush(stdin);

    contador_lo = contador % 256; /* byte bajo del contador */
    printf("\nEl contador_lo tiene %d\n", contador_lo);
    scanf("%c", &sig);
    fflush(stdin);

    outportb(PORT_TIMER0, contador_lo); /* escribe el bajo */
    outportb(PORT_TIMER0, contador_hi); /* y luego el alto */
    printf("\nSe cargo el valor del contador, primero parte baja y dps parte alta\n");
    scanf("%c", &sig);
    fflush(stdin);

    vecesParaUnSegundo = ceil(1 / ts);
    printf("\nVamos a tener una interrupcion cada ts = %f segundos\nVoy a necesitar contar %d interrupciones", ts, vecesParaUnSegundo);
    scanf("%c", &sig);
    fflush(stdin);

    disable(); /* desactiva interrupciones para cambiar la ISR */
    printf("\nSe deshabilitaron las interrupciones\n");
    scanf("%c", &sig);
    fflush(stdin);

    viejotimer = getvect(0x1C); /* guardar direc vieja */
    setvect(0x1C, nuevotimer);  /* setear direc nueva */
    printf("\nHecho el intercambio de direcciones en el vector de interrupcion\n");
    scanf("%c", &sig);
    fflush(stdin);
    printf("\n\n\n\n\n\n\n\n\nHabilitar interrupciones\n");
    scanf("%c", &sig);
    fflush(stdin);
    enable(); /* habilita interrupciones */

    while (segundos < 20)
    { //funcionar hasta que pasemos los 20 segundos
        if (vecesQueEntroAlHandler >= vecesParaUnSegundo)
        {
            segundos++;
            vecesQueEntroAlHandler = 0;
        }
        printf("\n%d", vecesQueEntroAlHandler);
        printf("\nSegundos pasados: %d", segundos);
    }

    /* Volver a condiciones originales */
    disable();                 /* desactiva interrupciones para cambiar la ISR */
    setvect(0x1C, viejotimer); /* restaura la vieja ISR */
    outportb(0x43, 0x36);      /* restaura la velocidad del reloj */
    outportb(0x40, 0xFF);      /* cargando el contador 0, con unos */
    outportb(0x40, 0xFF);
    printf("\nTerminar programa\n");
    scanf("%c", &sig);
    fflush(stdin);
    enable(); /* habilita interrupciones */
}
