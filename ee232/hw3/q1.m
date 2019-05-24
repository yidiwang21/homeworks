clear; clc;
% V = 0:0.01:0.6;
% syms I V
Isc = 6;
I0 = 5*10^(-11);
Rp = 10; Rs = 0.001;
% f = I - (Isc - I0 * (exp(38.9*(V/36 + I*Rs)) - 1) - (V/36 + I*Rs)/Rp) == 0;
% 
% sol = solve(f, I);

% figure;
% subplot(2,1,1);
% ezplot( f, [0,8,0,30] );
% view([90 -90])

%%
Im = zeros(1, 301);
P = zeros(1,301);
j = 1;
syms I
for V = 0:0.1:30
   eqn =  I - (Isc - I0 * (exp(38.9*(V/36 + I*Rs)) - 1) - (V/36 + I*Rs)/Rp) == 0;
   sol = solve(eqn, I);
   Im(j) = sol;
   P(j) = Im(j) * V;
   j = j + 1;
end

%%
[val, idx] = max(P);
vr = idx/301 * 30;
ir = Im(idx);
voc = 237/301 * 30;

%%
V = 0:0.1:30;
figure;
subplot(2,1,1);
plot(V, Im); 
xlim([0,30]); ylim([0,8]); 
title('Current vs Voltage');
subplot(2,1,2);
plot(V, P);
ylim([0,150]); xlim([0,30]);
title('Power vs Voltage');

%%
fill_factor = vr * ir / (voc * Isc);
Rload = vr/ir;
pmax = vr * ir;