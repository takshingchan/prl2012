function [fq1,fq2] = qqf(f,type,f0,sigma)
%QQF Quaternionic quadrature filter.
%   [fq1,fq2] = QQF(f,type,f0,sigma) performs quaternionic quadrature
%   filtering on the image f.
%
%   Inputs:
%     f         - Real image.
%     type      - Either 'cauchy', 'gaussderiv', or 'loggabor'.
%     f0        - Center frequency.
%     sigma     - Bandwidth parameter.
%
%   Outputs:
%     fq1, fq2  - Quaternionic image fq1+fq2j.
%
%   See also SQF, QFT, IQFT.

%   References:
%     [1] T.-S. Chan and A. Kumar, "Reliable ear identification using 2-D
%         quadrature filters," Pattern Recognition Lett., vol. 33, no. 14,
%         pp. 1870-1881, 2012.
%     [2] D. Boukerroui, J. A. Noble, and M. Brady, "On the choice of band-
%         pass quadrature filters," J. Math. Imaging Vision, vol. 21, pp.
%         53-80, 2004.

%   Copyright 2017 Tak-Shing Chan

% Generate a 2-D Fourier grid.
[M,N] = size(f);
M2 = fix(M/2);
N2 = fix(N/2);
[v,u] = ndgrid([0:M-1-M2 -M2:-1]*.5/M2,[0:N-1-N2 -N2:-1]*.5/N2);
r2 = u.^2+v.^2;

% Choose a band-pass filter.
switch type
    case 'cauchy'
        HB = r2.^(f0*sigma/2).*exp(-sigma*sqrt(r2));
    case 'gaussderiv'
        HB = r2.^((f0*sigma)^2/2).*exp(-sigma^2*r2);
    case 'loggabor'
        HB = exp(-log(sqrt(r2)/f0).^2/(2*log(sigma/f0)^2));
    otherwise
        error('Filter type must be cauchy, gaussderiv, or loggabor.')
end

% Perform quaternionic quadrature filtering.
FQ = (1+sign(u)).*(1+sign(v)).*HB;
[F1,F2] = qft(f,zeros(M,N));
[fq1,fq2] = iqft(FQ.*F1,FQ.*F2);
