function plotqqf
%PLOTQQF Plot quaternionic quadrature filters.
%   PLOTQQF plots the quaternionic Cauchy, quaternionic Gaussian
%   derivative, and quaternionic log-Gabor filters having a bandwidth of
%   2.0310 octaves. Top row: (a) real and (b-d) i,j,k parts with a center
%   frequency of 1/18. Bottom row: (e) real and (f-h) i,j,k parts with a
%   center frequency of 1/54.
%
%   See also PLOTSQF, QQF.

%   References:
%     [1] T.-S. Chan and A. Kumar, "Reliable ear identification using 2-D
%         quadrature filters," Pattern Recognition Lett., vol. 33, no. 14,
%         pp. 1870-1881, 2012.

%   Copyright 2017 Tak-Shing Chan

% Generate a unit impulse.
f = zeros(180,50);
f(91,26) = 1;

% Plot quaternionic Cauchy filters.
[fq1,fq2] = qqf(f,'cauchy',1/18,2.8737*18);
[fq3,fq4] = qqf(f,'cauchy',1/54,2.8737*54);
figure
subplotqqf(1,real(fq1))
subplotqqf(2,imag(fq1))
subplotqqf(3,real(fq2))
subplotqqf(4,imag(fq2))
subplotqqf(5,real(fq3))
subplotqqf(6,imag(fq3))
subplotqqf(7,real(fq4))
subplotqqf(8,imag(fq4))

% Plot quaternionic Gaussian derivative filters.
[fq1,fq2] = qqf(f,'gaussderiv',1/18,1.2425*18);
[fq3,fq4] = qqf(f,'gaussderiv',1/54,1.2425*54);
figure
subplotqqf(1,real(fq1))
subplotqqf(2,imag(fq1))
subplotqqf(3,real(fq2))
subplotqqf(4,imag(fq2))
subplotqqf(5,real(fq3))
subplotqqf(6,imag(fq3))
subplotqqf(7,real(fq4))
subplotqqf(8,imag(fq4))

% Plot quaternionic log-Gabor filters.
[fq1,fq2] = qqf(f,'loggabor',1/18,0.55/18);
[fq3,fq4] = qqf(f,'loggabor',1/54,0.55/54);
figure
subplotqqf(1,real(fq1))
subplotqqf(2,imag(fq1))
subplotqqf(3,real(fq2))
subplotqqf(4,imag(fq2))
subplotqqf(5,real(fq3))
subplotqqf(6,imag(fq3))
subplotqqf(7,real(fq4))
subplotqqf(8,imag(fq4))

%--------------------------------------------------------------------------
function subplotqqf(p,x)
%SUBPLOTQQF Plot a quaternionic quadrature filter.

subplot(2,4,p)
surf(x)
shading interp
axis off
d = daspect;
daspect([d(1) d(1) d(3)])
zoom(1.75)
text(-58,-5,['(' char(p+'a'-1) ')'])
