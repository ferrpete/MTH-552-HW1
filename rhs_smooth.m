% rhs_smooth.m
% Peter Ferrero, Oregon State University, 1/9/2018
% Defines the right-hand side of the ODE for Assignment 1, Problem 2.  This
% version is unsmoothed.

function [rhs] = rhs_smooth(tstep,y, tau, epsilon)

    j = floor(tstep);

    if tstep < j*tau + epsilon
        
        t = tstep - j*tau; % Scale t to [0,epsilon)
        rhs = 1.000000004122307*tanh(10*t/epsilon); % Smoothing function.  Slope matches approximately with original RHS.

    elseif tstep >= j*tau + epsilon && tstep < (j + 0.5)*tau - epsilon
        
        rhs = 1; % Original RHS outside of smoothed region

    elseif tstep >= (j + 0.5)*tau + epsilon && tstep < (j + 1)*tau - epsilon
        
        rhs = -1; % Original RHS outside of smoothed region
        
    elseif tstep >= (j+1)*tau - epsilon
        
        t = tstep - (j+1)*tau; % Scale t to [-epsilon, epsilon]
        rhs = 1.000000004122307*tanh(10*t/epsilon);
        
    else
        
        t = tstep - (j + 0.5)*tau; % Scale t to [-epsilon, epsilon)
        rhs = 1.000000004122307*tanh(-10*t/epsilon);

    end

end
