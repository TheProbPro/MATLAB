clear all
clc

%P1 = world coordinates [mm], P = robot coordinates [mm]:
P1 = transpose([2.5 12.5 0; 27.5 12.5 0; 27.5 57.5 0; 2.5 57.5 0])
P = transpose([247.28 -79.73 174; 332.94 -304.40 174; -80.32 -470.65 174; -182.93 -230.62 174])
P1 = P1 * 10
%Calculate mean (cp og cp1)
cp = mean(P, 2)
cp1 = mean(P1, 2)
Q1 = P - cp
Q2 = P1 - cp1

H = zeros(3,3);
%summen af de forskellige rækker (lav i et forloop)
for i=1:size(Q1,2)
    H = H + Q1(:,i)*(Q2(:,i).');
end

H

[U,S,V] = svd(H);

% U
% S
% V

R = V*U.'
T = cp1-R*cp
ptest = [25 125 0 1].';
HRW = [R T; 0 0 0 1]
test = inv(HRW)
final = test * ptest

