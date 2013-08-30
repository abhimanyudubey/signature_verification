function dct_matrix = get_dct_transform(x, resolution)
im=imread(x); %read image from the user
im=rgb2gray(im);
imwrite(im,'stage1.jpg');
im=medfilt2(im);
imwrite(im,'stage2.jpg');
im=im2bw(im, 0.5);
imwrite(im,'stage3.jpg');
im=imcomplement(im);
imwrite(im,'stage4.jpg');
im=imresize(im,[1005 1005]);
im=imcrop(im, [6 6 999 999]);
s = regionprops(im, 'BoundingBox');
for i=1:size(s),
    img = imcrop(im,s(i).BoundingBox);
    filename = strcat(int2str(i),'image.jpg');
    imwrite(img,filename);
end
im = imcrop(im, s(1).BoundingBox);
imwrite(im,'stage5.jpg');
im=imresize(im,[resolution resolution]);
imwrite(im,'stage6.jpg');
im=bwmorph(im,'thin',Inf);
imwrite(im,'stage7.jpg');
imsize = size(im);
imwidth = imsize(1);
imheight = imsize(2);
dct_matrix = zeros(20,20);
for k1=1:20,
    for k2=1:20,
        dct_ij=0;
        for n1=1:imheight,
            for n2=1:imwidth,
                dct_ij=dct_ij+(im(n1,n2)*cos(3.14/(imheight)*(n1+0.5)*k1)*cos(3.14/(imwidth)*(n2+0.5)*k2));
            end
        end
        dct_matrix(k1,k2)=dct_ij;
    end
end
end