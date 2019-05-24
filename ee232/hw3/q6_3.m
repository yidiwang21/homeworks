clear; clc;
data = csvread('DataHW3Q3.csv', 1, 1, [1,1,8928,1]);

W = zeros(288, 21);

for j = 1:21
    for i = 1:288
       W(i,j) = data( j * 288 + i);
    end
end

wlhs = zeros(288, 14);
wrhs1 = zeros(288, 14);
wrhs2 = zeros(288, 14);
wrhs3 = zeros(288, 14);
wrhs4 = zeros(288, 14);
wrhs5 = zeros(288, 14);
wrhs6 = zeros(288, 14);
wrhs7 = zeros(288, 14);

for i = 1:288
    wlhs(i,:) = W(i, 21:-1:8)';
    wrhs1(i,:) = W(i, 20:-1:7)';
    wrhs2(i,:) = W(i, 19:-1:6)';
    wrhs3(i,:) = W(i, 18:-1:5)';
    wrhs4(i,:) = W(i, 17:-1:4)';
    wrhs5(i,:) = W(i, 16:-1:3)';
    wrhs6(i,:) = W(i, 15:-1:2)';
    wrhs7(i,:) = W(i, 14:-1:1)';
end

A = zeros(288, 7);

for i = 1:288
    K = [wrhs1(i,:); wrhs2(i,:); wrhs3(i,:); wrhs4(i,:); wrhs5(i,:); wrhs6(i,:); wrhs7(i,:)]';
    b = wlhs(i,:)';
    cvx_begin
        variables a1 a2 a3 a4 a5 a6 a7
        minimize (norm(b - K * [a1; a2; a3; a4; a5; a6; a7]))
    cvx_end
    
    A(i,1) = a1; A(i,2) = a2; A(i,3) = a3; A(i,4) = a4; A(i,5) = a5; A(i,6) = a6; A(i,7) = a7;
end

%%
p = zeros(288, 1);
for i = 1:288
    p(i) = A(i,1) * W(i,21) + A(i,2) * W(i,20) + A(i,3) * W(i,19) + A(i,4) * W(i,18) + A(i,5) * W(i,17) + A(i,6) * W(i,16) + A(i,7) * W(i,15);
end

plot(p);