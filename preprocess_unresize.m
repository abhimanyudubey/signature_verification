function dct_matrix = preprocess_unresize(x)
im=imread(x); %read image from the user
im=rgb2gray(im);
imwrite(im,'stage1.jpg');
im=medfilt2(im);
imwrite(im,'stage2.jpg');
level = graythresh(im);
im=im2bw(im, level);
imwrite(im,'stage3.jpg');
im=imcomplement(im);
imwrite(im,'stage4.jpg');
dct_matrix = im;
end