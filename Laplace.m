%Lagrange
syms q1 q2 l1 l2 lc1 lc2 ml1 ml2 Il1 Il2 qp1 qp2 T g real;
Epot = g * sin(q1) *(ml1 * lc1 + ml2 * l1) * g * ml2 * lc2 * sin(q1 + q2);
Ekin = 1/2*[qp1 qp2] * [ml1*lc1^2+Il1+ml2*(l1^2+lc2^2+2*l1*lc2*cos(q2))+Il2 ml2*(lc2^2+l1*lc2*cos(q2))+Il2; ml2*(lc2^2+l1*lc2*cos(q2))+Il2 ml2*lc2^2+Il2] * [qp1; qp2];

L = Ekin - Epot;

eq1 =diff(diff(L, qp1), T)-diff(L, q1) == 0
eq2 = diff(diff(L,qp2), T)-diff(L, q2) == 0

subs(eq1, {l1,l2,lc1,lc2,ml1,ml2,Il1,Il2, g}, {1,1,0.5,0.5,50,50,10,10,9.82});
subs(eq2, {l1,l2,lc1,lc2,ml1,ml2,Il1,Il2, g}, {1,1,0.5,0.5,50,50,10,10,9.82});


g^2*lc2*ml2*cos(q1 + q2)*sin(q1)*(l1*ml2 + lc1*ml1) + g^2*lc2*ml2*sin(q1 + q2)*cos(q1)*(l1*ml2 + lc1*ml1)
lc2*ml2*cos(q1 + q2)*sin(q1)*(l1*ml2 + lc1*ml1)*g^2 + qp1*(l1*lc2*ml2*qp1*sin(q2) + (l1*lc2*ml2*qp2*sin(q2))/2) + (l1*lc2*ml2*qp1*qp2*sin(q2))/2