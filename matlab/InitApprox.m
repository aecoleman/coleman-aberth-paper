function [ Z0 , c , R ] = InitApprox( P , Alpha)
%InitApprox Finds initial approximations for polynomial zeros
% REQUIRES RFinderNewton

[c , R] = RFinderNewton(P);

if R == -1
   Z0 = c*ones(1,np1);
    return 
end

np1 = size(P,2);

n = np1 - 1;

nm1 = n - 1;

if ~exist('a','var')
    Alpha = pi/(2*n);
end

Z0(1:n) = c + R*exp(((2*pi/n)*(0:nm1) + Alpha)*1i);

end

