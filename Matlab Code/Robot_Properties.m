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
min = l2;
max = 30;
%% robot creation
L(1) = Link([0,0,0,pi/2]); 
L(2) = Link([0,0,l1,0]); 
L(3) = Link([0,0,l2,0]); 
L(4) = Link([0,0,l3,0]); 
Robot = SerialLink(L);
%% get points of shape
% shape =[ getLinePoints(10,0,25,0,19);
%          getCurvePoints(0,0,25,0*pi/180,90*pi/180,50);
%          getLinePoints(0,16,0,10,9);
%          getCurvePoints(0,0,10,90*pi/180,5*pi/180,20);];
% 
shape = writeCSE;
%points = [4, 3, 20, 10,-33, 10, 4, 2];
path = validateShapePoints(shape,min,max);
%% draw shape
figure;
e = 0;
for i = 1:2:length(path)
    e = e+1;
    disp("point#");
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