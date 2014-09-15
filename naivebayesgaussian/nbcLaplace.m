function [ sum ] = nbcLaplace( data,myfolder )
%NBCLAPLACE Summary of this function goes here
%   Detailed explanation goes here

iter=3;
sum=0;
for i=1:iter
    [m,n]=size(data);
    X=data(:,2:n);
    Y=data(:,1);
    myMCR=cValidationLap(X,Y,myfolder);
    %NBCFunc=@(xtrain, ytrain, xtest)...
        %(nbcPredict(ncbMLETrain(xtrain, ytrain), xtest));
    %default 10-folder cv, X features, Y spices
    %myMCR=crossval('mcr', X, Y, 'predfun', NBCFunc, 'kfold', myfolder);
    sum=sum+(myMCR);
end
sum=sum/iter;

end

