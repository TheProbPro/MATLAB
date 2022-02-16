% clear everything
close all
clear all
clc

M = 22;
N = 45;
fa1 = 2500;
fa2 = 1500
fs = 8000;
T = 1/fs;

m = -M:1:M

w = 1./(m.*pi) .* ( sin(2*pi*m*T*fa1) - sin(2*pi*m*T*fa2) )

w(M+1) = 2*T*(fa2-fa1)

plot(w)

syms x;
c = (1/(x*pi))*(sin(2*pi*x*(1/8000)*2500)-sin(2*pi*x*(1/8000)*1500));
%cx = sin(2*pi*x*(1/8000)*2500)-sin(2*pi*x*(1/8000)*1500);
c0 = 2*(1/8000)*(2500-1500)