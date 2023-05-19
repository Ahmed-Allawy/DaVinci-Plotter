//// Define the size of the array
//#define ARRAY_SIZE 3
//
//// Define the array
//float data[ARRAY_SIZE];
//
//void setup() {
//  // Initialize the serial communication
//  Serial.begin(9600);
//  Serial1.begin(9600);
//}
//
//void loop() {
//  // Wait for data to be available on the serial port
//  while (Serial.available() < ARRAY_SIZE * sizeof(float));
//
//  // Read the data from the serial port
//  Serial.readBytes((char*)data, ARRAY_SIZE * sizeof(float));
//
//  // Print the received data
//  for (int i = 0; i < ARRAY_SIZE; i++) {
//    Serial.print(data[i]);
//    Serial.print(" ");
//  }
//}
//
//void setup() {
//  Serial.begin(9600);  // Set the baud rate to match MATLAB
//  Serial1.begin(9600);
//}
//
//void loop() {
//  // Read data from MATLAB if available
//  char data;
//  if (Serial.available()) {
//    data = Serial.read();
//    // Process the received data as needed
//    // For example, you can display it on the Serial Monitor
////    Serial.print("Received data: ");
////    Serial.println(data);
//  }
//  Serial1.write(data);
//  Serial1.print("Received Data: ");
//  Serial1.println(data);
//}

//void setup() {
//  Serial.begin(9600);  // Initialize the Serial port
//}
//
//void loop() {
//  if (Serial.available()) {
//    String receivedString = Serial.readString();
//    // Or use: String receivedString = Serial.readStringUntil('\n');
//
//    // Process the received string as needed
//    // For example, print it to the Serial Monitor
//    Serial.print("Received string: ");
//    Serial.println(receivedString);
//  }
//}

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
void setup() {
  Serial.begin(9600);  // Initialize the Serial port
  myservo.attach(7);  // attaches the servo on pin 7 to the servo object
  pinMode(6, OUTPUT);
  pinMode(5, OUTPUT);



}

void loop() {
  if (Serial.available() > 5)
  {
    char myChar = Serial.read();
    if (myChar == 't')
    {
      float myFloat = Serial.parseFloat();
      myservo.write(myFloat);
//      if (myFloat == 15.6)
//      {
//        digitalWrite(6, HIGH);
//        digitalWrite(5, LOW);
//      }
//      else
//      {
//        digitalWrite(5, HIGH);
//        digitalWrite(6, LOW);
//      }
    }
  }
}
    //
    //  }
    //  if (Serial.available()) {
    //    int n = Serial.parseInt();
    //    //char receivedChar = Serial.read();
    //    myservo.write(n);
    //    if (n == 'H')
    //    {
    //      digitalWrite(6, HIGH);
    //      digitalWrite(5, LOW);
    //    }
    //    else
    //    {
    //      digitalWrite(5, HIGH);
    //      digitalWrite(6, LOW);
    //    }
    //    // Process the received float as needed
    //    // For example, print it to the Serial Monitor
    //    Serial.print("Received float: ");
    //    Serial.println(n);
    //  }
    //}
//
//#include <Servo.h>
//
//    const int analogInPin = A0;  // Analog input pin that the potentiometer is attached to
//    const int analogOutPin = 9; // Analog output pin that the LED is attached to
//    const int ledPin = 11;
//
//
//    int sensorValue = 0;        // value read from the pot
//    int outputValue = 0;        // value output to the PWM (analog out)
//    Servo myservo;
//    int i, Status, pwm;
//    void setup() {
//      // initialize serial communications at 9600 bps:
//      Serial.begin(9600);
//      pinMode(ledPin, OUTPUT);
//      myservo.attach(7);  // attaches the servo on pin 7 to the servo object
//      pinMode(6, OUTPUT);
//      pinMode(5, OUTPUT);
//
//    }
//
//    void loop() {
//      if (Serial.available() > 0) {
//        // look for the next valid integer in the incoming serial stream:
//        Status = Serial.parseInt();
//        if (Status == 2) {
//
//          while (Serial.available() <= 1) {}
//          pwm = Serial.parseInt();
//          //analogWrite(ledPin, pwm);
//          myservo.write(pwm);
//
//          //Serial.print("5\n");
//        }
//        else if (Status == 1) {
//          // read the analog in value:
//          outputValue = 0;
//          for ( i = 1 ; i <= 3 ; i++) {
//            outputValue = outputValue + analogRead(analogInPin);
//            //outputValue =outputValue + sensorValue;
//          }
//          outputValue = outputValue / 3;
//          outputValue = map(outputValue, 0, 1023, 0, 255);
//          //outputValue =   outputValue *5.0 / 255;
//          Serial.println(outputValue);
//        }
//      }
//    }
