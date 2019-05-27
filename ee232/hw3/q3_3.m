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

%% window size = past 1 week

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

%% predict
p = zeros(288, 7);

% Day j + 21
for j = 1:7
    for i = 1:288
        p(i,j) = A(i,1) * Y(i,21+j-1) + A(i,2) * Y(i,20+j-1) + A(i,3) * Y(i,19+j-1) + A(i,4) * Y(i,18+j-1) + A(i,5) * Y(i,17+j-1) + A(i,6) * Y(i,16+j-1) + A(i,7) * Y(i,15+j-1);
    end

    figure(j);
    plot(p(:,j)); hold on;
    plot(Y(:,21+j)); hold off
    legend('prediction','reality')
    title(['Prediction of Day', num2str(21+j)]);

end