function plot_phi(Z,a0,me,n,l,m,V)
close all;
%Para = HydrogenWavfnSettings('xy','3d1',[-4,4;-4,4],[1000,1000])
%Hwavfn(Para);

%n = 3;
%l = 2;
%m = 0;

%Z = 1;
%a0 = 1;
%me = 1;
%V = 1.0e-2; % value of iso_abs_phi.

mn = 2000;
mu = (me.*mn)./(me + mn);
amu = me./mu.*a0;



% xlims = [-8 8];%.*0.125;
% ylims = [0 0];%.*0.125;
% zlims = [-8 8];%[-4 4].*0.125;
% nx = 1000;
% ny = 1;
% nz = 1000;

rlims = 15;
xlims = [-rlims rlims];%.*0.125;
ylims = [-rlims rlims];%.*0.125;
zlims = [-rlims rlims];%[-4 4].*0.125;
rn = 100;
rx = rn;
ry = rn;
rz = rn;
nx = 2*rx+1;
ny = 2*ry+1;
nz = 2*rz+1;

% xlims = [-8 8];%.*0.125;
% ylims = [-8 8];%.*0.125;
% zlims = [0 0];%[-4 4].*0.125;
% nx = 1000;
% ny = 1000;
% nz = 1;


%% Generate co-ordinates for the x-y plane

grids = zeros(nx,ny,nz);
x = repmat(reshape(linspace(xlims(1),xlims(2),nx),nx,1),[1 ny nz]);
y = repmat(reshape(linspace(ylims(1),ylims(2),ny),1,ny),[nx 1 nz]);
z = repmat(reshape(linspace(zlims(1),zlims(2),nz),1,1,nz),[nx ny 1]);

r = sqrt(x.^2 + y.^2 + z.^2);
theta = acos(z./sqrt(x.^2 + y.^2 + z.^2));
phi = atan2(y,x);

%% Calculate stages of R

r1 = sqrt( (2*Z/n/amu).^3 .* factorial(n-l-1)/(2*n*factorial(n+l)) );
r2 = exp(-Z.*r./n./amu);
r3 = (2*Z.*r/n/amu).^l;
r4 = polyval(LaguerreGen(n-l-1,2*l+1),2*Z.*r/n/amu);

R = r1.*r2.*r3.*r4;

%% Calculate spherical harmonic component

Y = compute_Ylm(l,m,theta,phi);

%% Produce total p.d.f.

psi = R.*Y;

out = sqrt(psi.*conj(psi));  % The density of probability.


[x1,y1,z1] = meshgrid(-rx:rx,-ry:ry,-rz:rz);
x1 = x1*rlims/rn;
y1 = y1*rlims/rn;
z1 = z1*rlims/rn;


isosurface(x1,y1,z1,out,V);
tl = ['n = ',num2str(n),' , l = ',num2str(l),' , m = ',num2str(m),' , |\phi| = ',num2str(V)];
title(tl,'fontsize',14.0);

end