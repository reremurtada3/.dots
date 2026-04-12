#include <Arduino.h>

void setup() {
  pinMode(6, INPUT);
  pinMode(2,OUTPUT);
}

void loop() {
  boolean buttonSignal = digitalRead(6);
  delay(50);
  digitalWrite(2,HIGH);
  delay(100);
}
