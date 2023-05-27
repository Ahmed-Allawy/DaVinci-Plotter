clear all;
clc;
close all;
x=0;
y=0;
%% test shape points
t = getImagePoints('letter.png',-55,60,0.65);
path = validateShapePoints(t,13,28);
