
function [shape] = writeCSE()
    
shape = [
     % C
     % getCurvePoints(-12.5,17.5,5,45*pi/180,315*pi/180,40);

     % S
     getCurvePoints(0,20,2.5,45*pi/180,270*pi/180,20);
     getCurvePoints(0,15,2.5,90*pi/180,-135*pi/180,20);

     % % E 
     % getLinePoints(14.5,22.5,7.5,22.5,9);  % upper -
     % getLinePoints(7.5,22.5,7.5,12.5,15);  % |
     % getLinePoints(7.5,12.5,14.5,12.5,9);  % lower -
     % getLinePoints(7.5,17.5,14.5,17.5,9);  % middle -
     % getLinePoints(14.5,17.5,0,-17.5,2);
    ];

end