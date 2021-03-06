% Assignment1_Problem2.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Implementation of Problem 2 from Assignment 1 for MTH 552.  Involves
% solving an ODE with a non-smooth RHS followed by mollification to
% smoothen RHS.

function [error] = Assignment1_Problem2(k)

tau = 1;
T = tau/4;
h = T/k;
tsteps = [0:h:T]';
n = length(tsteps);
uh = zeros(n,1);
uh(1) = 0;

rhs = zeros(n-1,1);

for i=2:n
    
    rhs(i-1) = rhs_nonsmooth(tsteps(i-1), tau);
    uh(i) = uh(i-1) + h*rhs(i-1);
    
end

uexact = 0.25.*sawtooth(2*pi*tsteps, 0.5)+0.25;

figure(1)
plot(tsteps, uh, 'k-', tsteps, uexact, 'r--')
figure(2)
plot(tsteps(1:n-1), rhs, 'b-')

error = norm(uexact-uh,inf);

end