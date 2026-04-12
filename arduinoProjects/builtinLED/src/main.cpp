#include <Arduino.h>

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(6, INPUT);
  Serial.begin(9600);
  Serial.println("Hello, PlatformIO!");
}

void loop() {
  Serial.println("Running...");
  boolean buttonState = digitalRead(6);
  delay(100);
  digitalWrite(LED_BUILTIN, buttonState);
  delay(100);
}
