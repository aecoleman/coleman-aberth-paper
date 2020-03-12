function [ Z ] = RootFinderWrapper( p , Iterations, graphs)
%RootFinderWrapper This function executes all of the functions needed to
% approximate zeros from a given polynomial p
%   Detailed explanation goes here

if nargin < 3 || (graphs ~= 1 && graphs ~= 0)
   graphs = 0; 
end

StopCriteria(1) = Iterations;
IterOrEps = 1;

[q , m] = ZeroRootMultFinder( p );

% Changes polynomial p into a monic polynomial
q = MonicPolyMaker(q);

%% Finds initial approximations for non-zero roots of p
[Z0 , c , R] = InitApprox(q);

%% Uses alternate initial approximations
%Z0 = ones(size(Z0));

%% Performs iterative steps to get better approximations
[Z1,Count,Zn] = RootFinderAlgo(q,Z0,StopCriteria,IterOrEps);


%% Replaces zero roots
Z = zeros(size(Z1)+m);
[~,I] = sort(abs(Z1));
Z(m+1:end) = Z1(I);

%% Display Results
if graphs == 1
   %% Plots Approximation Paths
figure('name','Approximation Path','Position',[1.00*scrsz(3)/3 0.15*scrsz(4)/3 scrsz(3)/2.5 scrsz(4)/2.5])
plot(real(Z),imag(Z),'o',real(Zn),imag(Zn),'-')
title('Approximation Path')
%l3 = legend('Approximated Roots','Roots');
%l3.Location = 'southoutside';

ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XLim = XRange;
ax.YLim = YRange;
axis equal;
ax.XGrid = 'on';
ax.YGrid = 'on';
Tick = min(ax.XTick(2)-ax.XTick(1),ax.YTick(2)-ax.YTick(1));
LowHighX = 2*floor(abs(XRange/Tick)).*(XRange./abs(XRange))*Tick;
LowHighY = 2*floor(abs(YRange/Tick)).*(YRange./abs(YRange))*Tick;
ax.XTick = LowHighX(1):Tick:LowHighX(2);
ax.YTick = LowHighY(1):Tick:LowHighY(2);

rectangle('Position',[real(c) - R, imag(c) - R, R*2, R*2],'Curvature',[1,1],'LineStyle','--') 

% Displays roots found
fprintf('Root Approximations\n')
disp(transpose(Z))


% Displays number of iterations run
fprintf('Number of Iterations: %i\n',Count)

end

end

