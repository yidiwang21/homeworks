clear; clc;

global L;
L = 0;
res = zeros(4,129);

for k = 1:129
B = [
    -20-L 10+L 0 10;
    10+L -20 10 0;
    0 10 -20 10;
    10 0 10 -20;
    ];

x0 = [1 1 1 1 1 1 1 1];

[x,fval]=fsolve(@func,x0)

P12 = B(1,2)*(-x(5));
P14 = B(1,4)*(-x(7));
P23 = B(2,3)*(x(5)-x(6));
P34 = B(3,4)*(x(6)-x(7));

res(1,k) = P12;
res(2,k) = P14;
res(3,k) = P23;
res(4,k) = P34;

L = L + 0.001;
end

L_var = 0:0.001:0.128;

figure;
subplot(4,1,1);
plot(L_var, res(1,:));
xlabel('L_{var}(mH)');
ylabel('Energy');
title('P_{12}');

subplot(4,1,2);
plot(L_var, res(2,:));
xlabel('L_{var}(mH)');
ylabel('Energy');
title('P_{14}');

subplot(4,1,3);
plot(L_var, res(3,:));
xlabel('L_{var}(mH)');
ylabel('Energy');
title('P_{23}');

subplot(4,1,4);
plot(L_var, res(4,:));
xlabel('L_{var}(mH)');
ylabel('Energy');
title('P_{34}');

% x(1): Q1, x(2,3,4): v2,3,4 (2,3,4): phases of v2,3,4
function F = func(x)
    global L;
    F(1) = 3 - ( x(2)*(10+L)*sin(-x(5)) + x(4)*10*sin(-x(7)) );
    F(2) = 2 - x(2)*( (10+L)*sin(x(5)) + x(3)*10*sin(x(5)-x(6)) );
    F(3) = -5 - x(3)*( x(2)*10*sin(x(6)-x(5)) + x(4)*10*sin(x(6)-x(7)) );
    F(4) = -x(4)*( 10*sin(x(7)) + x(3)*10*sin(x(7)-x(6)) );
    
    F(5) = x(1) + ( (-20-L) + x(2)*(10+L)*cos(-x(5)) + x(4)*10*cos(-x(7)) );
    F(6) = x(8) + x(2)*( (10+L)*cos(x(5)) + x(2)*(-20) + x(3)*10*cos(x(5)-x(6)) );
    F(7) = x(3)*( x(2)*10*cos(x(6)-x(5)) + x(3)*(-20) + x(4)*10*cos(x(6)-x(7)) );
    F(8) = x(4)*( 10*cos(x(7)) + x(3)*10*cos(x(7)-x(6)) + x(4)*(-20) );
end

