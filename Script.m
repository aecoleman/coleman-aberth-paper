clear all
format longG
close all

% Number of iterations to run if IterOrEps = 1
% Maximum number of iterations to run if IterOrEps = 0
% If IterOrEps = 0, may run fewer than Iterations iterations
Iterations = 35;

% Set to 0 to use alpha = 0.
% Set to -1 to use alpha = pi/2m.
Alpha = 0;


% How small MaxError must be for while loop in RootFinderAlgo to terminate
Epsilon = 10^(-3); % Only used if IterOrEps = 0

% Use IterOrEps = 1 to run RootFinderAlgo for Iterations iterations
% Use IterOrEps = 0 to run RootFingerAlgo until MaxError < Epsilon
IterOrEps = 0;

StopCriteria = [Iterations, Epsilon];

%% Randomly Chooses Roots %%%%%%%%%%%%%%%%%%%%%%%%%

n = randi(10,1,1)+2; % Randomly decide degree of polynomial, from 3 to 12
np1 = n+1;

k=5; % Change this to change how many orders of magnitude roots may be from zero

% Generates random complex numbers to use as roots
Roots = (10^k)*transpose(complex((-1)^(randi(2,1,1))*rand(n,1),(-1)^(randi(2,1,1))*rand(n,1)));

Multiplicity=2; %Change this to create a root with multiplicity Multiplicity
for i=1:Multiplicity 
    Roots(i) = Roots(1);
end

%% If desired, manually set roots here

%P_1
%Roots = [1 1 9 -11 -49];

%P_2
%Roots = [1 1 1 -8 -8 9 -11 14];

%P_3
%Roots = [1 -20 45 500 550 -600];

%Roots = [1 2 3 4 5];


%% Arranges roots in order by moduli, required for error calculation

[~,I] = sort(abs(Roots));
Roots = Roots(I);
clear I

%% Generates polynomial from Roots
P = poly(Roots);



%% Prints Roots

fprintf('Roots of polynomial p\n')
disp(transpose(Roots));

%% Change polynomial p to be monic and have no roots at zero

% Converts p to a polynomial which does not have zero as a root, while
% keeping track of the multiplicity of zero as a root
[Q , m] = ZeroRootMultFinder( P );

% Changes polynomial Q into a monic polynomial
Q = MonicPolyMaker(Q);

%% Finds initial approximations for non-zero roots of p

if Alpha == -1 % Sets Alpha to pi/2m if Alpha was set to -1 earlier
    Alpha = pi/(2*(size(Q,2)-1));
end

[Z0 , center , R] = InitApprox(Q,Alpha);

%% Set alternate initial approximations here
%Z0 = [];

%% Performs iterative steps to get better approximations
[Z1J,CountJ,Z1nJ] = AberthMethodJacobi(Q, Z0, StopCriteria, IterOrEps);
[Z1GS,CountGS,Z1nGS] = AberthMethodGaussSeidel(Q, Z0, StopCriteria, IterOrEps, Roots);


%% Replaces zero roots
ZJ = zeros(size(Z1J)+m);
[~,I] = sort(abs(Z1J));
ZJ(m+1:end) = Z1J(I);

ZGS = zeros(size(Z1GS)+m);
[~,I] = sort(abs(Z1GS));
ZGS(m+1:end) = Z1GS(I);

%Rearranges approximations used in Jacobi version
ZnJ = zeros(size(Z1nJ,1),size(Z1nJ,2)+m);
ZnJ(m+1:end,:) = Z1nJ(:,I);

%Rearranges approximations used in Gauss-Seidel version
ZnGS = zeros(size(Z1nGS,1),size(Z1nGS,2)+m);
ZnGS(m+1:end,:) = Z1nGS(:,I);

% Displays largest difference between initial approximations and actual
% value
fprintf('Initial Approximations all within %.5G of a root.\n', MaxDiffFinder(Z0,Roots))

% Displays largest difference between approximations and actual value
[MaxErrorJ,MaxErrorIndexJ] = max(abs(ZJ-Roots));
[MaxErrorGS,MaxErrorIndexGS] = max(abs(ZGS-Roots));

disp(CountJ)
disp(CountGS)

fprintf('       Maximum Error (Jacobi): %.9G\n' , MaxErrorJ)
fprintf(' Maximum Error (Gauss-Seidel): %.9G\n' , MaxErrorGS)

CreateFigures(Z0, Z1J, ZnJ, Z1GS, ZnGS, Roots, center , R , CountJ, CountGS , m);
