clear; clc;
data = csvread('DataHW3Q3.csv', 1, 1, [1,1,8928,1]);

% get the training data
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

%% predict
p = zeros(288, 7);

figure;
% Day j + 21
for j = 1:7
    for i = 1:288
        p(i,j) = A(i) * Y(i,21 + j -1);
    end


    subplot(7,1,j);
    plot(p(:,j)); hold on;
    plot(Y(:,21+j)); hold off
    title(['Prediction of Day', num2str(21+j)]);

end