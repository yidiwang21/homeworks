%% 
clear; clc;

fxl = zeros(3, 10); % bus 2,3,4

fxl(1,:) = [ 0.6 0.5 0.85 1.15 1.3 1.05 1.4 1.55 0.95 0.75 ];
fxl(2,:) = [ 0.7 0.8 0.75 0.95 1.1 1.3 1.3 1.2 1.05 0.9 ];
fxl(3,:) = [ 0.65 0.65 0.8 0.8 0.95 1.05 0.95 1.05 0.9 0.9 ];

ep = [ 26 25 37 43 51 39 55 60 38 33 ];

B = [
    -20 0 10 0;
    0 -30 10 10;
    10 10 -40 10;
    0 10 10 -20;
    ];

s = 0;

cvx_begin
    variables pg1(1,10) pg2(1,10) pg5(1,10) cl(3,10) th(4,10);
    for h = 1:10
       s = s + (sum(fxl(:,h)) + sum(cl(:,h))) *  ep(h);
    end
    minimize s;
    subject to
        pg1 >= 1.5; pg2 >= 1.5; pg5 >= 1.5;
        pg1 <= 5; pg2 <= 5; pg5 <= 5;
        (pg1+pg2+pg5) == fxl(1,:)+fxl(2,:)+fxl(3,:) + cl(1,:)+cl(2,:)+cl(3,:);
        sum(cl(1,1:10)) == 10;
        sum(cl(2,3:9)) == 12; cl(2,1:2) == 0; cl(2,10) == 0;
        sum(cl(3,2:6)) == 7; cl(3,1) == 0; cl(3,7:10) == 0;
        cl >= 0;
        for i = 1:10
            [pg2(i)-fxl(1,i)-cl(1,i);
                -fxl(2,i)-cl(2,i);
                -fxl(3,i)-cl(3,i);
                pg5(i)] == B * [ th(1,i); th(2,i); th(3,i); th(4,i) ];
        end
cvx_end

cl1 = 0;
cl2 = 0;
cl3 = 0;
for i = 1:10
    cl1 = [cl1, linspace(cl(1,i),cl(1,i))];
    cl2 = [cl2, linspace(cl(2,i),cl(2,i))];
    cl3 = [cl3, linspace(cl(3,i),cl(3,i))];
end

t = 0:0.01:10;

figure(3);
subplot(3,1,1);
plot(t,cl1);
title('Controllable Load at Bus 2');
subplot(3,1,2);
plot(t,cl2);
title('Controllable Load at Bus 3');
subplot(3,1,3);
plot(t,cl3);
title('Controllable Load at Bus 4');

load = fxl(1,:)+fxl(2,:)+fxl(3,:);
par = max(load) / sum(load) * 10;