## DaVinci-Plotter
The 4DOF (Four Degrees of Freedom) robot arm is a robotic manipulator designed with four movable joints, allowing it to perform various tasks in a three-dimensional space. Each degree of freedom represents a rotational or translational movement that the robot arm can execute
## Sending Angles from MATLAB to Arduino for a 4DOF Robot Arm

This README file provides an overview of the process of sending angles from MATLAB to Arduino using serial communication in order to control a 4DOF robot arm. The provided Arduino code receives the angles from MATLAB and prints them through the serial port.

## Prerequisites
To successfully execute the MATLAB and Arduino code for controlling the 4DOF robot arm, you need the following:
- MATLAB: Ensure that MATLAB is installed on your system.
- Arduino IDE: Install the Arduino Integrated Development Environment (IDE) to program the Arduino board.
- Arduino Board: Connect an Arduino board to your computer via USB.


## Setup
1. Connect the Arduino board to your computer using a USB cable.
2. Open the Arduino IDE and upload the provided Arduino code to the Arduino board.
3. Make a note of the baud rate used in the Arduino code (in this case, 9600).



## MATLAB and Arduino Codes
To send angles from MATLAB to the Arduino board, you need to write a MATLAB code that establishes a serial communication with the Arduino and sends the angles as a series of bytes.
Here's an example MATLAB and Arduino codes snippets to send angles to the Arduino:

# MATLAB
```matlab
clc;
clear all;
%%
S = serial('COM4','BaudRate',9600,'timeOut',.05);
fopen(S)
arr = 10:20:80;
fprintf(S, 'rrr');
pause(2);
disp('sent dummy');
for i = 1:length(arr)
%     Upwm = ceil(arr(i));
%     fprintf(S,'2');
%     pause(0.001)
%     fprintf(S,num2str(Upwm)); 
    fprintf(S, strcat('t', num2str(arr(i)), 'z'));
    pause(1);
end
fprintf(S, 'rrr');
disp('sent dummy');
pause(2);
fclose(S);
```
Ensure that you replace "COMX" with the appropriate serial port name that corresponds to the Arduino board. You can find the port name in the Arduino IDE under Tools -> Port.

# Arduino
```C++
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
    }
  }
}

```
## Running the System
1. Connect the Arduino board to your computer.
2. Open MATLAB and run the MATLAB code snippet provided above.
3. The MATLAB code will create a serial port object, open the serial port, send the array of floats to the Arduino, and then close the serial port.
4. The Arduino board will receive the angles and print them through the serial port.
5. You can monitor the printed angles in the Arduino IDE's Serial Monitor or any other serial communication monitoring tool.
## Customization
If you have a different number of angles or need to modify the code for your specific 4DOF robot arm, you may need to make the following adjustments:
- Update the serial port name in the MATLAB code to match the appropriate port name where the Arduino is connected.
- Adjust the data array in the MATLAB code to contain the desired angles to be sent to the Arduino.
## Troubleshooting
If you encounter any issues while running the system, consider the following:

- Ensure that the Arduino board is correctly connected to your computer and recognized by the operating system.
- Verify that you have selected the correct serial port in the MATLAB code and that it matches the port connected to the Arduino board.
- Check the baud rate setting in both the Arduino code and MATLAB code to ensure they match.
If the above troubleshooting steps do not resolve your issue, consult the documentation for your specific Arduino board and MATLAB version for further assistance.
## Conclusion
By following the steps outlined in this README file, you should be able to send angles from MATLAB to an Arduino board and use the received angles to control a 4DOF robot arm. Feel free to customize the code according to your specific requirements and expand upon this system to further enhance the functionality




