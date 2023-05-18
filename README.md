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
% Create a serial port object
s = serial('COMX', 'BaudRate', 9600); % Replace "COMX" with the appropriate port name

% Open the serial port
fopen(s);

% Send the array of floats
data = [1.23, 4.56, 7.89];
fprintf(s, '%f ', data);

% Close the serial port
fclose(s);
```
Ensure that you replace "COMX" with the appropriate serial port name that corresponds to the Arduino board. You can find the port name in the Arduino IDE under Tools -> Port.

# Arduino
```C++
// Define the size of the array
#define ARRAY_SIZE 3

// Define the array
float data[ARRAY_SIZE];

void setup() {
  // Initialize the serial communication
  Serial.begin(9600);
}

void loop() {
  // Wait for data to be available on the serial port
  while (Serial.available() < ARRAY_SIZE * sizeof(float));

  // Read the data from the serial port
  Serial.readBytes((char*)data, ARRAY_SIZE * sizeof(float));

  // Print the received data
  for (int i = 0; i < ARRAY_SIZE; i++) {
    Serial.print(data[i]);
    Serial.print(" ");
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




