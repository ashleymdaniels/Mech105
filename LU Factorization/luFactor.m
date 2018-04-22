function [L,U,P] = luFactor(A)
%luFactor camputes the LU decomposition of a 3x3 sqaure matrix into its Upper,
%Lower and Pivot matrixs. 
    %A - a square matrix of coeffients 
    %U - Upper Matrix
    %L - lower Matrix
    %P - Pivot Matrix
%Note: The relationship between the input and output matrixes are
%[P]*[A]=[L]*[U]. Once the algorithum finds these pieces you can multiply L
%by a variable matrix [d] which equals [b]*[P]. Solve for [d]. From there
%multiple [U] by origonal unknown variables and set that equal to [d].
%Solve for origonal unknown. 

if size(A,1) ~= size(A,2)
    error('Error: Needs to be a 3x3 matrix')
end

%This is preolocating the matrix sizes
n1 = size(A);
n = n1(1,1);
P = eye(n);
L = eye(n);
U = A;
%% STEP ONE: PIVOTING
A1 = abs(A(:,1));
maxrow = find(A1==max(A1));
    %Finds the row of the maximum value not the value itself. 
U(maxrow,:) = A(1,:);
    %Replacing the row with the maxium with the top row
P(maxrow,:) = P(1,:);
    %Switching the rows in the P matrix
U(1,:) = A(maxrow,:);
    %Replacing the top row with the values from the maxium row
P1 = eye(n);
    %A is the constant of U and P1 is the constant of P
P(1,:) = P1(maxrow,:);
    %Changing rows in the P matrix
    
%% STEP TWO: Elimination
if U(2,1)~= 0
E1 = (U(2,1)/U(1,1));
    %Elimination multiplier 1
L(2,1) = E1;
    %Placing that in the Lower Matrix
Prime2 = (U(2,:))-(E1*(U(1,:)));
    %Finding row 2 prime
U(2,:) = Prime2;
    %plugging in the second row prime into U
else
    L(2,1) = 0;
    E1 = L(2,1);
    Prime2 = U(2,:);
end


if U(3,1) ~= 0
E2 = (U(3,1))/(U(1,1));
    %Elimination multiplyer 2
L(3,1) = E2;
    %Placing that in the Lower Matrix
Prime3 = (U(3,:))-(E2*(U(1,:)));
    %Finding the row three prime
U(3,:) = Prime3;
    %Plugging in the third row prime into U
else
    L(3,1) = 0;
    E2 = L(3,1);
    Prime3 = U(3,:);
end
%% STEP THREE: PIVOTING AGAIN
pivot3 = abs(Prime3(2));
pivot2 = abs(Prime2(2));

if pivot3 > pivot2
    U = [U(1,:);Prime3;Prime2];
    L(2,1) = E2;
    L(3,1) = E1;
    P2 = P;
    P(2,:) = P2(3,:);
    P(3,:) = P2(2,:);
end
    
%% Elimination Again

if U(3,2) ~= 0
E3 = (U(3,2))/(U(2,2));
L(3,2) = E3;
DPrime3 = (U(3,:))-(E3*(U(2,:)));
U(3,:) = DPrime3;
else
    L(3,2) = 0;
    DPrime3 = U(3,:);
    U(3,:) = DPrime3;
end
end

