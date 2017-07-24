function [fp1,fp2] = phasequant(f1,f2)
%PHASEQUANT Phase quantization.
%   [fp1,fp2] = PHASEQUANT(f1,f2) extracts the nonnegative signs of a
%   2-D quadrature filtered image.
%
%   Inputs:
%     f1, f2    - Quaternionic or spherical quadrature filtered image.
%
%   Outputs:
%     fp1, fp2  - Phase-quantized image.
%
%   See also QQF, SQF.

%   References:
%     [1] T.-S. Chan and A. Kumar, "Reliable ear identification using 2-D
%         quadrature filters," Pattern Recognition Lett., vol. 33, no. 14,
%         pp. 1870-1881, 2012.
%     [2] J. Daugman, "The importance of being random: Statistical
%         principles of iris recognition," Pattern Recognition, vol. 36,
%         no. 2, pp. 279-291, 2003.

%   Copyright 2017 Tak-Shing Chan

if ~isequal(size(f1),size(f2))
    error('Inputs must have the same size.')
end

% Extract the nonnegative signs.
fp1 = (real(f1)>0)+1i*(imag(f1)>0);
fp2 = (real(f2)>0)+1i*(imag(f2)>0);
