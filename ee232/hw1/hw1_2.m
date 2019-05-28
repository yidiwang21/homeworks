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