a=imread('1.jpg');

gray=rgb2gray(a);
level=graythresh(a);
BW=imbinarize(gray,level);
%imcontour(BW,3)
se = strel('disk',10);
B=imerode(BW,se);

L = bwlabel(B);

s = regionprops(L,'centroid');
centroids = cat(1,s.Centroid);


boundary = bwtraceboundary(BW,[75, 95],'W',8,812,'clockwise');

BW4=bwmorph(BW,'remove');
figure, imshow(BW4);
figure, imshow(BW);
boundaries = bwboundaries ( BW4,'noholes' ) ;
hold on;
plot(boundaries{1}(:,2),boundaries{1}(:,1),'g','LineWidth',3);
plot(centroids(:,1),centroids(:,2),'b*')
hold off;