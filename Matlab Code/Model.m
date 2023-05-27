clc;
clear all;
%%
S = serial('COM3','BaudRate',9600,'timeOut',.05);
fopen(S);
pause(2);
fprintf(S, "{""servo1"":""00.00"",""servo2"":""00.00"",""servo3"":""00.00"",""servo4"":""00.00""}");
pause(0.5);
while true
data = fread(S, 1, 'uint8');
fprintf(S, "S");
fprintf(S, "S");
pause(0.5);
fprintf(S, "{""servo1"":""10.00"",""servo2"":""30.00"",""servo3"":""60.00"",""servo4"":""80.00""}");
pause(0.5);
disp("{""servo1"":""30.5""}");
%pause(1);
end
fclose(S);