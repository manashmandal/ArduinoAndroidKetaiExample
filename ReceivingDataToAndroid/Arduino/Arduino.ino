#include <SoftwareSerial.h>

#define RX 10
#define TX 11
#define BAUD 9600
#define L_DELAY 1000

SoftwareSerial bt(RX , TX);

void setup() {
  Serial.begin(BAUD);
  bt.begin(BAUD);
}

void loop() {
  //It's mandatory that you place a delimiter [here as 'space'] put before a number before sending it
  bt.println(" 123");
  delay(L_DELAY);
}
