#include <Arduino_FreeRTOS.h>
#include <semphr.h>  // add the FreeRTOS functions for Semaphores (or Flags).


//Crear variables globales
SemaphoreHandle_t semT1;
SemaphoreHandle_t semT2;
SemaphoreHandle_t semT3;

// define two tasks for Blink & AnalogRead
void TaskMje1( void *pvParameters );
void TaskMje2( void *pvParameters );
void TaskMje3( void *pvParameters );

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);

  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB, on LEONARDO, MICRO, YUN, and other 32u4 based boards.
  }

  if (semT1 == NULL) {
    semT1 = xSemaphoreCreateMutex(); // Inicializar el semáforo
    //if ((semT1) != NULL) xSemaphoreGive((semT1));
  }
  if (semT2 == NULL) {
    semT2 = xSemaphoreCreateMutex(); // Inicializar el semáforo
    if ((semT2) != NULL) xSemaphoreGive((semT2));
  }
  if (semT3 == NULL) {
    semT3 = xSemaphoreCreateMutex(); // Inicializar el semáforo
    //if ((semT3) != NULL) xSemaphoreGive((semT3));
  }

  // Now set up two tasks to run independently.
  xTaskCreate(
    TaskMje1
    ,  (const portCHAR *)"Mje1"   // A name just for humans
    ,  128  // This stack size can be checked & adjusted by reading the Stack Highwater
    ,  NULL
    ,  20  // Priority, with 3 (configMAX_PRIORITIES - 1) being the highest, and 0 being the lowest.
    ,  NULL );

  xTaskCreate(
    TaskMje2
    ,  (const portCHAR *) "Mje2"
    ,  128  // Stack size
    ,  NULL
    ,  20  // Priority
    ,  NULL );

  xTaskCreate(
    TaskMje3
    ,  (const portCHAR *) "Mje3"
    ,  128  // Stack size
    ,  NULL
    ,  20  // Priority
    ,  NULL );

  // Now the task scheduler, which takes over control of scheduling individual tasks, is automatically started.
}

void loop() {
  // Empty. Things are done in Tasks.
}

/*--------------------------------------------------*/
/*---------------------- Tasks ---------------------*/
/*--------------------------------------------------*/

void TaskMje1(void *pvParameters)  // This is a task.
{
  (void) pvParameters;

  for (;;) // A Task shall never return or exit.
  {
    if ( xSemaphoreTake( semT1, ( TickType_t ) 5 ) == pdTRUE ) //Pedir fichita en T1
    {
      //Acciones de la tarea
      Serial.println("Tarea 1");
      int i;
      for (i; i < 10000; i++);
      xSemaphoreGive( semT2 ); // Poner fichita
    }
  }
}

void TaskMje2(void *pvParameters)  // This is a task.
{
  (void) pvParameters;
  char veces = 0;
  
  for (;;) // A Task shall never return or exit.
  {
    if ( xSemaphoreTake( semT2, ( TickType_t ) 5 ) == pdTRUE ) //Pedir fichita en T2
    {
      //Acciones de la tarea
      Serial.print("Tarea 2-");
      int i;
      for (i; i < 10000; i++);
      veces++;
      if (veces > 1) {
        xSemaphoreGive( semT3 ); // Poner fichita
        veces=0;
      }
      else{
        xSemaphoreGive( semT2 ); // Poner fichita
      }

      
    }
  }
}

void TaskMje3(void *pvParameters)  // This is a task.
{
  (void) pvParameters;

  for (;;) // A Task shall never return or exit.
  {
    if ( xSemaphoreTake( semT3, ( TickType_t ) 5 ) == pdTRUE ) //Pedir fichita en T3
    {
      //Acciones de la tarea
      Serial.print("Tarea 3-");
      int i;
      for (i; i < 10000; i++);
      xSemaphoreGive( semT1 ); // Poner fichita en T2
    }
  }
}
