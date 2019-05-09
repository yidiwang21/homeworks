%% 
clear; clc;
edgelist = dlmread('graph.txt');
edgelist = unique(edgelist, 'rows');
% sz = max(edgelist(:));
A = sparse(edgelist(:,1), edgelist(:,2), 1);
spy(A);

[rows, cols, vals] = find(A);