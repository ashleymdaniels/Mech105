function [root,fx,ea,iter] = bisect(func,xl,xu,es,maxit,varargin)
%Bisect calculates the roots using the bisectional method
%Inputs:
    %func = the function in which you are trying to find the roots
    %xl and xu = the upper and lower guesses
    %es = the maximum amount of error allowed (defalt = 0.0001%)
    %maxit = maximum number of iterations (defalt = 50)
    %vargin = p1,p2,... which are additional parameters used by the
    %function
%Output:
    %root= the real root found
    %fx = function value at the root
    %ea = the approximate relative error (%)
    %iter = number of iterations
    
%% Prerequisites 
clear
clc
if nargin<3
    error('At least 3 inputs arguments are required')
end

test = func(xl,varargin{:})*func(xu,varargin{:});
    %This is multiplying the y values at both the upper and lower bound,
    %if there is a sign change the two number should be some negative
    %multipled by a positive and that number would always be negative if it
    %is not there the bound is wrong
if test > 0
    error('no sign change found in your upper and lower guesses')
end

    %If the user only puts in the function and the two guesses then the es
    %will automaticly become .0001%
if nargin < 4 || isempty(es)
    es = 0.0001;
end

    %If the user doesnt put in a maximum number of iteration the program
    %will only run 50 times
if nargin < 5 || isempty(maxit)
    maxit = 50;
end
%These are the starting values:
iter = 0;
xr = xl;
ea = 100;

%% Function:
while(1)
    xrold = xr;
    xr = (xl+xu)/2;
    iter - iter +1;
    if xr ~= 0 
        ea = abs((xr-xrold)/xr)*100;
        %This is finding relative esptimated error by taking the newest x
        %vaue for the root and subtracting the old estimate, dividing by
        %the new guess and turning that into a parcentage by multiplying by
        %100.
 test = func(xl,varargin{:})*func(xr,varargin{:});
    %This is checking for whether the new x estimate (xr) will become the
    %new upper bound or the new lower bound
    if test < 0
        xu = xr;
    elseif test > 0 
        xl = xr;
    else
        ea = 0;
    end
if ea <= es || iter >= maxit
    break
end
root = xr
fx = func(xr)
    end
end

