function [ c , R ] = RFinderNewton( P )
%RFinderNewton Uses a theorem by Cauchy to find a value R such that all zeros of
%the polynomial p lie within the closed disk of radius R centered at
%-c_{n-1}/n


np1 = size(P,2);

n = np1 - 1;

c = - P(2)/n;

Q = zeros(1,np1);

Q(1) = 1;

for k = 3:np1
    
    for l = k-1:-1:0
       
        Q(k) = Q(k) + P(k-l)*(c ^ (l))*nchoosek( n - (k-1-l), l);
    
    end
end

S = zeros(1,np1);
S(1) = 1;
S(3:end) = -abs(Q(3:end));

if S(2:end) == zeros(1,n)
    R = -1; % Used to pass program state: roots all equal to c
    return
else
    
R = 2;

t = polyder(S);

while polyval(t,R) < 0

        R = 2*R;
    
end
    
while polyval(S,R)/polyval(t,R) > 0.00001
   
    R = R - polyval(S,R)/polyval(t,R);

end

while polyval(S,R) < 0

        R = R + 1;
    
end


    % Prints "R found!" when this loop finishes. Useful for knowing if the
    % Script is getting hung up in this loop, or elsewhere (usually the
    % loop in RootFinderAlgo, if 
    % fprintf('R found!\n') 
 
end

end

