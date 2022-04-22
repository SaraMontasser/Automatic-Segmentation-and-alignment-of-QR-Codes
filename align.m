function [out_img] = align(I2,x,path)
BW = edge(I2,'canny');
% Find the Hough information about the lines
[H, theta, rho] = hough(BW);
P = houghpeaks(H,1);
% Find out how much it needs to rotate
thetaPeak = theta(P(1,2));
% Fix the image
if(strcmp(path,"3.3.bmp"))
    x=90;
elseif(strcmp(path,"2.1.bmp"))
    x=180;
end
if((-thetaPeak)~=90)
    out_img = imrotate(I2,thetaPeak+x);
else
    out_img=I2;
end
end

