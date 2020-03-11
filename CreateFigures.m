function [  ] = CreateFigures( Z0 , ZJ , ZnJ, ZGS, ZnGS, Roots, c , R , CountJ, CountGS , m)
%CreateFigures Creates various figures depicting how the algorithm performed

close all

scrsz = get(groot,'ScreenSize');

scale = 1.1; % Adjust this to zoom in and out

XRange = [real(c)-scale*R , real(c)+scale*R];
YRange = [imag(c)-scale*R , imag(c)+scale*R];

figure('name','Initial Approximations vs Roots','Position',[0.001*scrsz(3)/3 1.73*scrsz(4)/3 scrsz(3)/3 scrsz(4)/3])
plot(real(Roots),imag(Roots),'*',real(Z0),imag(Z0),'d')
title('Initial Approximations vs Roots')
l1 = legend('Initial Approxmiations','Roots');
l1.Location = 'southoutside';

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
%viscircles([real(c),imag(c)],R)

Title3 = sprintf('Approximated Roots after %i Iterations (Jacobi)',CountJ);

figure('name','Approximated Roots vs Roots','Position',[1.8*scrsz(3)/3 1.51*scrsz(4)/3 scrsz(3)/2.5 scrsz(4)/2.5])
plot(real(Roots),imag(Roots),'*',real(ZJ),imag(ZJ),'o')
title(Title3)
l2 = legend('Approximated Roots','Roots');
l2.Location = 'southoutside';

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
%viscircles([real(c),imag(c)],R)

%% Plots Approximation Paths
figure('name','Approximation Path (Jacobi)','Position',[1.8*scrsz(3)/3 0.02*scrsz(4)/3 scrsz(3)/2.5 scrsz(4)/2.5])
plot(real(Roots),imag(Roots),'*',real(ZnJ),imag(ZnJ),'-')
title('Approximation Path (Jacobi)')
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

Title4 = sprintf('Approximated Roots after %i Iterations (Gauss-Siedel)',CountGS);

figure('name','Approximated Roots (Gauss-Siedel)','Position',[0.59*scrsz(3)/3 1.51*scrsz(4)/3 scrsz(3)/2.5 scrsz(4)/2.5])
plot(real(Roots),imag(Roots),'*',real(ZGS),imag(ZGS),'o')
title(Title4)
l2 = legend('Approximated Roots','Roots');
l2.Location = 'southoutside';

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
%viscircles([real(c),imag(c)],R)

%% Plots Approximation Paths
figure('name','Approximation Path (Gauss-Siedel)','Position',[0.59*scrsz(3)/3 0.02*scrsz(4)/3 scrsz(3)/2.5 scrsz(4)/2.5])
plot(real(Roots),imag(Roots),'*',real(ZnGS),imag(ZnGS),'-')
title('Approximation Path (Gauss-Siedel)')
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

MJ = MaxDiffFinder(ZnJ,Roots);
MGS = MaxDiffFinder(ZnGS,Roots);
n = size(MJ,1);
nm1 = n-1;
np1 = n+1;
figure('name','Max Error per Step')
plot(0:nm1,MJ(:,1),'-',0:nm1,MGS(:,1),'-')
xlabel('Number of Iterations')
ylabel('Maximum Error')
title('Max Error per Step')
l3 = legend('Jacobi','Gauss-Seidel');
l3.Location = 'best';

ax=gca;
ax.XLim = [0 nm1];
Tick =ceil(ax.XTick(2)-ax.XTick(1));
ax.XTick = 0 : Tick : nm1;
end

