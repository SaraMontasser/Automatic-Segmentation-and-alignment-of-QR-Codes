function [final_img] = qrsegment(I,orig,num)
C=bwareafilt(I ,num );
[L,W]=bwlabel(C);
s=regionprops(L,'BoundingBox');
for K=1 :length(s)
ss=s(K).BoundingBox;
rectangle('Position',[ss(1),ss(2),ss(3),ss(4)],'EdgeColor','r')
end
ss=s(num).BoundingBox;
final_img=~imcrop(orig,[ss(1),ss(2),ss(3),ss(4)]);
end
