function nb = get_cross_points(x)
nb=0;
sizex = size(x);
for i=1:sizex(1),
    for j=1:sizex(2),
        if(x(i,j)==1),
            n=0;
            for k=i-1:i+1,
                 for l=j-1:j+1,
                       if(~(l<1 || l>sizex(1) || k<1 || k>sizex(2))),
                            n=n+x(k,l);
                       end
                 end
            end
            if (n>=4),
                nb=nb+1;
            end
        end
    end
end
end