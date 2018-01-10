% rhs_linearPendulum.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Defines the right-hand side of the ODE for Assignment 1, Extra Project.

function [rhs1, rhs2] = rhs_linearPendulum(thetaPrime, theta)

    rhs1 = thetaPrime;
    rhs2 = -theta;

end