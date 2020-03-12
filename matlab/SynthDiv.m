function [ q ] = SynthDiv( p , z0 )
%SynthDiv Performs Synthetic Division of polynomial p by linear factor (z - z0)
%   Detailed explanation goes here

% Checks to make sure that (z-z0) is a factor of p
if polyval(p,z0) == 0 

m = size(p,2);
mn1 = m - 1;
q = zeros(1,mn1);

q(1) = p(1);

% Performs synthetic division
for k = 2:mn1
    q(1,k) = q(1,k-1)*z0 + p(k);
end



else

% Return p if (z-z0) is not a factor of p
q = p;

end

end

