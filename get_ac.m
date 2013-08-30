function ac = get_ac(x,y)
ac=0;
for i=1:250,
    ac=ac+get_correlation(get_dct_transform(x,i),get_dct_transform(y,i));
end
ac=ac/250;
end

