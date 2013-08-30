function dct_matrix = preprocess_unthin(x,res)
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
im=imresize(im,[1005 1005]);
im=imcrop(im, [6 6 990 990]);
im=imcrop(im, get_bounding_box(im));
imwrite(im,'stage5.jpg');
im=imresize(im,[res res]);
imwrite(im,'stage6.jpg');
dct_matrix = im;
end