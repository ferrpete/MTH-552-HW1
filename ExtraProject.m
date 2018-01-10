% Assignment1_ExtraProject.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Implementation of Extra Project from Assignment 1 for MTH 552.  Involves
% solving an ODE for a linear pendulum using FE.

function [FEThetaErr, FEThetaPrimeErr] = ExtraProject(h)

T = 10;
tsteps = [0:h:T]';
n = length(tsteps);

thetah = zeros(n,1);
thetah(1) = 10;
thetaPrimeh = zeros(n,1);
thetaPrimeh(1) = 0;

rhs1 = zeros(n-1,1);
rhs2 = zeros(n-1,1);

for i=2:n
    
    [rhs1(i-1), rhs2(i-1)] = rhs_linearPendulum(thetaPrimeh(i-1), thetah(i-1));
    thetah(i) = thetah(i-1) + h*rhs1(i-1);
    thetaPrimeh(i) = thetaPrimeh(i-1) + h*rhs2(i-1);
    
end

thetaE = 10.*cos(tsteps);
thetaPrimeE = -10.*sin(tsteps);

plot(tsteps, thetah, 'k-', tsteps, thetaPrimeh, 'r-', tsteps, thetaE,...
    'k--', tsteps, thetaPrimeE, 'r--')

FEThetaErr = norm(thetaE - thetah, inf);
FEThetaPrimeErr = norm(thetaPrimeE - thetaPrimeh, inf);