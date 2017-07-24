function [H1,H2] = qft(h1,h2)
%QFT Quaternion Fourier transform.
%   [H1,H2] = QFT(h1,h2) returns the type 1 quaternion Fourier transform of
%   h1+h2j.
%
%   Inputs:
%     h1, h2    - Quaternion matrix h1+h2j.
%
%   Outputs:
%     H1, H2    - Quaternion matrix H1+H2j.
%
%   See also IQFT.

%   References:
%     [1] S.-C. Pei, J.-J. Ding, and J.-H. Chang, "Efficient implementation
%         of quaternion Fourier transform, convolution, and correlation by
%         2-D complex FFT," IEEE Trans. Signal Process., vol. 49, no. 11,
%         pp. 2783-2797, 2001.

%   Copyright 2017 Tak-Shing Chan

if ~isequal(size(h1),size(h2))
    error('Inputs must have the same size.')
end

% Compute [Hc(w,v)(1-k)+Hc(w,-v)(1+k)]/2 where Hc(w,v)=Ha(w,v)+Hb(w,-v)j.
Ha = fft2(h1);
Hb = fft2(h2);
rHa = Ha(:,[1,end:-1:2]);
rHb = Hb(:,[1,end:-1:2]);
H1 = (Ha+rHa+1i*(Hb-rHb))/2;
H2 = (Hb+rHb-1i*(Ha-rHa))/2;
