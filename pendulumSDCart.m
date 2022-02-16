function dx = pendulumSDCart(t,x,u,param)
    u = interp1(u(:,1),u(:,2),t); % bestem u ved brug af lineaer interpolation
    % Omnavngivning af variable
    F = u;
    theta =  x(1);
    dtheta = x(2); 
    xc =  x(3);
    dxc = x(4);
    
    ddxc = (F - param.b * dxc - param.k * xc) / (param.mc + param.mp) - (param.mp * param.l * cos(theta)^2 * (-F + param.b * dxc + param. k * xc) + param. mp * param.l * sin(theta) * (param.mp * param.l * dtheta^2 * cos(theta)^2 - param.g * cos(theta) * (param.mp + param.mc) - dtheta^2 * (param.l * (param.mc + param.mp - param.mp * cos(theta)^2)))) / ((param.mp + param.mc) * (param.l * (param.mc + param.mp - param.mp * cos(theta)^2))); % INDSAET KODE HER
    ddtheta = (cos(theta) * (-F * param.b * dxc + param.k * xc) + param.mp * param.l * sin(theta) * dtheta^2 * cos(theta) - param.g * sin(theta) * (param.mp + param.mc)) / (param.l * (param.mc + param.mp - param.mp * cos(theta)^2)); % INDSAET KODE HER
    
    
    dx = [dtheta;ddtheta;dxc;ddxc];
end