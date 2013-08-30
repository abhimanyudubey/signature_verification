function hdis = get_vertical_distribution(x)
x=transpose(x);
hdis = zeros(10,1);
x = get_gradient_map(x);
imwrite(x,'gradient_map.jpg');
xw = size(x);
xl = xw(1);
yl = xw(2);
for i = 2:9,
    for l = -5:5,
        sum = 0;
    for j = (i-1)*(xl/10)+l:(i*(yl/10)+l-1),
        for k = 1:yl,
            sum = sum + x(j,k);
        end
        hdis(i,1) = hdis(i,1) + sum;
    end
    hdis(i,1) = hdis(i,1)/10;
    end
end
m = mean(hdis);
for i=1:10,
    hdis(i) = hdis(i)/m;
end
hdis=hdis(2:9);
end