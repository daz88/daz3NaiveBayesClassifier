function [ yPred ] = nbcPredict( likelihood_matrix,priors,xtest )
%NBCPREDICT Summary of this function goes here
%   Detailed explanation goes here

[m,n]=size(xtest);
test=xtest;
for i=1:m
    for j=1:n
        if test(i,j)~=0
            test(i,j)=1;
        end
    end
end

%pArg=zeros(m,2);
yPred=zeros(m,1);

for i=1:m
    instance=test(i,:);
    prob1=zeros(1,size(test,2));
    prob2=zeros(1,size(test,2));
    for j=1:n
        if instance(1,n)==0
            prob1(1,n)=1-likelihood_matrix(1,n);%word not presence
            prob2(1,n)=1-likelihood_matrix(2,n);
        else
            prob2(1,n)=likelihood_matrix(1,n);%word presence
            prob2(1,n)=likelihood_matrix(2,n);
        end
    end
    %pArg(i,1)=prios(1,1)*prod(prob1);
    %pArg(i,2)=prios(2,1)*prod(prob2);
    if (priors(1,1)*prod(prob1))>(priors(2,1)*prod(prob2))
        yPred(i,1)=1;
    else
        yPred(i,1)=2;
    end
end

end

