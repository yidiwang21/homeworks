clear; clc;
p1 = 2; p2 = 1;

j = 1;
sb = zeros(101, 100);
optg1 = zeros(101,100);
optg2 = zeros(101,100);
Theta2 = zeros(101,100);
Theta3 = zeros(101,100);
Theta4 = zeros(101,100);

B = [
    20 -10 0;
    -10 20 -10;
    0 -10 20
    ];

% approximte v2 to be 1
for n = 3.5:0.01:4.5
    for m = 1:100
       if p1 >= 2 && p1 <= 4 && p2 >= 1 && p2 <= 3
           th = B\[p2;p1+p2;0];
           v2 = exp(1i*th(1)); v3 = exp(1i*th(2)); v4 = exp(1i*th(3));
           Q2 = (p2 - v2*(10 + (-20)*v2 + 10*v3))/1i;
           if th(1)-th(2)<=0.25 && Q2 > 0
               
               sb(j,m) = 561+792*p1+15.62*p1^2+310+785*p2+19.40*p2^2;
               
               optg1(j,m) = p1; 
               optg2(j,m) = p2;
               Theta2(j,m) = th(1);
               Theta3(j,m) = th(2);
               Theta4(j,m) = th(3);
           end
       end
       p1 = p1 + 0.01;
       p2 = n - p1;
       
    end
    p1 = 2; p2 = n-p1;
    j = j + 1;
end

sb_min = zeros(1, 101);
optg_min = zeros(1,101);
theta_min = zeros(4,101);

for k = 1:101
    tmp = sb(k,:);
    [sb_min(k),idx] = min(tmp(tmp>0));
    optg_min(k) = optg1(k,idx) + optg2(k,idx);
    theta_min(2,k) = Theta2(k,idx);
    theta_min(3,k) = Theta3(k,idx);
    theta_min(4,k) = Theta4(k,idx);
end

P12 = zeros(1,100);
P14 = zeros(1,100);
P23 = zeros(1,100);
P34 = zeros(1,100);

for k = 1:101
   P12(k) = 10 * (theta_min(1,k)-theta_min(2,k));
   P14(k) = 10 * (theta_min(1,k)-theta_min(4,k));
   P23(k) = 10 * (theta_min(2,k)-theta_min(3,k));
   P34(k) = 10 * (theta_min(3,k)-theta_min(4,k));
end

figure;
step = 3.5:0.01:4.5;
subplot(3,1,1);
plot(step, sb_min);
title('Minimum cost vs. P3');

subplot(3,1,2);
plot(step, optg_min);
title('Optimal p1+p2 vs. P3');

subplot(3,1,3);
plot(step, P12); hold on
plot(step, P14); hold on
plot(step, P23); hold on
plot(step, P34); hold off
title('Power flow of transmission lines');
