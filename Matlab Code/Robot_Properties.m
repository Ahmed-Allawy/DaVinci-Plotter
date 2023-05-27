clear all;
clc;
close all;
%% system inputs: (x,y,z)- attack_angle - Links
z=-6.7;
% % set attack angle with initai value attack_angle = -45; %in degrees a=
% attack_angle * pi/180; %convert to radians
l1 = 9; %link 1
l2 = 9; %link 2
l3 = 12.5; %link 3
% workspace
min = 13; % should be large than real value
max = 28; % should be smaller than real value
%% robot creation
L(1) = Link([0,0,0,pi/2]); 
L(2) = Link([0,0,l1,0]); 
L(3) = Link([0,0,l2,0]); 
L(4) = Link([0,0,l3,0]); 
Robot = SerialLink(L);
%% get points of shape

shape = getImagePoints('letter.png',-55,60,0.65);
%points = [4, 3, 20, 10,-33, 10, 4, 2];
path = validateShapePoints(shape,min,max);
%% draw shape
figure;
e = 0;
for i = 1:2:length(path)
    e = e+1;
    disp('point#');
    disp(e);
    [th0,th1,th2,th3] = angles_calculations(path(i,1), path(i,2), z, l1, l2, l3);
    %% plot robot
    hold on;
    grid on;
     if isreal(th1) && isreal(th2) && isreal(th3)
       Robot.plot([th0 th1 th2 th3]);
       plot3(path(i,1), path(i,2), z, 'b.');
       axis([-40 40 -40 40 -15 60]);
       pause(0.05);
     else 
         plot3(path(i,1), path(i,2), z, 'r.');
         disp('can not reach this point');
         disp('.........................');
         disp('.........................');
         pause(0.2);
     end
end
 Robot.plot([0 th1 th2 th3]);