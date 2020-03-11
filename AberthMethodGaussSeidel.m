function [ Z , Count , Zn1] = AberthMethodGaussSeidel( P , Z , StopCriteria, IterOrEps,Roots)
%AberthMethodGaussSeidel Performs the GaussSeidel version of the iterative
%step of Aberths method until the StopCriteria is met


if ~exist('IterOrEps','var')
    IterOrEps = 1;
end

if StopCriteria(1) < 1 || mod(StopCriteria(1),1) ~= 0
   fprintf('Error: StopCriteria(1) must be a positive integer.\n')
   return
end

n = size(Z,2);

if size(P,2) == 2
    Z = -P(2)/P(1);
    return
end

Q = polyder(P);
A = zeros(1,n);
MaxError = realmax;
Count = 1;
CountStop = StopCriteria(1);

Zn1 = zeros(CountStop+1,n);
Zn1(1,:) = Z;

if IterOrEps == 1;
    ErrorStop = 0;
elseif IterOrEps == 0;
    ErrorStop = StopCriteria(2);
end

while Count <= CountStop && MaxError > ErrorStop

    for j = 1:n
        jm1 = j-1;
        A(j) = sum(1./(Z(j) - Z(1:jm1))) + sum(1./(Z(j) - Z(j+1:n)));
        N = polyval(P,Z(j))/polyval(Q,Z(j));
        Z(j) = Z(j) - N/(1 - N*A(j));
    end
    
    Count = Count + 1;
    Zn1(Count,:) = Z;
    MaxError = MaxDiffFinder(Z,Roots);
end

Zn = Zn1(1:Count,:);
Count = Count - 1;

end

