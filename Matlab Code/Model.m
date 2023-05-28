clc; clear all;
%%
S = serial('COM3','BaudRate',9600);
S.Timeout = 1;
fopen(S);
pause(2);


a1 = 10.00;
a2 = 30.00;
a3 = 50.00;
a4 = 70.00;
arr = [a1,a2,a3,a4];
arr2 = [15,20,13,40];
sendAngles(S,arr);

while S.BytesAvailable == 0
end
%data = fscanf(S,'%c');
flushinput(S);
flushoutput(S);

sendAngles(S,arr2);

while S.BytesAvailable == 0
end
%data = fscanf(S,'%c');
flushinput(S);
flushoutput(S);

sendAngles(S,arr);

while S.BytesAvailable == 0
end
%data = fscanf(S,'%c');
flushinput(S);
flushoutput(S);

sendAngles(S,arr2);

while S.BytesAvailable == 0
end
%data = fscanf(S,'%c');
flushinput(S);
flushoutput(S);

sendAngles(S,arr);

%while true
%for k = 1:1:10
    % It operates as start condition for syncrhonization
    %data = read(S, 1, "uint8");
     %while S.BytesAvailable == 0
%     % Do nothing and wait for data
     %end
% 
%     % Data is available, read it
     %data = fread(S, 1, 'uint8');
    
    % This delay to give the Arduino an amount of time
    % to prepare itself for receiving
    %pause(0.01);
    
    %fprintf(S,"{""servo1"":""10.00"",""servo2"":""20.00"",""servo3"":""30.00"",""servo4"":""40.00""}");
    %fprintf(S, sprintf("{""servo1"":""%.2f"",""servo2"":""%.2f"",""servo3"":""%.2f"",""servo4"":""%.2f""}",a1,a2,a3,a4));   
%end

fclose(S);