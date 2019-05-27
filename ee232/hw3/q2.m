%%
clear; clc;
P = [0.00
0.00
0.00
0.00
0.00
0.73
94.38
347.58
909.59
1597.18
2120.44
2503.61
2761.14
2848.73
2789.38
2570.07
2175.81
1620.66
922.78
195.55
0.37
0.00
0.00
0.00
];

P = -P;

S12 = complex(P + 11121.8, 6183);
z = complex(0.0412, 0.0625);
v1 = 7.2;

v2 = v1 - S12*z/v1;

S23 = complex(P + 9412.6, 5306.2);
v3 = zeros(24,1);
for i = 1:24
    v3(i) = v2(i) - S23(i)*z/v2(i);
end

% how to plot?
amp_v3 = zeros(24, 1);
ang_v3 = zeros(24, 1);
for i = 1:24
    amp_v3(i) = sqrt(real(v3(i))^2 + imag(v3(i))^2);
    ang_v3(i) = angle(v3(i));
end

figure;
subplot(2,1,1);
plot(amp_v3);
title('Amplitude of voltage at bus 3');
subplot(2,1,2);
plot(ang_v3);
title('Angle of voltage at bus 3');