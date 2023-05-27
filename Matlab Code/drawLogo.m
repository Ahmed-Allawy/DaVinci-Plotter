
function [shape] = drawLogo()
    
points = [
     %first link
     getLinePoints(-14.23,13.56,-6.26,19.427,15);
     getCurvePoints(-5,18.5,1.5,144*pi/180,-36*pi/180,10);
     getLinePoints(-4.5,17,-11.8,11.8,15);

     % middle link
     getLinePoints(-4.5,20,4.5,20,15);
     getCurvePoints(4.5,18.5,1.5,90*pi/180,-90*pi/180,10);
     getLinePoints(4.5,17,-4.5,17,15);

     %marker
     getLinePoints(1.3,20.4,1.1,20.6,3);
     getLinePoints(1.1,20.6,2.5,22,5);
     getLinePoints(2.5,22,4.5,20,5);

     getLinePoints(6,18.5,8.86,15.63,5);

     getLinePoints(8.86,15.63,9.39,13.71,5);
     getLinePoints(9.39,13.71,7.46,14.23,5);

     getLinePoints(7.46,14.23,4.5,17,5);


     %% DaVinci word
     % D
     getLinePoints(-4.5,10,-4.5,13,5); 
     getCurvePoints(-4.5,11.5,1.5,90*pi/180,-90*pi/180,10);

     % a
     getCurvePoints(-1,11,0.75,0*pi/180,-360*pi/180,10);
     getLinePoints(-0.25,11,-0.25,10,3);

     % V
     getLinePoints(0.75,13,1.5,10,5);
     getLinePoints(1.5,10,2.25,13,5);

     % i 
     getLinePoints(3.25,12,3.25,10,4);

     % n
     getLinePoints(4.5,10,4.5,11.5,4);
     getCurvePoints(5.25,11.5,0.75,180*pi/180,0*pi/180,10);
     getLinePoints(6,11.5,6,10,4);

     % c
     getCurvePoints(8.25,11,1,45*pi/180,315*pi/180,10);

     % i 
     getLinePoints(10,12,10,10,4);

    ];

shape = 1.3 * points;

end