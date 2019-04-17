function clusters = getClosestCentroids(X, center)
  K = size(center, 1);
  clusters = zeros(size(X,1), 1);
  m = size(X,1);

  for i=1:m
    k = 1;
    min_dist = sum((X(i,:) - center(1,:)) .^ 2);
    for j=2:K
        dist = sum((X(i,:) - center(j,:)) .^ 2);
        if(dist < min_dist)
          min_dist = dist;
          k = j;
        end
    end
    clusters(i) = k;
  end
end