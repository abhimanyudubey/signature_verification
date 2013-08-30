function feat_vec = get_features(folder,name_vec,size_vec,fvlength,res)
nn = size(name_vec);
nn = nn(2);
feat_vec = zeros(nn*size_vec,fvlength);
for i=1:nn,
    for j=1:size_vec,
        filename = char(strcat(folder,'/',name_vec(1,i),int2str(j),'.jpg'));
        ft = get_feature_vector(preprocess(filename,res));
        for k = 1:fvlength-1,
            feat_vec((i-1)*size_vec+j,k)=ft(k);
        end
        feat_vec((i-1)*size_vec+j,fvlength)=get_aspect_ratio(preprocess_unresize(filename));
    end
end
feat_vec = transpose(feat_vec);
end
