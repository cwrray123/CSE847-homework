function center = computeCentroidsnD(X, idx, K)

  [m,n] = size(X);
  center = zeros(K, n);
  
  for i=1:K
    xi = X(idx==i,:);
    ck = size(xi,1);
    for j = 1:n
        center(i,j) = (1/ck) * sum(xi(:,j));
    end
  end
end