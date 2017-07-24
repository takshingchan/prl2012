function [h1,h2] = iqft(H1,H2)
%IQFT Inverse quaternion Fourier transform.
%   [h1,h2] = IQFT(H1,H2) returns the type 1 inverse quaternion Fourier
%   transform of H1+H2j.
%
%   Inputs:
%     H1, H2    - Quaternion matrix H1+H2j.
%
%   Outputs:
%     h1, h2    - Quaternion matrix h1+h2j.
%
%   See also QFT.

%   References:
%     [1] S.-C. Pei, J.-J. Ding, and J.-H. Chang, "Efficient implementation
%         of quaternion Fourier transform, convolution, and correlation by
%         2-D complex FFT," IEEE Trans. Signal Process., vol. 49, no. 11,
%         pp. 2783-2797, 2001.

%   Copyright 2017 Tak-Shing Chan

if ~isequal(size(H1),size(H2))
    error('Inputs must have the same size.')
end

% Compute [hc(w,v)(1-k)+hc(w,-v)(1+k)]/2 where hc(w,v)=ha(w,v)+hb(w,-v)j.
ha = ifft2(H1);
hb = ifft2(H2);
rha = ha(:,[1,end:-1:2]);
rhb = hb(:,[1,end:-1:2]);
h1 = (ha+rha+1i*(hb-rhb))/2;
h2 = (hb+rhb-1i*(ha-rha))/2;
