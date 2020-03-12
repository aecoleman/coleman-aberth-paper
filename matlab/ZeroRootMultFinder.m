function [ Q , m ] = ZeroRootMultFinder( P )
%ZeroRootMultFinder Finds m, multiplicity the polynomial p has zero
%as a root, and returns a polynomial q such that (z^m)*q(z) = p(z)

m=0;
while P(end-m)==0
    m = m+1;
end
Q = P(1:end-m);
end

