clear all
clc

M = 2;
N = 5;
fa = 1000;
fs = 5000;
T = 1/fs;
alpha = 0.54;

m = -M:1:M

c = 1./(m.*pi) .* ( sin(m*pi) - sin(2*pi*m*T*fa) )
w = alpha+(1-alpha)*cos((m*pi)/M)
c(M+1) = 1-2*T*fa
c = c.*w
figure(1)
plot(c)



sys = tf(c, [1], T)
figure(2)
bode(sys)
figure(3)
pzmap(sys)
grid ON
axis([-2 2 -2 2])