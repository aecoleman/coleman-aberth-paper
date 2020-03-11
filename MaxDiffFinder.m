function [ MaxDiff , Diffs, SRoots , SZn] = MaxDiffFinder( Zn , Roots )
%MaxDiffFinder For each iteration, finds the approximation farthest from
%any root, and returns the distance from that approximation to the nearest
%root (i.e., for each iteration, gives a real number R such that 
%all approximations are within distance R of a root of the polynomial)

[~,I] = sort(abs(Roots));
Roots = Roots(I);
[Iter , n] = size(Zn);
[~,I] = sort(abs(Zn(Iter,:)));
Zn = Zn(:,I);
Diffs = zeros(n,n,Iter);

SZn = zeros(n,n,Iter);
for index = 1:n
    SRoots(:,index,1) = Roots(1,:);
end

for index = 1:Iter
   for index2 = 1:n
        SZn(index2,:,index) = Zn(index,:);
   end 
end

for index = 1:Iter
   Diffs(:,:,index) = abs(SZn(:,:,index) - SRoots); 
end

MaxDiff = reshape(max(min(Diffs,[],1),[],2),[],1);

end