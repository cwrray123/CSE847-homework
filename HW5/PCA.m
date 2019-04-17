clc;
clear;
load USPS.mat;
P=[10 50 100 200];
%Centering
meanA=mean(A);
[m,n]=size(A);
A=A-repmat(meanA,m,1);

X = A'*A/m;
[U,S,V]=svd(X);


%Reconstruction errors
error= zeros([1,length(P)]);
for i= 1: length(P)
    B=U(:,1:P(i));
    error(i) = norm(A-A*(B*B'),'fro')^2;
end

%Image
clf;
for j=1:2  
    for i = 1:4
        B=U(:,1:P(i));
        RA2 =reshape(A(j,:)*(B*B')+meanA, 16, 16) ; %Reconstructed
        subplot(2,length(P)+1,(j-1)*(length(P)+1)+i ), imshow(RA2')
    end
    A2 = reshape(A(j,:)+meanA, 16, 16); %Original
    subplot(2,length(P)+1,j*(length(P)+1) ), imshow(A2') 
end
