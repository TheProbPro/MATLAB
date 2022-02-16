syms m1 g lc1 m2 l1 lc2  Il1 Il2 t tau1 tau2 real;
syms q1(t) q2(t)
syms ddq1 ddq2 real;
%syms qsp1 qsp2 real
qsp1 = diff(q1,t);
qsp2 = diff(q2,t);
%syms q [2 1] real
Epot = m1*g*lc1*sin(q1)+m2*g*(l1*sin(q1)+lc2*sin(q1+q2));
Ekin = 1/2*[qsp1 qsp2]*[m1*lc1^2+Il1+m2*(l1^2+lc2^2+2*l1*lc2*cos(q2))+Il2 m2*(lc2^2+l1*lc2*cos(q2)+Il2);m2*(lc2^2+l1*lc2*cos(q2))+Il2 m2*lc2^2+Il2]*[qsp1;qsp2];

subs(Ekin, {m1, g, lc1, m2, l1, lc2, Il1, Il2}, {50, 9.82, 0.5, 50, 1, 0.5, 10, 10});
subs(Epot, {m1, g, lc1, m2, l1, lc2}, {50, 9.82, 0.5, 50, 1, 0.5});

L = Ekin-Epot;

%dLddq = [diff(L,qsp1); diff(L,qsp2)];


%diff(dLddq,q)*dq+diff(dLddq,dq)*ddq


%return

eq1 = diff(diff(L, qsp1), t)-diff(L, q1) == 0;
eq2 = diff(diff(L, qsp2), t)-diff(L, q2) == 0;

eq = [diff(diff(L, qsp1), t)-diff(L, q1);diff(diff(L, qsp2), t)-diff(L, q2)] == 0;
%syms ddq1 ddq2 real
%eq11 = subs(eq1,{diff(q1,t,t),diff(q2,t,t)},{ddq1,ddq2})
%collect(eq1, {ddq1})
%isolate(eq11,ddq1)
isolate(eq1,diff(q1,t,t))
isolate(eq2,diff(q2,t,t))