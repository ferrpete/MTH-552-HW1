% rhs_smooth.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Defines the right-hand side of the ODE for Assignment 1, Problem 2.  This
% version is unsmoothed.

function [rhs] = rhs_smooth(tstep, epsilon, j, tau)

    if tstep >= j*tau && tstep < (j + 0.5)*tau

        t = (4/tau)*(tstep - j*tau - tau/4);
        rhs = 2.718281828459045*exp(-(1./(1-t^epsilon)));

    else
        
        t = (4/tau)*(tstep - j*tau - (3/4)*tau);
        rhs = -2.718281828459045*exp(-(1./(1-t^epsilon)));

    end

end