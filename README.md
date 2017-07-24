Reliable Ear Identification Using 2-D Quadrature Filters
--------------------------------------------------------

This code reimplements Section 3 of T.-S. Chan and A. Kumar, "Reliable ear
identification using 2-D quadrature filters," *Pattern Recognition Lett.*,
vol. 33, no. 14, pp. 1870-1881, 2012.

Here, quaternionic matrices are decomposed as *A+Bj* where *A* and *B* are
complex matrices \[1\], and spherical quadrature filters use a complexified
version of the Riesz transform \[2\]-\[4\].

The following functions are available:

| Function     | Description                          |
| ------------ | ------------------------------------ |
| `hd`         | Hamming distance                     |
| `iqft`       | Inverse quaternion Fourier transform |
| `phasequant` | Phase quantization                   |
| `plotqqf`    | Plot quaternionic quadrature filters |
| `plotsqf`    | Plot spherical quadrature filters    |
| `qft`        | Quaternion Fourier transform         |
| `qqf`        | Quaternionic quadrature filter       |
| `sqf`        | Spherical quadrature filter          |

Here is an example of quaternionic log-Gabor filtering:

```matlab
f = imread('circuit.tif');
g = imread('circbw.tif');
[fq1,fq2] = qqf(f,'loggabor',1/18,0.55/18);
[gq1,gq2] = qqf(g,'loggabor',1/18,0.55/18);
[f1,f2] = phasequant(fq1,fq2);
[g1,g2] = phasequant(gq1,gq2);
hd(f1,f2,g1,g2)
```

A longer example with multiscale quaternionic Cauchy filtering:

```matlab
f = imread('circuit.tif');
g = imread('circbw.tif');
[fq1,fq2] = qqf(f,'cauchy',1/18,2.8737*18);
[fq3,fq4] = qqf(f,'cauchy',1/54,2.8737*54);
[gq1,gq2] = qqf(g,'cauchy',1/18,2.8737*18);
[gq3,gq4] = qqf(g,'cauchy',1/54,2.8737*54);

% Concatenate both scales.
[f1,f2] = phasequant(cat(3,fq1,fq3),cat(3,fq2,fq4));
[g1,g2] = phasequant(cat(3,gq1,gq3),cat(3,gq2,gq4));
hd(f1,f2,g1,g2)
```

To reproduce Figs. 1-6 in the paper, run `plotqqf` and `plotsqf`. For
segmentation, database rotations and template shifting, please refer to
\[5\], \[6\] for further details.

Tak-Shing Chan

22 July 2017

### References

\[1\] S.-C. Pei, J.-J. Ding, and J.-H. Chang, "Efficient implementation of
quaternion Fourier transform, convolution, and correlation by 2-D complex
FFT," *IEEE Trans. Signal Process.*, vol. 49, no. 11, pp. 2783-2797, 2001.

\[2\] M. Unser, D. Sage, and D. Van De Ville, "Multiresolution monogenic
signal analysis using the Riesz-Laplace wavelet transform," *IEEE Trans.
Image Process.*, vol. 18, no. 11, pp. 2402-2418, 2009.

\[3\] K. G. Larkin, D. J. Bone, and M. A. Oldfield, "Natural demodulation
of two-dimensional fringe patterns. I. General background of the spiral
phase quadrature transform," *J. Opt. Soc. Amer. A*, vol. 18, no. 8, pp.
1862-1870, 2001.

\[4\] P. Kovesi. (2009). MATLAB and Octave functions for computer vision
and image processing. Phase symmetry of an image using monogenic filters.
Available:
http://www.peterkovesi.com/matlabfns/PhaseCongruency/phasesymmono.m

\[5\] L. Masek and P. Kovesi. (2003). MATLAB source code for a biometric
identification system based on iris patterns. Available:
http://www.peterkovesi.com/studentprojects/libor/sourcecode.html

\[6\] A. Kumar and C. Wu, "Automated human identification using ear
imaging," *Pattern Recognition*, vol. 45, no. 3, pp. 956-968, 2012.
