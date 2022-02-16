function dx = robotarm(t,x,u,param)
u = interp1(u(:,1),u(:,2),t); % bestem u ved brug af lineaer interpolation
% Omnavngivning af variable
tau = u;
tau1 = tau(1);
tau2 = tau(2);
q1 = x(1);
dq1 = x(2);
q2 =  x(3);
dq2 = x(4);

ddq1 = -(((param.Il2 + param.m2*(param.lc2^2 + param.l1*cos(q2(t))*param.lc2))*diff(q2(t), t, t))/2 + (param.m2*diff(q2(t), t, t)*(param.lc2^2 + param.l1*cos(q2(t))*param.lc2 + param.Il2))/2 + param.g*param.m2*(param.l1*cos(q1(t)) + param.lc2*cos(q1(t) + q2(t))) + param.g*param.lc1*param.m1*cos(q1(t)) - param.l1*param.lc2*param.m2*sin(q2(t))*diff(q2(t), t)^2 - 2*param.l1*param.lc2*param.m2*sin(q2(t))*diff(q1(t), t)*diff(q2(t), t))/(param.Il1 + param.Il2 + param.m2*(param.l1^2 + 2*cos(q2(t))*param.l1*param.lc2 + param.lc2^2) + param.lc1^2*param.m1) == tau
ddq2 = -((param.Il2/2 + (param.m2*(param.lc2^2 + param.l1*cos(q2(t))*lc2))/2)*diff(q1(t), t, t) + diff(q1(t), t)*(param.l1*param.lc2*param.m2*sin(q2(t))*diff(q1(t), t) + (param.l1*param.lc2*param.m2*sin(q2(t))*diff(q2(t), t))/2) + (param.m2*diff(q1(t), t, t)*(param.lc2^2 + param.l1*cos(q2(t))*param.lc2 + param.Il2))/2 + param.g*param.lc2*param.m2*cos(q1(t) + q2(t)) - (param.l1*param.lc2*param.m2*sin(q2(t))*diff(q1(t), t)*diff(q2(t), t))/2)/(param.m2*param.lc2^2 + param.Il2) == tau2

dx = [dq1;ddq1;dq2;ddq2];
end