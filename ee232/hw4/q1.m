%% 
clear; clc;
R = [2.28125 2.35484 2.57560 2.20767];

cvx_begin
    variables Ic Vc;
    maximize Vc;
    subject to 
        Vc == Ic*sum(R);
        Ic*R(1) <= 3.65;
        Ic*R(2) <= 3.65;
        Ic*R(3) <= 3.65;
        Ic*R(4) <= 3.65;
        Ic >= 0; Ic <= 1.6;
cvx_end