#include <stdio.h>

#include <dos.h>

#include <conio.h>


#define INTR 0X1C    /* The clock tick interrupt */

void interrupt ( *oldhandler)();

int count=0;


void interrupt handler()
{

	/* increase the global counter */
   
	count++;
/* call the old routine */
  
	oldhandler();

}


int main(void)
{

	/* save the old interrupt vector */
   
	oldhandler = getvect(INTR);

	
/* install the new interrupt handler */
   
	setvect(INTR, handler);

	
/* loop until the counter exceeds 20 */
   
	while (count < 100) {
   
		/*if (count%5 == 0)
      printf("count is %d\n",count);*/
   
		printf("count is %d\n",count);
   
		sleep(1);
   
	}


	/* reset the old interrupt handler */
   
	setvect(INTR, oldhandler);

   
	return 0;

}