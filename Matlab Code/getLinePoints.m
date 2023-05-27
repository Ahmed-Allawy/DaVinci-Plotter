%%                                                        /
% this function takes start(x1,y1) and end(x2,y2) points /
% and 2-D array [Xn ; Yn]                               /
% depend on number of segmentations(R) for the line    /
%%
function [linePoints] = getLinePoints(x1, y1, x2, y2, R)
    dx = (x2-x1)/R;
    dy = (y2-y1)/R;
    linePoints = zeros(R+1,2);
    for i = 1:R+1
        linePoints(i,1) = x1 + (i-1) * dx;
        linePoints(i,2) = y1 + (i-1) * dy;
    end
end