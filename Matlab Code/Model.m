% Create a serial port object
s = serial('COM3', 'BaudRate', 9600);

% Open the serial port
fopen(s);

% Send the array of floats
data = [1.23 4.56 7.89];
fprintf(s, '%f ', data);

% Close the serial port
fclose(s);
