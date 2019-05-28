%% Homework 1
%% Problem 2
clear; clc;
Y = [
    [complex(1.5,-30), complex(-0.5,10), complex(-0.5,10), complex(-0.5,10)] 
    [complex(-0.5,10),complex(5.5,-18.5),0,complex(-0.5,10)]
    [complex(-0.5,10),0,complex(1,-20),complex(-0.5,10)]
    [complex(-0.5,10),complex(-0.5,10),complex(-0.5,10),complex(5.5,-31)]
    ];

v1 = 1.0332*exp(m*38.8884*pi/180);
v2 = 0.9974*exp(m*31.5332*pi/180);
v3 = 1.0499*exp(m*37.0645*pi/180);
v4 = 0.9755*exp(m*28.3416*pi/180);

V = [v1, v2, v3, v4]';

Power1 = v1 * (Y(1,1) * v1 + Y(1,2) * v2 + Y(1,3) * v3 + Y(1,4) * v4)';
Power2 = v2 * (Y(2,1) * v1 + Y(2,2) * v2 + Y(2,3) * v3 + Y(2,4) * v4)';
Power3 = v3 * (Y(3,1) * v1 + Y(3,2) * v2 + Y(3,3) * v3 + Y(3,4) * v4)';
Power4 = v4 * (Y(4,1) * v1 + Y(4,2) * v2 + Y(4,3) * v3 + Y(4,4) * v4)';

P1 = real(Power1)
Q1 = imag(Power1)
P2 = real(Power2)
Q2 = imag(Power2)
P3 = real(Power3)
Q3 = imag(Power3)
P4 = real(Power4)
Q4 = imag(Power4)

%% Problem 3
clear; clc;
B = [
    20 -10 0 -10;
    -10 20 -10 0;
    0 -10 20 -10;
    -10 0 -10 20
    ];
B_ = [
    20 -10 0;
    -10 20 -10;
    0 -10 20
    ];

P = [2;-5;0];

theta = linsolve(B_,P);
theta = [0; theta]

P12 = 10*(theta(1)-theta(2))
P14 = 10*(theta(1)-theta(4))
P23 = 10*(theta(2)-theta(3))
P34 = 10*(theta(3)-theta(4))

%% Problem 5
clear; clc;
sb = zeros(4,100);
j = 1;
P = zeros(3,1);
B_ = [
    20 -10 0;
    -10 20 -10;
    0 -10 20
    ];
Theta = zeros(100,4);

for m = 3.5:0.01:4.5
    cvx_begin
        variables p1 p2
        minimize 561+792*p1+15.62*p1^2+310+785*p2+19.40*p2^2
        subject to
            p1>=2; p2>=1; p1<=4; p2<=3; p1+p2==m;
    cvx_end
    
    sb(1,j) = 561+792*p1+15.62*p1^2+310+785*p2+19.40*p2^2;
    sb(2,j) = p1; sb(3,j) = p2; sb(4,j) = m;
    
    P(1) = p2;
    P(2) = m;
    theta = linsolve(B_,P);
    Theta(j,2:4) = theta;
    
    
    j = j+1;
end

figure;
% a
step = 3.5:0.01:4.5;
subplot(3,1,1);
plot(step, sb(1,:));
title('Minimum cost vs. P3');

% b
subplot(3,1,2);
plot(step, sb(2,:)+sb(3,:));
title('Optimal generation vs. P3');

% c
P12 = zeros(1,100);
P14 = zeros(1,100);
P23 = zeros(1,100);
P34 = zeros(1,100);

for k = 1:101
   P12(k) = 10 * (Theta(k,1) - Theta(k,2));
   P14(k) = 10 * (Theta(k,1) - Theta(k,4));
   P23(k) = 10 * (Theta(k,2) - Theta(k,3));
   P34(k) = 10 * (Theta(k,3) - Theta(k,4));
end

subplot(3,1,3);
plot(step, P12); hold on
plot(step, P14); hold on
plot(step, P23); hold on
plot(step, P34); hold off
title('Power flow of transmission lines');
legend('P12', 'P14', 'P23', 'P34');

%% d
clear; clc;
clear; clc;
sb = zeros(4,100);
j = 1;
P = zeros(3,1);
B_ = [
    20 -10 0;
    -10 20 -10;
    0 -10 20
    ];
Theta = zeros(100,4);

for m = 3.5:0.01:4.5
    cvx_begin
        variables p1 p2 th2 th3 th4
        minimize 561+792*p1+15.62*p1^2+310+785*p2+19.40*p2^2
        subject to
            p1>=2; p2>=1; p1<=4; p2<=3; p1+p2==m;
            [th2; th3; th4] == inv(B_) * [p2;p1+p2;0];
            th2-th3<=0.25;
    cvx_end
    
    sb(1,j) = 561+792*p1+15.62*p1^2+310+785*p2+19.40*p2^2;
    sb(2,j) = p1; sb(3,j) = p2; sb(4,j) = m;
    
    P(1) = p2;
    P(2) = m;
    Theta(j,2) = th2; Theta(j,3) = th3; Theta(j,4) = th4;
    
    j = j+1;
end

step = 3.5:0.01:4.5;
subplot(3,1,1);
plot(step, sb(1,:));
title('Minimum cost vs. P3');

subplot(3,1,2);
plot(step, sb(2,:)+sb(3,:));
title('Optimal generation vs. P3');

P12 = zeros(1,100);
P14 = zeros(1,100);
P23 = zeros(1,100);
P34 = zeros(1,100);

