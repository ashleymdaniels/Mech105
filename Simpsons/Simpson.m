function [I] = Simpson(x,y)
%The funcation Simpson finds the integration using Simpson's 1/3 rule. IN
%the even that there is an odd number of intervals the trapezidal rule will
%be used for the last interval. You will be altered at the end if the
%trapezoidal rule had to be used. 
% x = all of the input values
% y = all of the corresponding output values.
% I = the integral
if nargin < 2
    error('Must have both input and output values')
end
if length(x) ~= length(y)
    error('Each input value must have a corresponding output value and vise versa')
end

%% Checking that the x values are evenly spaced:
dx = diff(x);
if (max(dx)-min(dx))>(1*10^(-15))
    error ('The input values are not evenly spaced')
end
%There is a round off error in the base 10 values this says if the
%difference is really small that is just due to round off. 
%% Does Trap Rule need to be used:
l = length(x);
if mod(l,2) == 0
    disp('Trapezoidal rule needs to be used')
    %If there isnt a remainder then there are an even number of points and
    %an odd number of intervals
    trap = 1;
elseif mod(l,2) == 1
    trap = 0;
    %If there isnt a remainder then there are an odd number of points and
    %an even number of intervals
end

%% Without Trap
if trap == 0
 difX = (x(l)-x(1));
 %This is the (b-a) difference in the x direction
    I1 = y(1);
    %This is the first point
    i = 1;
    for i = 1:2:(l-2)
        fx2 = (y(i+1)+2);
        Ipart2(i) = fx2;
    end
    %This is the for loop that does the sumbation of the odd x values
    i = 2;
    I2 = 4*sum(Ipart2);
    for i = 2:2:(l-1)
        fx3 = y(i+1);
        Ipart3(i) = fx3;
    end
    %This is the loop that does the submation of the even x values
    I3 = 2*sum(Ipart3);
    I4 = y(l);
    %This is the last point
I = difX*((I1+I2+I3+I4)/(3*(l)));
    %This is the added together piece at the end.
end
%% With Trap
if trap == 1
    difX = (x(l-1)-x(1));
    I1 = y(1);
    i = 1;
    for i = 1:2:(l-2)
        fx2 = y(i+1)+2;
        Ipart2(i) = fx2;
    end
    I2 = 4*sum(Ipart2);
    i = 2;
    for i = 2:2:(l-3)
        fx3 = y(i+1);
        Ipart3(i) = fx3;
    end
    I3 = 2*sum(Ipart3);
    I4 = y(l-1);
    %Everything above has the same values as the above notations below is
    %the trapezoidal rule for the last interval. 
    endtrap = ((y(l)+y(l-1))/2)*(x(l)-x(l-1));
    I = (difX*((I1+I2+I3+I4)/(3*(l-1))))+ endtrap;
    %This is everything added together again. 
end

