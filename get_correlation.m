function result = get_correlation(x,y)
x_mean = get_mean(x);
y_mean = get_mean(y);
x_size = size(x);
y_size = size(y);
x_length = x_size(1);
x_width = x_size(2);
corr = 0;
cx=0;
cy=0;
for i=1:x_length,
    for j=1:x_width,
        cx = cx + (x(i,j)-x_mean)*(x(i,j)-x_mean);
        cy = cy + (y(i,j)-y_mean)*(y(i,j)-y_mean);
    end
end
for i=1:x_length,
    for j=1:x_width,
        corr = corr + (x(i,j)-x_mean)*(y(i,j)-y_mean);
    end
end
result = corr/sqrt((cx*cy));
end
