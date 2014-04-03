function dc2val = testFunction(bvals,dbvals,H1,H2,weights)

n = 3;
H = cell(n,n);

% Fix the H2 matrix first, does this speed up?
[X,Y,Z] = size(H2);
H2_fixed = zeros(X,Y,Z);

for i = 1:n
 H2_fixed(:,:,i) = H2(:,:,i) .* weights;
end



for i = 1:n
    for j = 1:n
        H{i,j} = bvals'*sparse(diag(H1(:,i,j)))*bvals - ...
               2*dbvals'*sparse(diag(H2_fixed(:,i,j)))*bvals - ...
               2*bvals' *sparse(diag(H2_fixed(:,j,i)))*dbvals;
    end
    H{i,i} = H{i,i} + 2*dbvals'*sparse(diag(weights(:,i)))*dbvals;
end
Hmat = blocks2mat(H);
dc2val = Hmat;

end