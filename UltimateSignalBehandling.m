z = tf('z', T);
H = az^-1+bz^-2
pole(H)
zero(H)
impulse(H)
step(H)
bode(H)