for k = 1:101
   P12(k) = 10 * (Theta(k,1) - Theta(k,2));
   P14(k) = 10 * (Theta(k,1) - Theta(k,4));
   P23(k) = 10 * (Theta(k,2) - Theta(k,3));
   P34(k) = 10 * (Theta(k,3) - Theta(k,4));
end

subplot(3,1,3);
plot(step, P12); hold on
plot(step, P14); hold on
plot(step, P23); hold on
plot(step, P34); hold off
title('Power flow of transmission lines');
legend('P12', 'P14', 'P23', 'P34');


%% Problem 4
clear; clc;
x0 = [0 0 0 0 0 0 0];

[x,fval]=fsolve(@func,x0)

v1 = 1;

% S12 = v1*((v1-x(2))*(-10*1i))'
% S14 = v1*((v1-x(4))*(-10*1i))'
% S23 = x(2)*((x(2)-x(3))*(-10*1i))'
% S34 = x(3)*((x(3)-x(4))*(-10*1i))'
% 
% S21 = x(2)*(-(v1-x(2))*(-10*1i))';
% S41 = x(4)*(-(v1-x(4))*(-10*1i))';
% S32 = x(3)*(-(x(2)-x(3))*(-10*1i))';
% S43 = x(4)*(-(x(3)-x(4))*(-10*1i))';

% total reactive power consumption by transmission line:
% Q_total = imag(S12 + S21 + S14 + S41 + S23 + S32 + S34 + S43)



%% Problem 7
clear; clc;
S12 = complex(7.1485, 6.2405);

x0 = 1;

[v2,fval]=fsolve(@flow_v2,x0);

P23 = real(S12) - 1709.2;
Q23 = imag(S12) - 876.8;

S23 = complex(P23, Q23)

[v3,fval]=fsolve(@flow_v3,x0);





%% functions
% problem 4
% x(1): Q2, x(2,3,4): v2,3,4, x(5,6,7): phases of v2,3,4
function F = func(x)
    B = -[
        20 -10 0 -10;
        -10 20 -10 0;
        0 -10 20 -10;
        -10 0 -10 20
        ];
    P = [3; 2; -5; 0];
    
    v1 = 1; % phase of v1 is 0

    F = [
%       P(1) - v1*(Y(1,1)*v1 + Y(1,2)*x(2) + Y(1,3)*x(3) + Y(1,4)*x(4))';
%       P(2) + 1i*x(1) - x(2)*(Y(2,1)*v1 + Y(2,2)*x(2) + Y(2,3)*x(3) + Y(2,4)*x(4))';
%       P(3) - x(3)*(Y(3,1)*v1 + Y(3,2)*x(2) + Y(3,3)*x(3) + Y(3,4)*x(4))';
%       P(4) - x(4)*(Y(4,1)*v1 + Y(4,2)*x(2) + Y(4,3)*x(3) + Y(4,4)*x(4))'
      
      3 - v1*( v1*B(1,1)*sin(0) + x(2)*B(1,2)*sin(0-x(5)) + x(3)*B(1,3)*sin(0-x(6)) + x(4)*B(1,4)*sin(0-x(7)) );        % P1
      0 + v1*( v1*B(1,1)*cos(0) + x(2)*B(1,2)*cos(0-x(5)) + x(3)*B(1,3)*cos(0-x(6)) + x(4)*B(1,4)*cos(0-x(7)) );        % Q1
      2 - x(2)*( v1*B(2,1)*sin(x(5)-0) + x(2)*B(2,2)*sin(x(5)-x(5)) + x(3)*B(2,3)*sin(x(5)-x(6)) + x(4)*B(2,4)*sin(x(5)-x(7)) );      % P2
      x(1) + x(2)*( v1*B(2,1)*cos(x(5)-0) + x(2)*B(2,2)*cos(x(5)-x(5)) + x(3)*B(2,3)*cos(x(5)-x(6)) + x(4)*B(2,4)*cos(x(5)-x(7)) );   % Q2
      -5 - x(3)*( v1*B(3,1)*sin(x(6)-0) + x(2)*B(3,2)*sin(x(6)-x(5)) + x(3)*B(3,3)*sin(x(6)-x(6)) + x(4)*B(3,4)*sin(x(6)-x(7)) );        % P3
      0 + x(3)*( v1*B(3,1)*cos(x(6)-0) + x(2)*B(3,2)*cos(x(6)-x(5)) + x(3)*B(3,3)*cos(x(6)-x(6)) + x(4)*B(3,4)*cos(x(6)-x(7)) );        % Q3
      0 - x(4)*( v1*B(4,1)*sin(x(7)-0) + x(2)*B(4,2)*sin(x(7)-x(5)) + x(3)*B(4,3)*sin(x(7)-x(6)) + x(4)*B(4,4)*sin(x(7)-x(7)) );        % P4
      0 + x(4)*( v1*B(4,1)*cos(x(7)-0) + x(2)*B(4,2)*cos(x(7)-x(5)) + x(3)*B(4,3)*cos(x(7)-x(6)) + x(4)*B(4,4)*cos(x(7)-x(7)) );        % Q4
    ];
end

function F = flow_v2(x)
    S12 = complex(7.1485, 6.2405);  
    F = [
        S12 - 7.2*((7.2-x)*(1/complex(0.0412,0.0625)))
    ];
end

function F = flow_v3(x)
    S23 = complex(-1702.1, 870.5595);
    y = 1/complex(0.0412,0.0625);
    F = [
        S23 - (7.2133 - 0.0978i)*((7.2133 - 0.0978i-x)*y)
    ];
end
