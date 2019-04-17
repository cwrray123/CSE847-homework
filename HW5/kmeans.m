clc;
clear;

data1=normrnd(1,1,5,1);
data2=normrnd(10,1,5,1);
data3=normrnd(15,1,5,1);
X=[data1;data2;data3];
max = 100;
K=3;

%Original kmeans
center = initCentroids(X, K);

for i=1:max
  cluster = getClosestCentroids(X, center);
  center = computeCentroidsnD(X, cluster, K);
end

%Spetral relaxation
Y = spetralrelaxation(X,K);

max = 100;
K=3;
center1 = initCentroids(Y, K);

for i=1:max
  cluster1 = getClosestCentroids(Y, center1);
  center1 = computeCentroidsnD(Y, cluster1, K);
end





