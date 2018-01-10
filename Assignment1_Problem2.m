% Assignment1_Problem2.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Implementation of Problem 2 from Assignment 1 for MTH 552.  Involves
% solving an ODE with a non-smooth RHS followed by mollification to
% smoothen RHS.

tau = 1;
T = 5*tau;
h = T/10000;
tsteps = [0:h:T]';
n = length(tsteps);
j = 0;
epsilon = 50;

uh = zeros(n,1);
uh(1) = 0;

rhs = zeros(n-1,1);

for i=2:n
    
    if tsteps(i) > (j + 1)*tau
        
        j = j + 1;
        
    end
    
    rhs(i-1) = rhs_smooth(tsteps(i-1), epsilon, j, tau);
    uh(i) = uh(i-1) + h*rhs(i-1);
    
end

figure(1)
plot(tsteps, uh, 'k-')
figure(2)
plot(tsteps(1:n-1), rhs, 'b-')