function [ Z ] = AberthJacobiWrapper( P , Iterations)
%AberthJacobiWrapper Calls various functions to perform Iterations
%iterations of the Jacobi version of Aberth's method on polynomial P.

StopCriteria = [Iterations, 0];

[Q1 , ZeroRootMultiplicity] = ZeroRootMultFinder( P );

Q = MonicPolyMaker(Q1);

Z0 = InitApprox(Q);

if Z0(1) == Z0(2)
   Z = Z0;
   return 
end

Z1 = AberthMethodJacobi(Q,Z0,StopCriteria);

Z = zeros(size(Z1)+ZeroRootMultiplicity);
[~,I] = sort(abs(Z1));
Z(ZeroRootMultiplicity+1:end) = Z1(I);

end

