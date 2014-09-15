function [ output_args ] = nbcGT( input_args )
%NBCGT Summary of this function goes here
%   Detailed explanation goes here

n=size(data,2);
yclass=data(:,1);%class data
xtrain=data(:,2:n);%features data
classes=unique(yclass);%class names
n_classes=size(classes,1);%number of classes

likelihood_matrix = zeros(n_classes, n-1);
priors = zeros(n_classes, 1);
%evidences = zeros(size(training_vectors,2), 1);

for class=1:n_classes
    fm=xtrain(find(yclass == class), :);%data for class
    Focurr=sum(fm);%presence of each feature in class
    N=sum(Focurr);%total number of presence in class  
    % calc and store likelihoods
    likelihoods= (Focurr+1)./(N+size(xtrain,2));%(sum(fm,1) .+ k) ./ (size(fm,1) + k * size(training_vectors,2)); % laplacan smoothing
    likelihood_matrix(class, :) = likelihoods;
    % calc and store priors
    priors(class)=size(fm,1)/size(xtrain,1);%(size(fm,1) + k) / (size(training_vectors,1) + k*n_classes); % laplactian smoothing
end

end

