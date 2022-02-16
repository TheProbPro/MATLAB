clc
clear
close all
%% Definition af parametre
param.m2 = 50;  % [N/m]
param.m1 = 50; % [N/(m/s)]
param.lc1 = 0.5;   % [kg]
param.lc2 = 0.5;
param.l1 = 1; % [m]
param.l2 = 1;
param.g = 9.82; % [m/s^2]
param.Il1 = 10;
param.Il2 = 10;

%% Specifikation af simuleringer
t0 = 0;         % [s] Starttid for simulering
DeltaT = 0.005; % [s] Sample tid

% Simulering 1
tEnd1 = 200;    % [s] Sluttid for simulering
x01 = [0.3;0;1;0]; % Starttilstand x = (theta;dtheta;xc;dxc)
% Specifikation af input
tu1 = (t0:DeltaT:tEnd1)';
u1 = zeros(size(tu1));

% Simulering 2
tEnd2 = 50;     % [s] Sluttid for simulering
x02 = [0;0;0;0]; % Starttilstand x = (theta;dtheta;xc;dxc)
% Specifikation af input
tu2 = (t0:DeltaT:tEnd2)';
u2 = ones(size(tu2))*100;

%% Simulering  af system, med input u = 0

% Solver options
options = []; % Kan aendres ved brug af odeset

% Simulate the system
[t1,x1] = ode45(@robotarm,[t0 tEnd1],x01,options,[tu1 u1],param);

%% Simulering  af system, med input u = 5

% Solver options
options = []; % Kan aendres ved brug af odeset

% Simulate the system
[t2,x2] = ode45(@robotarm,[t0 tEnd2],x02,options,[tu2 u2],param);
%% Plot loesninger
% Omnavngivning af variable 
time{1} = t1;
time{2} = t2;
state{1} = x1;
state{2} = x2;
% Definition af plot omraade 
font_size=8;
width = 12;         
height = 16;
SCREEN_LEFT = 15;
SCREEN_RIGHT = 10;
ADD = 0;
% Plot resultater 
for i=1:1:2
    figure
    hold on
    set(gcf,'Units','centimeters')
    set(gcf,'Position',[SCREEN_LEFT  SCREEN_RIGHT  width+4*ADD  height+2*ADD])
    set(gcf,'Color','w')
    subplot(4,1,1)
    hold on
    plot(time{i},state{i}(:,1))
    ylabel('Vinkel $\theta$ [rad]','Interpreter','latex','FontSize',font_size)
    set(gca,'FontName','Times New Roman','FontSize',font_size);
    set(gca,'XTickLabel','')
    box on
    subplot(4,1,2)
    hold on
    plot(time{i},state{i}(:,2))
    ylabel('Vinkelhastighed $\dot{\theta}$ [rad/s]','Interpreter','latex','FontSize',font_size)
    set(gca,'FontName','Times New Roman','FontSize',font_size);
    set(gca,'XTickLabel','')
    box on
    subplot(4,1,3)
    hold on
    plot(time{i},state{i}(:,3))
    ylabel('Position af vogn $x_c$ [m]','Interpreter','latex','FontSize',font_size)
    set(gca,'FontName','Times New Roman','FontSize',font_size);
    set(gca,'XTickLabel','')
    box on
    subplot(4,1,4)
    hold on
    plot(time{i},state{i}(:,4))
    ylabel('Hastighed af vogn $\dot{x}_c$ [m/s]','Interpreter','latex','FontSize',font_size)
    set(gca,'FontName','Times New Roman','FontSize',font_size);
    xlabel('Time $t$','Interpreter','latex','FontSize',font_size)
    set(gca,'FontName','Times New Roman','FontSize',font_size);
    box on
end