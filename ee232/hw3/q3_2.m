clear; clc;
data = csvread('DataHW3Q3.csv', 1, 1, [1,1,8928,1]);

W = zeros(288, 21);

for j = 1:21
    for i = 1:288
       W(i,j) = data( j * 288 + i);
    end
end

%% window size = past 2 days
wlhs = zeros(288, 19);
wrhs1 = zeros(288, 19);
wrhs2 = zeros(288, 19);
for i = 1:288
    wlhs(i,:) = W(i, 21:-1:3)';
    wrhs1(i,:) = W(i, 20:-1:2)';
    wrhs2(i,:) = W(i, 19:-1:1)';
end

A = zeros(288, 2);

for i = 1:288
    K = [wrhs1(i,:); wrhs2(i,:)]';
    b = wlhs(i,:)';
    cvx_begin
        variables a1 a2
        minimize (norm(b - K * [a1; a2]))
    cvx_end
    
    A(i,1) = a1; A(i,2) = a2;
end

%%
p = zeros(288, 1);
for i = 1:288
    p(i) = A(i,1) * W(i,21) + A(i,2) * W(i,20);
end

plot(p);