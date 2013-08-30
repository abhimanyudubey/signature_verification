function  vertical_sum = get_feature_vector_old(x)
im=imread(x);
im=rgb2gray(im);
im=medfilt2(im);
im=im2bw(im, 0.5);
im=imcomplement(im);
im=imresize(im,[1005 1005]);
im=imcrop(im, [6 6 999 999]);
s = regionprops(im, 'BoundingBox');
im = imcrop(im, s(1).BoundingBox);
im=imresize(im,[500 500]);
imsize = size(im);
imwidth = imsize(1);
imheight = imsize(2);
vertical_sum = zeros(imwidth,1);
horizontal_sum = zeros(imheight,1);
for k=1:imheight,
    for j=1:imwidth,
        horizontal_sum(k)=horizontal_sum(k)+im(j,k);
        vertical_sum(j)=vertical_sum(j)+im(j,k);
    end
end
for i=1:imheight,
    vertical_sum(i)=vertical_sum(i)*horizontal_sum(i);
end