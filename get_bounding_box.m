function bbox = get_bounding_box(x)
bbox =  zeros(4,1);
imsize = size(x);
imwidth = imsize(1);
imheight = imsize(2);
vertical_sum = zeros(imwidth,1);
horizontal_sum = zeros(imheight,1);
for k=1:imheight,
    for j=1:imwidth,
        horizontal_sum(k)=horizontal_sum(k)+x(j,k);
        vertical_sum(j)=vertical_sum(j)+x(j,k);
    end
end
for i=1:imheight,
    if(horizontal_sum(i)>0),
        bbox(1)=i;
        break;
    end
end
for i=1:imwidth,
    if(vertical_sum(i)>0),
        bbox(2)=i;
        break;
    end
end
for i=imheight:-1:1,
    if(horizontal_sum(i)>0),
        bbox(3)=i-bbox(1);
        break;
    end
end
for i=imwidth:-1:1,
    if(vertical_sum(i)>0),
        bbox(4)=i-bbox(2);
        break;
    end
end
end