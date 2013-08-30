function feat_vec = get_destination_vector(name_vec,size_vec)
nn = size(name_vec);
nn = nn(2);
feat_vec = zeros(nn*size_vec,nn);
    for i=1:nn,
        for j=1:size_vec,
           feat_vec((i-1)*size_vec+j,i)=1;
        end
    end
end
