function grmap = get_gradient_map(x)
sizex = size(x);
grmap = zeros(sizex(1),sizex(2));
for i=1:sizex(1),
    for j=1:sizex(2),
        if(x(i,j)==1),
            grmap = update_pixels(grmap,i,j,3);
        end
    end
end
end
