% clear everything
close all
clear all
clc

% Example Transfer Function : H(s) = 1/(s^2 + 0.2s + 0.01)

% Numerator
num = [0.03/((2.4*10^-3)*(8*10^-5))];
% Denominator. Takes the koeficients to s, starting from the highest power
% (s^2, s^1, s^0)
den = [1 ((5*10^-5)*(2.4*10^-3)+(8*10^-5)*1.2)/((8*10^-5)*(2.4*10^-3)) ((5*10^-5)*1.2*(0.03^2))/((8*10^-5)*(2.4*10^-3))];

% Transfer Function. tf is a built in function in matlab
G = tf(num, den)

% Plot Frequency Response
bode(G),grid