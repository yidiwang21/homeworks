%% 
clear; clc;
edgelist = dlmread('graph.txt');
edgelist = unique(edgelist, 'rows');
% sz = max(edgelist(:));
A = sparse(edgelist(:,1), edgelist(:,2), 1);

figure;
spy(A); hold on

[rows, cols, vals] = find(A);

x1 = 2728; y1 = 2744;
x2 = 16000; y2 = 16000;

r = 1600;
th = 0:pi/50:2*pi;
xunit1 = r * cos(th) + x1;
yunit1 = r * sin(th) + y1;
xunit2 = r * cos(th) + x2;
yunit2 = r * sin(th) + y2;
plot(xunit1, yunit1, 'r', xunit2, yunit2, 'r'); hold off

%% Question 2
max_node = max(edgelist(:));

deg_node = zeros(1, max_node);

for i = 1:max_node
    deg_node(i) = sum(rows(:) == i);
end

%%
dx = logspace(0, 5);
loglog(deg_node, '*'); grid on

%% Question 3
[U,S,V,cflag] = svds(A,5);
s = diag(S);
%%
sx1(1:21165) = s(1);
sx2(1:21165) = s(2);
sx3(1:21165) = s(3);
sx4(1:21165) = s(4);
sx5(1:21165) = s(5);
plot(sx1, U(:,1)); hold on
plot(sx2, U(:,2)); hold on
plot(sx3, U(:,3)); hold on
plot(sx4, U(:,4)); hold on
plot(sx5, U(:,5)); hold off

