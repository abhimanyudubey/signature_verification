function newmap = update_pixels(oldmap,position_x,position_y,radius)
newmap = oldmap;
mapsize = size(newmap);
for i=position_x-radius:position_x+radius,
    for j=position_y-radius:position_y+radius,
        if(~(i<1 | i>mapsize(1) | j<1 | j>mapsize(2))),
            newmap(i,j)=newmap(i,j)+0.12;
        end
    end
end
if(radius~=0),
    newmap = update_pixels(newmap,position_x,position_y,radius-1);
end
end
