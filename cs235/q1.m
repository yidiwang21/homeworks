%% 
clear; clc;
edgelist = dlmread('graph.txt');
edgelist = unique(edgelist, 'rows');
% sz = max(edgelist(:));
A = sparse(edgelist(:,1), edgelist(:,2), 1);

%%
figure(1);
spy(A); hold on

[rows, cols, vals] = find(A);

x1 = 2728; y1 = 2744;
x2 = 16000; y2 = 16000;
x3 = 770; y3 = 739;

r = 1600; r3 = 500;
th = 0:pi/50:2*pi;
xunit1 = r * cos(th) + x1;
yunit1 = r * sin(th) + y1;
xunit2 = r * cos(th) + x2;
yunit2 = r * sin(th) + y2;
xunit3 = r3 * cos(th) + x3;
yunit3 = r3 * sin(th) + y3;
plot(xunit1, yunit1, 'r', xunit2, yunit2, 'r', xunit3, yunit3, 'r'); hold off
title('Sparse Matrix');

%% Question 2
max_node = max(edgelist(:));

deg_node = zeros(1, max_node);

for i = 1:max_node
    deg_node(i) = sum(rows(:) == i);
end

%%
dx = logspace(0, 5);
figure(2);
loglog(deg_node, '*'); 
grid on; hold on
rectangle('Position',[450,200,650,150],...
         'LineWidth',2,...
         'EdgeColor','r');
hold on;
rectangle('Position',[1900,1300,1700,500],...
         'LineWidth',2,...
         'EdgeColor','r');
hold on;
rectangle('Position',[14000,1500,3600,500],...
         'LineWidth',2,...
         'EdgeColor','r');
hold off;
% view([-90 90])
ylabel('Degree'); xlabel('Node count');
title('Degree Distribution in log-log scale');

%% Question 3
n = 3;
[u,s,v] = svds(A);
ds = diag(s);
dsp = norm(ds(n+1:end)) / norm(ds);




%%
[U,S,V,cflag] = svds(A,5);
s = diag(S);


%%
sx1(1:21165) = s(1);
sx2(1:21165) = s(2);
sx3(1:21165) = s(3);
sx4(1:21165) = s(4);
sx5(1:21165) = s(5);
figure(3);
plot(sx1, U(:,1), 'LineWidth',4); hold on
plot(sx2, U(:,2), 'LineWidth',4); hold on
plot(sx3, U(:,3), 'LineWidth',4); hold on
plot(sx4, U(:,4), 'LineWidth',4); hold on
plot(sx5, U(:,5), 'LineWidth',4); hold off
xlabel('Singular values'); ylabel('Left singular vectors');
title('Left singular vectors');

