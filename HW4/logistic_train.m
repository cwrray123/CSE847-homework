function [weights] = logistic_train(data, labels, epsilon, maxiter)
    if ~maxiter
        maxiter = 1000;
    end
    if ~epsilon
        epsilon = 1e-5;
    end
    
    x = data;
    y = labels;
    
    [N,p]=size(x);
    iniweights = zeros(p,1);
    [J,grad]=computecost(iniweights,x,y);
    
    options = optimset('GradObj', 'on', 'Maxiter', maxiter, 'TolFun', epsilon);
    weights = fminunc(@(t)computecost(t,x,y),iniweights,options);
    
    
end