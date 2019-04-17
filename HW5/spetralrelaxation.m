function Y = spetralrelaxation(X,K)
Z = X*X';
[V,D]=eig(Z);
A=rand(K,K);
B=orth(A);
Y = D(:,1:K)*B;
end