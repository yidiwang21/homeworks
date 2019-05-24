clear; clc;
data = csvread('DataHW3Q3.csv', 1, 1, [1,1,8928,1]);

W = zeros(288, 21);

for j = 1:21
    for i = 1:288
       W(i,j) = data( j * 288 + i);
    end
end

%% window size = past 1 day

for i = 1:288
    wlhs(i,:) = W(i, 21:-1:2)';
    wrhs(i,:) = W(i, 20:-1:1)';
end

A = zeros(288, 1);

for i = 1:288
    cvx_begin
        variables a
        minimize ((norm(wlhs(i,:) - wrhs(i,:) * a)))
    cvx_end
    
    A(i) = a;
end

%%
p = zeros(288, 1);
for i = 1:288
    p(i) = A(i) * W(i,21);
end

plot(p);
