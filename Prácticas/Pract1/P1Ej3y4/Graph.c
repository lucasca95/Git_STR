#include <conio.h>
#include <stdlib.h>
#include <dos.h>      //Usaremos esta librería por la función delay(int valor) que nos permite
                      //establecer un retardo en milisegundos.
#include <graphics.h> //Esta es la librería que nos permite usar gráficos.

#define LIM_X 600
#define LIM_Y 50
#define CERO_X 50
#define CERO_Y 370
#define DIBUJAR_CERO_X CERO_X - 10
#define DIBUJAR_CERO_Y CERO_Y + 5
#define DIBUJAR_FLECHAX_X LIM_X
#define DIBUJAR_FLECHAX_Y CERO_Y - 3
#define DIBUJARX_X LIM_X
#define DIBUJARX_Y CERO_Y + 10
#define DIBUJAR_FLECHAY_X CERO_X - 3
#define DIBUJAR_FLECHAY_Y LIM_Y - 5
#define DIBUJARY_X CERO_X - 11
#define DIBUJARY_Y LIM_Y

void puntoXY(float, float);
void main()
{
    int gdriver = DETECT, gmode;
    float x, y;
    initgraph(&gdriver, &gmode, "C:\\BORLANDC\\BGI"); //Iniciamos el modo gráfico.
    // cleardevice();

    line(CERO_X, CERO_Y, LIM_X, CERO_Y);
    delay(100);
    line(CERO_X, CERO_Y, CERO_X, LIM_Y);
    settextstyle(0, HORIZ_DIR, 1);
    outtextxy(DIBUJAR_CERO_X, DIBUJAR_CERO_Y, "0");
    outtextxy(LIM_X, CERO_Y - 3, ">");
    outtextxy(LIM_X, CERO_Y + 10, "X");
    outtextxy(CERO_X - 3, LIM_Y - 5, "^");
    outtextxy(CERO_X - 11, LIM_Y, "Y");
    getchar();

    puntoXY(10,10);

    getchar();
    closegraph();       //Cerramos el modo gráfico.
}

void puntoXY(float x, float y)
{
    outtextxy((float)CERO_X+x, (float)CERO_Y-y-4, "*");
}