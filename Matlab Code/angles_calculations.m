clear all;
clc;
close all;

%% system inputs: (x,y,z)- attack_angle - Links
x=0;
y=0;
z=-5.1;
attack_angle = 30; %in degrees
a= attack_angle * pi/180; %convert to radians


l1 = 9; %link 1
l2 = 9; %link 2
l3 = 12.5; %link 3

%% robot creation
L(1) = Link([0,0,0,pi/2]); 
L(2) = Link([0,0,l1,0]); 
L(3) = Link([0,0,l2,0]); 
L(4) = Link([0,0,l3,0]); 
Robot = SerialLink(L);

x=1;
%% calculations

 for y = 10:1:17
  x=y;   
disp("hi");
if ((y^2)+(x^2))^0.5 <=l2 
    disp("can't reach this point : too small");
    break;
elseif ((y^2)+(x^2))^0.5 >= l1+l2+l3
    disp("can't reach this point : too large");
    break;
end
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

c= 0;
% remove unreal angels
while(~(isreal(th1) || isreal(th2) || isreal(th3)))
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

% while ((th1 > pi || th1 < 0)||(th2 > pi/2 || th2 < -pi/2)||(th3 > pi/2 || th3 < -pi/2))
% 
%     if ((th1 < -pi/2  || th2 > pi/2 || th3 < -pi/2))
%         a = a - 0.1;
%     elseif (th1 > pi/2  || th2 < -pi/2 || th3 > pi/2)
%         a = a + 0.1;
%     end
%     l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
% 
%         th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
%               acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
%               asin(z / l5); 
%         th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
%         th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
%               acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
%         c =c+1;
%         disp(a );
%         disp(th1*180/pi);
%         disp(th2*180/pi);
%         disp(th3*180/pi );
% 
% end




disp('L4:');disp(l4);
disp(th0*180/pi);
disp(th1*180/pi);
disp(th2*180/pi);
disp(th3*180/pi);
    

%% plot robot
hold on;
grid on;
%for i = 0 : 0.1: 1
 if isreal(th1) && isreal(th2) && isreal(th3)
   Robot.teach([th0 th1 th2 th3]);
   plot3(x, y, z, 'b.');
   axis([-40 40 -40 40 -15 60]);
   pause(0.1);
 else 
     plot3(x, y, z, 'r.');
     disp("can't reach this point");
     pause(0.2);
 end
end
% 
% %%
%  for x = 0:1:9
% disp("hi");
% if ((y^2)+(x^2))^0.5 <=l2 
%     disp("can't reach this point : too small");
%     break;
% elseif ((y^2)+(x^2))^0.5 >= l1+l2+l3
%     disp("can't reach this point : too large");
%     break;
% end
% l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
% l5 = (x^2 + y^2 + z^2)^0.5;
% 
% 
% th0 = 0;
% if (~isnan(atan(y/x))) %check that theta1 value is valid
%     if x<0
%        th0 =atan(y/x) + pi ; 
%     else
%        th0 =atan(y/x) ;
%     end
% end
% 
% th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
%       acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
%       asin(z / l5); 
% th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
% th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
%       acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
% 
% c= 0;
% 
% while ((th1 > pi/2 || th1 < -pi/2)||(th2 > pi/2 || th2 < -pi/2)||(th3 > pi/2 || th3 < -pi/2))
% 
%     if ((th1 < -pi/2  || th2 > pi/2 || th3 < -pi/2))
%         a = a - 0.1;
%     elseif (th1 > pi/2  || th2 < -pi/2 || th3 > pi/2)
%         a = a + 0.1;
%     end
%     l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
% 
%         th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
%               acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
%               asin(z / l5); 
%         th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
%         th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
%               acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
%         c =c+1;
%         disp(a );
%         disp(th1*180/pi);
%         disp(th2*180/pi);
%         disp(th3*180/pi );
% 
% end
% 
% 
% 
% 
% disp('L4:');disp(l4);
% disp(th0*180/pi);
% disp(th1*180/pi);
% disp(th2*180/pi);
% disp(th3*180/pi);
% 
% 
% %% plot robot
% hold on;
% grid on;
% %for i = 0 : 0.1: 1
%  if isreal(th1) && isreal(th2) && isreal(th3)
%    Robot.teach([th0 th1 th2 th3]);
%    plot3(x, y, z, 'b.');
%    axis([-40 40 -40 40 -15 60]);
%    pause(0.1);
%  else 
%      plot3(x, y, z, 'r.');
%      disp("can't reach this point");
%      pause(0.2);
%  end
%  end

% %
%   for x = 9:-1:0
% disp("hi");
% if ((y^2)+(x^2))^0.5 <=l2 
%     disp("can't reach this point : too small");
%     break;
% elseif ((y^2)+(x^2))^0.5 >= l1+l2+l3
%     disp("can't reach this point : too large");
%     break;
% end
% l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + y^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
% l5 = (x^2 + y^2 + z^2)^0.5;
% 
% 
% th0 = 0;
% if (~isnan(atan(x/x))) %check that theta1 value is valid
%     if x<0
%        th0 =atan(x/x) + pi ; 
%     else
%        th0 =atan(x/x) ;
%     end
% end
% 
% th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
%       acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
%       asin(z / l5); 
% th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
% th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
%       acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
% 
% c= 0;
% 
% while ((th1 > pi/2 || th1 < -pi/2)||(th2 > pi/2 || th2 < -pi/2)||(th3 > pi/2 || th3 < -pi/2))
% 
%     if ((th1 < -pi/2  || th2 > pi/2 || th3 < -pi/2))
%         a = a - 0.1;
%     elseif (th1 > pi/2  || th2 < -pi/2 || th3 > pi/2)
%         a = a + 0.1;
%     end
%     l4=(((z + sin(pi - a) * l3)^2)+((((x^2 + x^2)^0.5) + cos(pi - a) * l3)^2))^0.5;% l4
% 
%         th1 = acos( ( (l1^2) + (l4^2) - (l2^2) ) / (2*l1*l4) ) + ...
%               acos( ( (l4^2) + (l5^2) - (l3^2) ) / (2*l4*l5) ) + ...
%               asin(z / l5); 
%         th2 = acos( ( (l1^2) + (l2^2) - (l4^2) ) / (2*l1*l2) ) - pi; 
%         th3 = acos( ( (l2^2) + (l4^2) - (l1^2) ) / (2*l2*l4) ) + ...
%               acos( ( (l3^2) + (l4^2) - (l5^2) ) / (2*l3*l4) ) - pi; 
%         c =c+1;
%         disp(a );
%         disp(th1*180/pi);
%         disp(th2*180/pi);
%         disp(th3*180/pi );
% 
% end
% 
% 
% 
% 
% disp('L4:');disp(l4);
% disp(th0*180/pi);
% disp(th1*180/pi);
% disp(th2*180/pi);
% disp(th3*180/pi);
% 
% 
% % plot robot
% hold on;
% grid on;
% for i = 0 : 0.1: 1
%  if isreal(th1) && isreal(th2) && isreal(th3)
%    Robot.teach([th0 th1 th2 th3]);
%    plot3(x, y, z, 'b.');
%    axis([-40 40 -40 40 -15 60]);
%    pause(0.1);
%  else 
%      plot3(x, y, z, 'r.');
%      disp("can't reach this point");
%      pause(0.2);
%  end
% end
