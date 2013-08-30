function occ = get_signature_occupancy(x)
xs = size(x);
occ=0;
for i=1:xs(1),
    for j=1:xs(2),
        occ=occ+x(i,j);
    end
end
occ = occ/(xs(1)*xs(2));
end