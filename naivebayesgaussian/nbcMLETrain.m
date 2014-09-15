function [ likelihood_matrix, priors ] = nbcMLETrain( xtrain, yclass )
%NBCMLE Summary of this function goes here
%   MLE estimator

%n=size(data,2);
%yclass=data(:,1);%class data
%xtrain=data(:,2:n);%features data
classes=unique(yclass);%class names
n_classes=size(classes,1);%number of classes

likelihood_matrix = zeros(n_classes, size(xtrain,2));
priors = zeros(n_classes, 1);
%evidences = zeros(size(training_vectors,2), 1);

for class=1:n_classes
    fm=xtrain(find(yclass == class), :);%data for class
    Focurr=sum(fm);%presence of each feature in class
    N=sum(Focurr);%total number of presence in class  
    % calc and store likelihoods
    likelihoods=zeros(1,size(fm,2));
    for i=1:size(fm,2)
        domX=unique(fm(:,i));
        domX=[domX,zeros(size(domX,1),1)];
        for j=1:size(fm,1)
            domX(domX(:,1)==fm(j,i),2)==domX(domX(:,1)==fm(j,i),2)+fm(j,i);
        end
        likelihoods(1,i)=prod((domX(:,2)+1)./(N+size(domX,1)));
    end
    %likelihoods= Focurr./N;%(sum(fm,1) .+ k) ./ (size(fm,1) + k * size(training_vectors,2)); % laplacan smoothing
    likelihood_matrix(class, :) = likelihoods;
    % calc and store priors
    priors(class)=size(fm,1)/size(xtrain,1);%(size(fm,1) + k) / (size(training_vectors,1) + k*n_classes); % laplactian smoothing
end

    % calc evidences
    %evidences = ( (sum(training_vectors,1).+k) ./ (size(training_vectors,1)+k*2) )'; % laplacian smoothing

end

