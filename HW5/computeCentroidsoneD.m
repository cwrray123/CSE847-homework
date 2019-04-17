function center = computeCentroidsoneD(X, idx, K)

  [m,n] = size(X);
  center = zeros(K, n);
  
  for i=1:K
    xi = X(idx==i,:);
    ck = size(xi,1);
    center(i, :) = (1/ck) * sum(xi);
    %centroids(i, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
  end
end
