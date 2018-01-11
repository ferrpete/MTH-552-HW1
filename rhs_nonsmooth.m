% rhs_nonsmooth.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Defines the right-hand side of the ODE for Assignment 1, Problem 2.  This
% version is unsmoothed.

function [rhs] = rhs_nonsmooth(tstep, tau)

    j = floor(tstep);

    if tstep >= j*tau && tstep < (j + 0.5)*tau

        rhs = 1;

    else

        rhs = -1;

    end

end