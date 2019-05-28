clear; clc;
x0 = [1 1 1 1 1 1 1];

[x,fval]=fsolve(@func,x0)

v2 = x(2)*exp(1i*x(5));
v3 = x(3)*exp(1i*x(6));
v4 = x(4)*exp(1i*x(7));

v1 = 1;

S12 = v1*((v1-v2)*(-10*1i))'
S14 = v1*((v1-v4)*(-10*1i))'
S23 = x(2)*((v2-v3)*(-10*1i))'
S34 = x(3)*((v3-v4)*(-10*1i))'

S21 = x(2)*(-(v1-v2)*(-10*1i))';
S41 = x(4)*(-(v1-v4)*(-10*1i))';
S32 = x(3)*(-(v2-v3)*(-10*1i))';
S43 = x(4)*(-(v3-v4)*(-10*1i))';

% total reactive power consumption by transmission line:
Q_total = imag(S12 + S21 + S14 + S41 + S23 + S32 + S34 + S43)

% x(1): Q2, x(2,3,4): v2,3,4, x(5,6,7): phases of v2,3,4
function F = func(x)

    F = [
      
      3 - ( x(2)*10*sin(-x(5)) + x(4)*10*sin(-x(7)) );              % P1
      2 - x(2)*( 10*sin(x(5)) + x(3)*10*sin(x(5)-x(6)) );           % P2
      -5 - x(3)*( x(2)*10*sin(x(6)-x(5)) + x(4)*10*sin(x(6)-x(7)) );% P3
      x(4)*( 10*sin(x(7)) + x(3)*10*sin(x(7)-x(6)) );               % P4
      
      ( -20 + x(2)*10*cos(-x(5)) + x(4)*10*cos(-x(7)) );                    % Q1
      x(1) + x(2)*( 10*cos(x(5)) + x(2)*(-20) + x(3)*10*cos(x(5)-x(6)) );   % Q2     
      x(3)*( x(2)*10*cos(x(6)-x(5)) + x(3)*(-20) + x(4)*10*cos(x(6)-x(7)) );% Q3     
      x(4)*( 10*cos(x(7)) + x(3)*10*cos(x(7)-x(6)) + x(4)*(-20) );          % Q4
    ];
end