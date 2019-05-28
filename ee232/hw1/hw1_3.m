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