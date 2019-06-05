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
plot(xunit1, yunit1, 'r', xunit2, yunit2, 'r', xunit3, yunit3, 'r'); hold on
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
% hist(deg_node);
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
view([90 90])
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
% sx1(1:21165) = s(1);
% sx2(1:21165) = s(2);
% sx3(1:21165) = s(3);
% sx4(1:21165) = s(4);
% sx5(1:21165) = s(5);
% figure(3);
% plot(sx1, U(:,1), 'LineWidth',4); hold on
% plot(sx2, U(:,2), 'LineWidth',4); hold on
% plot(sx3, U(:,3), 'LineWidth',4); hold on
% plot(sx4, U(:,4), 'LineWidth',4); hold on
% plot(sx5, U(:,5), 'LineWidth',4); hold off
% xlabel('Singular values'); ylabel('Left singular vectors');
% title('Left singular vectors');

%%
figure(4);
plot(U(:,1), 'LineWidth', 2); hold on
plot(U(:,2), 'LineWidth', 2); hold on
plot(U(:,3), 'LineWidth', 2); hold on 
plot(U(:,4), 'LineWidth', 2); hold on
plot(U(:,5), 'LineWidth', 2); hold on
% hold on;
% quiver(0, 0, U(1,1), U(21165,1), s(1), 'LineWidth', 2, 'ShowArrowHead', 'off');
% quiver(0, 0, U(1,2), U(21165,2), s(2), 'LineWidth', 2, 'ShowArrowHead', 'off');
% quiver(0, 0, U(1,3), U(21165,3), s(3), 'LineWidth', 2, 'ShowArrowHead', 'off');
% quiver(0, 0, U(1,4), U(21165,4), s(4), 'LineWidth', 2, 'ShowArrowHead', 'off');
% quiver(0, 0, U(1,5), U(21165,5), s(5), 'LineWidth', 2, 'ShowArrowHead', 'off');
hold off;
title('Left singular vectors');

%% subgraph of top nodes
% top 100 nodes cooresponding to each singular vector is stored in "n"
[u1, n1] = maxk(abs(U(:,1)), 100);
[u2, n2] = maxk(abs(U(:,2)), 100);
[u3, n3] = maxk(abs(U(:,3)), 100);
[u4, n4] = maxk(abs(U(:,4)), 100);
[u5, n5] = maxk(abs(U(:,5)), 100);

sa = zeros(21165);
sa(n1,n1) = 1; 
sa(n2,n2) = 1; sa(n3,n3) = 1; sa(n4,n4) = 1; sa(n5,n5) = 1;
ssa = sparse(sa);

figure(5);
spy(ssa);
title('Top 100 nodes of singular vectors');
