data = importdata('data.txt', ' ', 0);
labels = importdata('labels.txt', ' ', 0);
data = [data ones(4601,1)];  

%Question 1:
                             
epsilon = 0;
maxiter = 0;
% Create the train and test sets
x_train = data(1:2000,:);
y_train = labels(1:2000,:);
x_test = data(2001:end,:);
y_test = labels(2001:end,:);

n = [200 500 800 1000 1500 2000];

acc = [];

for i=1:length(n)                           %Train and test for each n size
    correct = 0;
    x = x_train(1:n(i),:);
    y = y_train(1:n(i),:);
    weights = logistic_train(x, y, epsilon, maxiter); 
    prediction = sigmf(x_test*weights, [1 0]);                      
                
    pred = round(prediction);                                       
    for j = 1:length(y_test)
       if y_test(j) == pred(j)
           correct = correct + 1;
       end
    end
    acc(i) = correct/length(y_test);
end


 figure(1)
 plot(n, acc);
 
 %Question 2:
 
opts.rFlag = 1;
opts.tol = 1e-6;
opts.tFlag = 4;
opts.maxIter = 5000;
 
 par = [0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
 
 acc2 = [];
 for i=1:length(par)
     correct = 0;
     [w,c] = LogisticR(x_train, y_train, par(i), opts);
     for  j= 1:length(y_test)
       if y_test(j) == pred(j)
           correct = correct + 1;
       end
    end
    acc2(i) = correct/length(y_test);
 end
 
 figure(2)
 plot(par,acc2);
