%%
% robot has workspace, so this function map all points
% to be in this workspace
% function gets 2-D array [Xn, Yn] and limits of workspace (mix,max) distance
%%
function [path] = validateShapePoints(shapePoints, min, max)
% get x and y
x = shapePoints(:,1);
y = shapePoints(:,2);
%Calculate the distance from the origin to each point
r = sqrt(x.^2 + y.^2);

% Check which points are outside the ring
outside_ring = r > max | r < min;

% Limit the points to the ring
theta = atan2(y,x);
x(outside_ring) = max*cos(theta(outside_ring));
y(outside_ring) = max*sin(theta(outside_ring));
inside_ring = r < min;
x(inside_ring) = min*cos(theta(inside_ring));
y(inside_ring) = min*sin(theta(inside_ring));
path = [x y];

% % Display the limited points 
disp('Original points:'); 
disp([x' y']);
disp('Limited points:'); 
disp([x(outside_ring | inside_ring)' y(outside_ring | inside_ring)']);

%Draw the ring 

t = linspace(0,2*pi,100); % Create a vector of 100 equally
%Create a vector of x-coordinates for the ring
ring_x = [min*cos(t) max*cos(t)];
% Create a vector of y-coordinates for the ring
ring_y = [min*sin(t) max*sin(t)]; 
plot(x, y, 'b.', 'MarkerSize', 20); % Plot the original points as blue dots 
hold on; 
% Plot the limited points as red dots 
plot(x(outside_ring | inside_ring), y(outside_ring | inside_ring), 'r.', 'MarkerSize', 20); 
% Plot the ring as a black line with a thickness of 2 axis equal; 
% Set the aspect ratio of the plot to be equal in both directions 
plot(ring_x, ring_y, 'k-', 'LineWidth', 2); 
xlabel('X'); % Label the x-axis
ylabel('Y'); % Label the y-axis 
legend('Original points', 'Limitedpoints', 'Ring'); % Add a legend to the plot

end