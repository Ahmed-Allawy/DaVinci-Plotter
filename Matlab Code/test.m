clear all;
clc;
close all;
x=0;
y=0;
%% test shape points
t = [ getLinePoints(10,0,16,1.9,9);
         getCurvePoints(0,0,16,5*pi/180,90*pi/180,50);
         getLinePoints(0,16,0,10,9);
         getCurvePoints(0,0,10,90*pi/180,5*pi/180,20);];
        
path = validateShapePoints(t,9,21);
