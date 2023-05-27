#include <Servo.h>
#include <ArduinoJson.h>
#define START_CONDITION 'S'
StaticJsonDocument<1024> doc;
Servo myservo;
void setup() {
  Serial.begin(9600);
  myservo.attach(13);
}
void loop() {
  if (Serial.available() > 0) {
    String inputString = Serial.readStringUntil('\n');
    Serial.print("Received String: ");
    Serial.println(inputString);
    DeserializationError error = deserializeJson(doc, inputString);
    if (!error) {
      Serial.println((double)doc["servo1"]);
      Serial.println((double)doc["servo2"]);
      Serial.println((double)doc["servo3"]);
      Serial.println((double)doc["servo4"]);
      myservo.write((double)doc["servo1"]);
      delay(500);
      myservo.write((double)doc["servo2"]);
      delay(500);
      myservo.write((double)doc["servo3"]);
      delay(500);
      myservo.write((double)doc["servo4"]);
      delay(500);
      Serial.write(START_CONDITION);
    } else {
      Serial.print(F("deserializeJson() failed: "));
      Serial.println(error.f_str());
      Serial.write(START_CONDITION);
      return;
    }
  }
}
