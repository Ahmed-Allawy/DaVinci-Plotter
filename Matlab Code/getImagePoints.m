%%
% function to get points from iamge contain a word
% it take, path of the image, x and y as positions of the result word
% scaling factor to rescale the image
%%
function [l] = getImagePoints(imagePath, ofsetX, ofsetY, scaling_factor)

% Read the letter image file
letter = imread(imagePath);

% Resize the image by the scaling factor
resized_letter = imresize(letter, scaling_factor);

% Convert the resized image to grayscale
gray_letter = rgb2gray(resized_letter);

% Threshold the grayscale image
bw_letter = gray_letter < 128;

% Sample the binary image to obtain the points to plot
[x,y] = find(bw_letter);

%chane position of image
x = x+ofsetX;
y = y+ofsetY;

% Plot the points
plot(x*(scaling_factor)^2, y*(scaling_factor)^4, '.');

l = [x*(scaling_factor)^2, y*(scaling_factor)^4,];
end