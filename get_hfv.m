function  vertical_slice = get_hfv(x)
im=imread(x);
im=rgb2gray(im);
im=medfilt2(im);
im=im2bw(im, 0.5);
im=imcomplement(im);
im=imresize(im,[1005 1005]);
im=imcrop(im, [6 6 999 999]);
s = regionprops(im, 'BoundingBox');
im = imcrop(im, s(1).BoundingBox);
im=imresize(im,[1000 1000]);
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
vertical_slice = zeros(10,1);
for k=1:10,
    for j=(100*(k-1)+1):(100*(k-1)+100),
        vertical_slice(k)=vertical_slice(k)+horizontal_sum(j);
    end
end
end