function [final_img] = qrsegment2(out_img,x)
[L,W]=bwlabel(out_img);
s=regionprops(L,'all');
for K=1 :length(s)
ss=s(K).BoundingBox;
rectangle('Position',[ss(1),ss(2),ss(3),ss(4)],'EdgeColor','r')
if( (s(K).Extent>=0.8))
final=imcrop(x,[ss(1),ss(2),ss(3),ss(4)]);
final_img=imclose(final,strel('square',2));
%figure,imshow(final_img);
end
end

end

