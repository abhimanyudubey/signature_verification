function  fvec = get_feature_vector(x)
fvec = zeros(7,1);
mats = size(x);
centroid = get_median_value(x);
fvec(1) = centroid(1);
fvec(2) = centroid(2);
xx1 = x(:,1:mats(1)/2);
xx2 = x(:,(mats(1)/2)+1:mats(1));
xy1 = x(1:mats(2)/2,:);
xy2 = x((mats(2)/2)+1:mats(2),:);
xh = get_distance_x(get_median_value(xx1),get_median_value(xx2));
xv = get_distance_y(get_median_value(xx1),get_median_value(xx2));
xh = xh + mats(2)/2;
fvec(3) = xv/xh;
yh = get_distance_x(get_median_value(xy1),get_median_value(xy2));
yv = get_distance_y(get_median_value(xy1),get_median_value(xy2));
yv = yv + mats(1)/2;
fvec(4) = yh/yv;
%fvec(5) = get_cross_points(x);
%fvec(6) = get_edge_points(x);
fvec(5) = get_signature_occupancy(x);
fvec(6:13) = get_vertical_distribution(x);
fvec(14:21) = get_horizontal_distribution(x);
end