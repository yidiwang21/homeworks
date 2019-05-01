clear; clc;
syms alpha t
pi = 3.14;
T = 16.7;

fun = (120*sqrt(2)*sin(2*pi/T*t))^2/100;

tmp = int(fun, t, alpha/(2*pi)*T, T/2) + int(fun, t, T/2+alpha/(2*pi)*T, T);
tmp = tmp/T;

R_eff = 120^2/tmp;
ezplot(R_eff, [0,pi]);
title('R_{eff} vs. \alpha');


% q = integral(@(t) fun(t)^2,alpha,T/2-alpha);

