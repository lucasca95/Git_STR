#include <htc.h>

#define _XTAL_FREQ 1000000

int main(){

    TRISA=0b00000011;
    TRISB=0b00000000;

    RB4=1;
    RB5=1;

    while ((RA0) && (RA1)){
        //esperar
    }

    for(;;){
        RB4=!RB4;
        RB5=!RB5;
        __delay_ms(250);
    }

    return 0;
}