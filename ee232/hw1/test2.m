clear; clc;
x0 = [1 1 1 1 1 1 1];

[x,fval]=fsolve(@func,x0)

% x(1): Q2, x(2,3,4): v2,3,4, x(5,6,7): phases of v2,3,4
function F = func(x)
    B = [
        30 -10 -10 -10;
        -10 20 -10 0;
        -10 -10 30 -10;
        -10 0 -10 20
        ];
    B = -B;
    P = [2; 1; -4; 1];
    
    
    v1 = 1;
    % phase of v1 = 0

    F = [  
      
      2 - v1*( v1*B(1,1)*sin(0) + x(2)*B(1,2)*sin(0-x(5)) + x(3)*B(1,3)*sin(0-x(6)) + x(4)*B(1,4)*sin(0-x(7)) );        % P1
      0 + v1*( v1*B(1,1)*cos(0) + x(2)*B(1,2)*cos(0-x(5)) + x(3)*B(1,3)*cos(0-x(6)) + x(4)*B(1,4)*cos(0-x(7)) );        % Q1
      1 - x(2)*( v1*B(2,1)*sin(x(5)-0) + x(2)*B(2,2)*sin(x(5)-x(5)) + x(3)*B(2,3)*sin(x(5)-x(6)) + x(4)*B(2,4)*sin(x(5)-x(7)) );      % P2
      x(1) + x(2)*( v1*B(2,1)*cos(x(5)-0) + x(2)*B(2,2)*cos(x(5)-x(5)) + x(3)*B(2,3)*cos(x(5)-x(6)) + x(4)*B(2,4)*cos(x(5)-x(7)) );   % Q2
      -4 - x(3)*( v1*B(3,1)*sin(x(6)-0) + x(2)*B(3,2)*sin(x(6)-x(5)) + x(3)*B(3,3)*sin(x(6)-x(6)) + x(4)*B(3,4)*sin(x(6)-x(7)) );        % P3
      0 + x(3)*( v1*B(3,1)*cos(x(6)-0) + x(2)*B(3,2)*cos(x(6)-x(5)) + x(3)*B(3,3)*cos(x(6)-x(6)) + x(4)*B(3,4)*cos(x(6)-x(7)) );        % Q3
      1 - x(4)*( v1*B(4,1)*sin(x(7)-0) + x(2)*B(4,2)*sin(x(7)-x(5)) + x(3)*B(4,3)*sin(x(7)-x(6)) + x(4)*B(4,4)*sin(x(7)-x(7)) );        % P4
      0 + x(4)*( v1*B(4,1)*cos(x(7)-0) + x(2)*B(4,2)*cos(x(7)-x(5)) + x(3)*B(4,3)*cos(x(7)-x(6)) + x(4)*B(4,4)*cos(x(7)-x(7)) );        % Q4
    ];
end