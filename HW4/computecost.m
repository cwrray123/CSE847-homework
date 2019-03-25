    function [J, grad] = computecost(iniweights,x,y)
        [N,~]=size(x);
    
        h = sigmf(x*iniweights,[1 0]);
    
        J = sum(y'*log(h) + (1-y)'*log(1-h)) * (-1/N);
    
        m = length(iniweights);
        grad = zeros(m,1);
        for i = 1:m
            grad(i) = (1/N) * sum((h-y)' * x(:,i));
        end
    end