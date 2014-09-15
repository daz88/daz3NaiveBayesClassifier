function [ sum ] = nbcG(data, myfolder)
%NBCG Summary of this function goes here
%   this is the classifier for Q6
iter=3;
sum=0;
for i=1:iter
    [m,n]=size(data);
    X=data(:,1:n-1);
    Y=data(:,n);
    NBCFunc=@(xtrain, ytrain, xtest)...
        (predict(fitNaiveBayes(xtrain, ytrain, 'dist', 'normal'), xtest));
    %default 10-folder cv, X features, Y spices
    myMCR=crossval('mcr', X, Y, 'predfun', NBCFunc, 'kfold', myfolder);
    sum=sum+(myMCR);
end
sum=sum/iter;

end

