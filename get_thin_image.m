function dct_matrix = get_thin_image(x)
im=imread(x); %read image from the user
im2=im;
im=rgb2gray(im);
imwrite(im,'stage1.jpg');
im=medfilt2(im);
imwrite(im,'stage2.jpg');
im=im2bw(im, 0.5);
imwrite(im,'stage3.jpg');
im=imcomplement(im);
imwrite(im,'stage4.jpg');
s = regionprops(im, 'BoundingBox');
for i=1:size(s),
    img = imcrop(im2,s(i).BoundingBox);
    filename = strcat('signs/',int2str(i),'image.jpg');
    imwrite(img,filename);
end
im = imcrop(im, s(1).BoundingBox);
imwrite(im,'stage5.jpg');
im=imresize(im,[resolution resolution]);
imwrite(im,'stage6.jpg');
im=bwmorph(im,'thin',Inf);
imwrite(im,'stage7.jpg');
dct_matrix = im;s
end