function [ mcr ] = cValidationLap( xtrain, yclass, folder )
%CVALIDATIONLAP Summary of this function goes here
%   Detailed explanation goes here

indices=crossvalind('kfold',yclass,folder);
mrate=zeros(folder,1);
for i=1:folder
    test=(indices==1);
    train=~test;
    [likelihood_matrix, priors]=nbcLaplaceTrain(xtrain(train,:),yclass(train,:));
    yfit=nbcPredict(likelihood_matrix, priors,xtrain(test,:));
    %bad=~strcmp(yfit,yclass(test,:));
    bad=~(yfit==yclass(test,:));
    mrate(i,1)=sum(bad)/size(yclass(test,:),1);
end
mcr=sum(mrate)/folder;

end

