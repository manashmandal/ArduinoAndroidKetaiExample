#include <SoftwareSerial.h>
#define BAUD 9600
#define RX 10
#define TX 11

SoftwareSerial bt(RX, TX);

bool hasReceived = false;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(BAUD);
  bt.begin(BAUD);
}

void loop() {
  char x = '\0';
  // put your main code here, to run repeatedly:
  if (bt.available() > 0){
    x = bt.read();
    hasReceived = true;
  }

  if (hasReceived){
    Serial.println(x);
    hasReceived = false;
  }
}
