clc
clear
close all
%% System parameters
param.Im = 1; % Inertia of motor [kgm^2]
param.Il = 1; % Inertia of link [kgm^2]
param.ks = 1; % Shaft stiffness [Nm/rad]
param.bs = 0.01; % Shaft dampening [Nm/(rad/s)]
param.T = 1;

%% Simulation of Dynamical System, with input u = cos(t)

% Simulation time
t0 = 0;         % [s] Start time for simulation
tEnd = 50;      % [s] End time for simulation
DeltaT = 0.005;  % [s] Sample time

% Specification of input
tu = (t0:DeltaT:tEnd)';
u = cos(tu);

% Specification of initial state
x0 = [1;-1];

% Solver options
options = []; % Can be canged using odeset

% Simulate the system
[t,x] = ode45(@vectorField,[t0 tEnd],x0,options,[tu u],param);

%% Plot solutions
font_size=8;
width = 12;         
height = 7;
SCREEN_LEFT = 15;
SCREEN_RIGHT = 10;
ADD = 0;
figure
hold on
set(gcf,'Units','centimeters')
set(gcf,'Position',[SCREEN_LEFT  SCREEN_RIGHT  width+4*ADD  height+2*ADD])
set(gcf,'Color','w')
subplot(4,1,1)
hold on
plot(t,x(:,1))
ylabel('Position $x$ [m]','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
set(gca,'XTickLabel',[]);
box on
subplot(4,1,2)
hold on
plot(t,x(:,2))
ylabel('Velocity $\dot{x}$ [m/s]','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
xlabel('Time $t$','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
box on
subplot(4,1,3)
hold on
plot(t,x(:,3))
ylabel('Position $x$ [m]','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
set(gca,'XTickLabel',[]);
box on
subplot(4,1,4)
hold on
plot(t,x(:,4))
ylabel('Velocity $\dot{x}$ [m/s]','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
xlabel('Time $t$','Interpreter','latex','FontSize',font_size)
set(gca,'FontName','Times New Roman','FontSize',font_size);
box on
%% Function used for simulation via ode45
function dxi = vectorField(t,xi,u,param)
    F = interp1(u(:,1),u(:,2),t); % determine u by linear interpolation
    xm = xi(1);
    v2 = xi(2);
    xl = xi(3);
    v2 = xi(4)
    Im = param.Im;
    Il = param.Il;
    ks = param.ks;
    bs = param.bs;
    Taom = param.T
    dxi = [v1;
        (1/Im)*Taom-(bm/Im)*omeagem-(ks/Im)*(xm-xl);
        v2;
        -(ks/Il)*(xl-xm)];
end