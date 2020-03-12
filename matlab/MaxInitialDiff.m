function [ M ] = MaxInitialDiff( Z0 ,Roots)
%MaxInitialDiff Finds the maximum difference between initial approximations
%               and the roots


n1 = size(Z0,1);
n2 = size(Z0,2);

if n2 ~= size(Roots,2)
    fprintf('Error: Mismatch number of Roots vs number of Initial Approximations.')
    M = null;
else
M = zeros(1,n1);
for index = 1:n1
    Z = zeros(n1,n1);
    Z = diag(Z0(index,:))*ones(n2,n2);
    R = ones(n2,n2)*diag(Roots);

    M(1,index) = max(min(abs(Z - R),[],2));
end

end

end

