%%
clear; clc;
Pl = [
    1.5
    1
    4
    1.5
    ];

Pavg = sum(Pl)/length(Pl);
LF = Pavg / max(Pl);

%% ideal
cvx_begin
    variables p1 p2 p3 p4
    minimize p1+p2;
    subject to
        p1 + p2 + p3 + p4 == 0;
        p1 >= 0; p2 >= 0; p3 <= 0; p4 <= 0;
        1.5+p1>=0; 1+p2>=0;4+p3>=0;1.5+p4>=0;
        1.5+p1<=2.5; 1+p2<=2.5; 4+p3<=2.5; 1.5+p4<=2.5;
%         max([1.5+p1; 1+p2; 4+p3; 1.5+p4]) >= 2.5;
 cvx_end
 
 energy_rating = p1+p2;
 
 %% non ideal
 cvx_begin
    variables p1 p2 p3 p4
    minimize p1+p2;
    subject to
        0.8*(p1 + p2) + (p3 + p4)/0.75 == 0;
        p1 >= 0; p2 >= 0; p3 <= 0; p4 <= 0;
        1.5+0.8*p1>=0; 1+0.8*p2>=0; 4+p3/0.75>=0;1.5+p4/0.75>=0;
%         1.5+p1<=2.5; 1+p2<=2.5; 4+p3<=2.5; 1.5+p4<=2.5;
        8+p1+p2+p3+p4 >= 3.2*(1.5+p1);
        8+p1+p2+p3+p4 >= 3.2*(1+p2);
        8+p1+p2+p3+p4 >= 3.2*(4+p3);
        8+p1+p2+p3+p4 >= 3.2*(1.5+p4);
 cvx_end
 
 energy_rating = 0.8*(pi+p2);