function center = initCentroids(X, K)
    center = zeros(K,size(X,2)); 
    randidx = randperm(size(X,1));
    center = X(randidx(1:K), :);
end