% Assignment1_Problem2.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Implementation of Problem 2 from Assignment 1 for MTH 552.  Involves
% solving an ODE with a non-smooth RHS followed by mollification to
% smoothen RHS.

function [error] = Assignment1_Problem2_Regularized(k, epsilon)

tau = 1;
T = 5*tau;
h = T/k;
tsteps = [0:h:T]';
n = length(tsteps);
uh = zeros(n,1);
uh(1) = 0;

rhs = zeros(n-1,1);

for i=2:n
    
    rhs(i-1) = rhs_smooth(tsteps(i-1),uh, tau, epsilon);
    uh(i) = uh(i-1) + h*rhs(i-1);
    
end

options = odeset('RelTol',1e-8);

[t,uexact] = ode45(@(t,uexact) rhs_smooth(t,uexact, tau, epsilon),...
    [tsteps],uh(1),options); 

figure(1)
plot(tsteps, uh, 'k-', t, uexact, 'r--')
figure(2)
plot(tsteps(1:n-1), rhs, 'b-')

error = norm(uexact-uh,inf);

end