function [final_img] = background_segment(I)
%C=bwareafilt(I ,num );
Ibw = im2bw(I);
figure,imshow(~Ibw);
Ifill = imfill(Ibw,'holes');
Iarea = bwareaopen(Ifill,6000);
Ifinal = bwlabel(Iarea);
stat = regionprops(Ifinal,'boundingbox');
for cnt = 1 : numel(stat)
bb = stat(cnt).BoundingBox;
rectangle('position',bb,'edgecolor','r','linewidth',2);
end
final_img=imcrop(Ibw,bb);
end