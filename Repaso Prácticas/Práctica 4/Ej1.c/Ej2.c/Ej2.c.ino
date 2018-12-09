#include <Arduino_FreeRTOS.h>
#include <semphr.h>

void tarea1();
unsigned char estadoLed=0;
unsigned char veces=0;
SemaphoreHandle_t semT1;

void setup() {
  pinMode(13, OUTPUT);
  while(!Serial);
  Serial.flush();
  Serial.begin(9600);
  semT1=xSemaphoreCreateMutex();
  xTaskCreate(tarea1,(const portCHAR *) "T1", 128, NULL, 100, NULL);
}

void loop() {
  if (!veces){
    Serial.println("EMPEZAMOS");
    veces++;
    xSemaphoreGive(semT1);
  }
}

void tarea1 (){
  for(;;){
    if( xSemaphoreTake( semT1, ( TickType_t ) 5 ) == pdTRUE ){
      estadoLed=!estadoLed;
      Serial.println("Intruso ataque a LED");
      digitalWrite(13, estadoLed);
      vTaskDelay(1000/portTICK_PERIOD_MS);
      xSemaphoreGive(semT1);
    }
  }
}
