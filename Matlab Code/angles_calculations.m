function [th0,th1,th2,th3] = angles_calculations(x, y, z, l1, l2, l3)

% set attack angle with initai value
attack_angle = -45; %in degrees
a= attack_angle * pi/180; %convert to radians
l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
l5 = (x^2 + y^2 + z^2)^0.5;

th0 = 0;
if (~isnan(atan(y/x))) %check that theta1 value is valid
    if x<0
       th0 =atan(y/x) + pi ; 
    else
       th0 =atan(y/x) ;
    end
end

th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
      acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
      asin(z / l5); 
th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
      acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
c=0; 
% this loop solve two problems
% 1- constant attack angle
% 2- unwanted angles th(1,2,3)
while((a <= pi/4)&&(th1 > pi || th1 < 0)||(th2 > pi/2 || th2 < -pi/2)||(th3 > pi/2 || th3 < -pi/2)|| (~(isreal(th1) && isreal(th2) && isreal(th3))&& l5 < 0.95*(l1+l2+l3)))
    c=c+1;
    disp('c = ');
    disp(c);
     a = a + 0.1;
       l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
    l5 = (x^2 + y^2 + z^2)^0.5;

    th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
          acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
          asin(z / l5); 
    th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
    th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
          acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 

end


disp('a:');
disp(a*180/pi);
disp('th0:');
disp(th0*180/pi);
disp('th1:');
disp(th1*180/pi);
disp('th2:');
disp(th2*180/pi);
disp('th3:');
disp(th3*180/pi);
disp('.........................');   


end