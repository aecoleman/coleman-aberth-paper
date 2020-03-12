function [ Q ] = MonicPolyMaker( P )
%MonicPolyMaker Takes input polynomial P and outputs a monic polynomial
%with the same zeros

n = size(P,2); 
index = 1;

 while P(index) == 0 && index <= n;
     index = index + 1;
 end

Q = P(index:end)/P(index);
end

