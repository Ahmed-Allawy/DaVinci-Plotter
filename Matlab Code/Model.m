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