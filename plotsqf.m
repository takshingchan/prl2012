function plotsqf
%PLOTSQF Plot spherical quadrature filters.
%   PLOTSQF plots the monogenic Cauchy, monogenic Gaussian derivative, and
%   monogenic log-Gabor filters having a bandwidth of 2.0310 octaves.
%   Top row: (a) real and (b-c) vector parts with a center frequency of
%   1/18. Bottom row: (d) real and (e-f) vector parts with a center
%   frequency of 1/54.
%
%   See also PLOTQQF, SQF.

%   References:
%     [1] T.-S. Chan and A. Kumar, "Reliable ear identification using 2-D
%         quadrature filters," Pattern Recognition Lett., vol. 33, no. 14,
%         pp. 1870-1881, 2012.

%   Copyright 2017 Tak-Shing Chan

% Generate a unit impulse.
f = zeros(180,50);
f(91,26) = 1;

% Plot monogenic Cauchy filters.
[fs1,fs2] = sqf(f,'cauchy',1/18,2.8737*18);
[fs3,fs4] = sqf(f,'cauchy',1/54,2.8737*54);
figure
subplotsqf(1,fs1)
subplotsqf(2,real(fs2))
subplotsqf(3,imag(fs2))
subplotsqf(4,fs3)
subplotsqf(5,real(fs4))
subplotsqf(6,imag(fs4))

% Plot monogenic Gaussian derivative filters.
[fs1,fs2] = sqf(f,'gaussderiv',1/18,1.2425*18);
[fs3,fs4] = sqf(f,'gaussderiv',1/54,1.2425*54);
figure
subplotsqf(1,fs1)
subplotsqf(2,real(fs2))
subplotsqf(3,imag(fs2))
subplotsqf(4,fs3)
subplotsqf(5,real(fs4))
subplotsqf(6,imag(fs4))

% Plot monogenic log-Gabor filters.
[fs1,fs2] = sqf(f,'loggabor',1/18,0.55/18);
[fs3,fs4] = sqf(f,'loggabor',1/54,0.55/54);
figure
subplotsqf(1,fs1)
subplotsqf(2,real(fs2))
subplotsqf(3,imag(fs2))
subplotsqf(4,fs3)
subplotsqf(5,real(fs4))
subplotsqf(6,imag(fs4))

%--------------------------------------------------------------------------
function subplotsqf(p,x)
%SUBPLOTSQF Plot a spherical quadrature filter.

subplot(2,3,p)
surf(x)
shading interp
axis off
d = daspect;
daspect([d(1) d(1) d(3)])
zoom(1.75)
text(-55,-3,['(' char(p+'a'-1) ')'])
