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
% xunit3 = r3 * cos(th) + x3;
% yunit3 = r3 * sin(th) + y3;
% plot(xunit1, yunit1, 'r', xunit2, yunit2, 'r', xunit3, yunit3, 'r'); hold off
plot(xunit1, yunit1, 'r', xunit2, yunit2, 'r'); hold off
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
% hold on;
% rectangle('Position',[14000,1500,3600,500],...
%          'LineWidth',2,...
%          'EdgeColor','r');
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

%%
figure(4);
hold on;
quiver(0, 0, U(1,1), U(21165,1), s(1), 'LineWidth', 2, 'ShowArrowHead', 'off');
quiver(0, 0, U(1,2), U(21165,2), s(2), 'LineWidth', 2, 'ShowArrowHead', 'off');
quiver(0, 0, U(1,3), U(21165,3), s(3), 'LineWidth', 2, 'ShowArrowHead', 'off');
quiver(0, 0, U(1,4), U(21165,4), s(4), 'LineWidth', 2, 'ShowArrowHead', 'off');
quiver(0, 0, U(1,5), U(21165,5), s(5), 'LineWidth', 2, 'ShowArrowHead', 'off');
hold off;
title('Left singular vectors');

%% subgraph of top nodes
% top 100 nodes cooresponding to each singular vector is stored in "n"
[u1, n1] = maxk(abs(U(:,1)), 100);
[u2, n2] = maxk(abs(U(:,2)), 100);
[u3, n3] = maxk(abs(U(:,3)), 100);
[u4, n4] = maxk(abs(U(:,4)), 100);
[u5, n5] = maxk(abs(U(:,5)), 100);

gs = edgelist(:,1);
gt = edgelist(:,2);
G = graph(gs, gt);

figure(5);
subplot(1,5,1);
sg1 = subgraph(G, n1);
is1 = adjacency(sg1);
spy(is1);

subplot(1,5,2);
sg2 = subgraph(G, n2);
is2 = adjacency(sg2);
spy(is2);

subplot(1,5,3);
sg3 = subgraph(G, n3);
is3 = adjacency(sg3);
spy(is3);

subplot(1,5,4);
sg4 = subgraph(G, n4);
is4 = adjacency(sg4);
spy(is4);

subplot(1,5,5);
sg5 = subgraph(G, n5);
is5 = adjacency(sg5);
spy(is5);
