function d = hd(f1,f2,g1,g2)
%HD Hamming distance.
%   d = HD(f1,f2,g1,g2) returns the normalized Hamming distance between
%   two phase-quantized images f and g.
%
%   Inputs:
%     f1, f2    - Phase-quantized image f.
%     g1, g2    - Phase-quantized image g.
%
%   Outputs:
%     d         - Normalized Hamming distance bewteen f and g.
%
%   See also QQF, SQF, PHASEQUANT.

%   References:
%     [1] T.-S. Chan and A. Kumar, "Reliable ear identification using 2-D
%         quadrature filters," Pattern Recognition Lett., vol. 33, no. 14,
%         pp. 1870-1881, 2012.
%     [2] J. Daugman, "The importance of being random: Statistical
%         principles of iris recognition," Pattern Recognition, vol. 36,
%         no. 2, pp. 279-291, 2003.

%   Copyright 2017 Tak-Shing Chan

if ~isequal(size(f1),size(f2),size(g1),size(g2))
    error('Inputs must have the same size.')
end

% Calculate normalized Hamming distance.
d1 = f1-g1;
d2 = f2-g2;
if isreal(f1) && isreal(g1)
    d12 = [d1 real(d2) imag(d2)];   % Spherical.
else
    d12 = [real(d1) imag(d1) real(d2) imag(d2)];
end
d = nnz(d12)/numel(d12);
