clear; clc;
data = csvread('DataHW3Q3.csv', 1, 1, [1,1,8928,1]);

W = zeros(288, 21);

for j = 1:21
    for i = 1:288
       W(i,j) = data( j * 288 + i);
    end
end

% get all the data
Y = zeros(288, 28);
for k = 1:28
    for i = 1:288
        Y(i,k) = data( k * 288 + i);
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

%% predict
p = zeros(288, 7);

figure;
% Day j + 21
for j = 1:7
    for i = 1:288
        p(i,j) = A(i,1) * Y(i,21+j-1) + A(i,2) * Y(i,20+j-1);
    end

    subplot(7,1,j);
    plot(p(:,j)); hold on;
    plot(Y(:,21+j)); hold off
    title(['Prediction of Day', num2str(21+j)]);

end