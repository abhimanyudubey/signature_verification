function newimage=filter(image)
newimage=zeros(size(image));
imgsize = size(image);
img_l = imgsize(1);
img_b = imgsize(2);
for i = 1:img_l,
    for j = 1:img_b,
        data_image = image(i,j,:);
        data_image(1) = data_image(1)*0.98;
        data_image(2) = data_image(2)*0.78;
        data_image(3) = data_image(3)*0.45;
        newimage(i,j,:) = data_image;
    end
end
imshow(newimage);
end