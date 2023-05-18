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
