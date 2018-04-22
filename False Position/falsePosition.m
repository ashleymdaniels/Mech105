function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit)
%falsep uses the method of false position to calculate unknow roots in a
%function
%Inputs:
    %func = the function in which you are trying to find the roots in terms
    %of x
    %xl and xu = the upper and lower guesses
    %es = the maximum amount of error allowed (defalt = 0.0001%)
    %maxit = maximum number of iterations (defalt = 50)
    %varargin = p1,p2,... which are additional parameters used by the
    %function
%Output:
    %root= the real root found
    %fx = function value at the root
    %ea = the approximate relative error (%)
    %iter = number of iterations
    
%% Prerequisites

syms x
f=symfun(func,x);
%This creates a symbolic variable x and then symfun allows for that x value
%to be changed.

if nargin<3
    error('At least 3 inputs arguments are required')
end
%At least a function and an uper and lower bound need to be put in to run
%the function

test = f(xl)*f(xu);
    %This is multiplying the y values at both the upper and lower bound,
    %if there is a sign change the two number should be some negative
    %multipled by a positive and that number would always be negative if it
    %is not there the bound is wrong
if test > 0
    error('no sign change found in your upper and lower guesses')
end

%If the user only puts in the function and the two guesses then the es will automaticly become .1%
if nargin < 4 || isempty(es)
    es = 0.001;
end

%If the user doesnt put in a maximum number of iteration the program will only run 200 times
if nargin < 5 || isempty(maxit)
    maxit = 200;
end
%These are the starting values:
iter = 0;
xr = xl;
ea = 100;

%% Function:
%The while loop below will run its course untill the Relative error is
%below the parameter given or if the number of iterations goes above the
%maximum number of iterations allowed. 
while ea >= es && iter <= maxit
    xrold = xr;
        %this is only used to calculate the relative error later
    xr = xl-((xu-xl)*f(xl))/(f(xu)-f(xl));
        %This is the function of false position
    iter = iter +1;
        %This increases the number of iterations for every loop
    if xr ~= 0 
        ea = abs((xr-xrold)/xr)*100;
        %This is finding relative esptimated error by taking the newest x
        %vaue for the root and subtracting the old estimate, dividing by
        %the new guess and turning that into a parcentage by multiplying by
        %100.
    else
        error('relative error can not be calulated as it makes a function divide by zero');
    end
    test = f(xl)*f(xr);
    %This is checking for whether the new x estimate (xr) will become the
    %new upper bound or the new lower bound
    if test < 0
        xu = xr;
    elseif test > 0 
        xl = xr;
    else
        ea = 0;
    end
end
%Below builds a matrix of the final answers and displays it for the user in
%an easy form to understand. 
K = [double(xr),double(f(xr)),double(iter),double(ea)];
disp('Below will be a matrix of numbers, those numbers are [root,f(root),iteration,relative error]')
disp(K)
end
