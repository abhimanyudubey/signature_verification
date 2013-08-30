function outcord = get_median_value(input_img)
sizeimg = size(input_img);
sum_total = 0;
outcord = zeros(2,1);
sum_x=0;
sum_y=0;
for i=1:sizeimg(1),
    for j=1:sizeimg(2),
        sum_x = sum_x + input_img(i,j)*(i);
        sum_y = sum_y + input_img(i,j)*(j);
        sum_total = sum_total + input_img(i,j);
    end
end
outcord(1) = sum_x/sum_total;
outcord(2) = sum_y/sum_total;
end
