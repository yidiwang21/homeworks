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

%% window size = past 2 weeks

wlhs = zeros(288, 7);
wrhs = zeros(288, 7, 14);

for i = 1:288
    wlhs(i,:) = W(i, 21:-1:15)';
    for j = 1:14
        wrhs(i,:,j) = W(i, 21-j:-1:15-j)';
    end
end


A = zeros(288, 14);

for i = 1:288
    K = wrhs(i,:,1);
    for j = 2:14
        K = [K; wrhs(i,:,j)];
    end
    K = K';
%     K = [wrhs(i,:,1); wrhs(i,:,2); wrhs(i,:,3); wrhs(i,:,4); wrhs5(i,:); wrhs6(i,:); wrhs7(i,:)]';
    b = wlhs(i,:)';
    cvx_begin
        variables a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14
        minimize (norm(b - K * [a1; a2; a3; a4; a5; a6; a7; a8; a9; a10; a11; a12; a13; a14]))
    cvx_end
    
    A(i,1) = a1; A(i,2) = a2; A(i,3) = a3; A(i,4) = a4; A(i,5) = a5; A(i,6) = a6; A(i,7) = a7;
    A(i,8) = a8; A(i,9) = a9; A(i,10) = a10; A(i,11) = a11; A(i,12) = a12; A(i,13) = a13; A(i,14) = a14;
end

%% predict
p = zeros(288, 7);

% Day j + 21
for j = 1:7
    for i = 1:288
        for k = 1:14
            p(i,j) =  p(i,j) + A(i,k) * Y(i,21+j-k);
        end
    end

    figure(j);
    plot(p(:,j)); hold on;
    plot(Y(:,21+j)); hold off
    legend('prediction','reality')
    title(['Prediction of Day', num2str(21+j)]);

end