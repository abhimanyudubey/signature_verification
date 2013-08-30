function x_mean = get_mean(x)
x_size  = size(x);
x_length = x_size(1);
x_width = x_size(2);
x_mean = 0;
for i = 1:x_length,
    for j = 1:x_width,
        x_mean = x_mean + x(i,j);
    end
end
end