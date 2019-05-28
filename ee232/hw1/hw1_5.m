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
    P(2) = -m;
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
            [th2; th3; th4] == inv(B_) * [p2;-p1-p2;0];
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