%%
clear; clc;
W = [2.4
10.2
3.5
7.7
1.4
5.1
9.0
8.2
2.9
4.0
4.5
6.4
10.2
12.5
10.2
7.6
14.3
7.5
13.5
3.4
8.2
10.8
16.8
13.3
14.6
5.0
2.2
3.2
3.7
2.9
3.2
4.2
2.8
4.7
1.2
1.9
5.2
2.2
5.1
0.7
1.4
1.4
0.4
1.4
2.4
5.5
4.6
3.7
1.1
2.7
2.1
1.7
2.4
2.3
3.0
2.0
4.5
4.8
2.1
3.0
0.6
1.1
0.8
0.4
0.6
0.8
3.7
6.1
9.0
3.5
5.7
7.8
9.0
5.1
11.9
5.0
3.0
5.1
9.3
11.3
10.2
10.6
11.3
3.9
5.0
2.7
7.3
7.6
2.9
2.6
7.0
4.6
4.9
7.1
3.4
13.2
9.7
2.2
1.7
5.5
8.1
6.8
8.8
4.5
4.2
5.6
6.6
8.6
8.7
10.4
7.6
8.4
9.7
4.4
3.9
1.9
1.8
1.4
0.6
2.9
2.1
2.1
4.4
3.4
4.1
6.1
4.8
10.4
4.0
1.6
3.6
2.7
1.9
1.2
4.8
3.5
0.6
1.5
1.6
1.1
2.5
2.0
2.1
2.1
2.5
2.4
3.0
3.5
1.5
3.2
4.9
8.1
8.0
3.6
4.6
5.0
6.4
4.2
5.9
3.6
4.4
8.5
9.2
3.5
2.3
2.2
3.0
1.1
4.6
1.8
3.1
6.0
5.5
5.9
9.3
4.1
4.4
2.0
7.5
4.7
7.6
7.0
3.8
3.4
5.1
7.4
9.5
6.3
1.0
4.6
4.6
3.8
4.6
7.8
5.4
3.0
9.1
5.4
13.7
10.5
8.7
7.5
8.4
8.7
5.8
10.5
12.9
11.0
3.7
8.1
4.9
8.3
6.3
10.2
12.7
7.9
8.7
13.0
9.7
7.2
5.9
8.2
14
7.1
6.2
8.2
6.4
10.2
7.9
6
7.2
5.2
10.1
8.4
6.4
8.5
4.2
7.2
9.3
5.4
6.6
7.6
10.3
9.7
15.8
4.7
4.5
4.5
13.3
9.2
11.5
5.7
6.5
7.2
8.1
9.1
11.7
9.4
4.7
7.4
4.9
9.5
6.3
8.3
6.1
5.2
3
4.8
6.7
7.9
4.5
7.9
7.1
1.6
4.8
2.7
0.50
2.8
1.7
1.9
3.5
2.9
2.9
2.8
2.3
1.9
2.3
2.8
2.1
5.3
3.8
2.4
2
3.3
6.7
12.4
1.1
3
2.3
2
3.3
4.1
2.5
1
2.2
2.2
3.4
2.7
3.6
6.1
4.9
3.8
3.6
6.9
3.6
6.3
6.2
3.8
6
4.2
3.3
1.9
6.8
11.9
6.8
4.3
6.5
5.5
9.6
6.9
7.5
2.2
3.1
3.7
2.1
5
0.80
3.7
4
3.4
3.3
4.1
1.9
2.9
1.2
3.2
3.3
0.70
0.40
1.1
2.3
2.8
0.80
7.2
3.3
2
2.7
3.1
5.5
7.1
1.9
4.8
5.3
3.4
3.8
1.8
1.8
3.5
2
1.3
2.7
2.9
1.9
2
2.7
2.3
2.7
1.4
2.4
2.5
2.5
6.7
2.9
3.9
2.3
6.8
5.8
8.3
7.5
6.4
10.6
9.1
7.3
8.4
5.1
3.4
5.1
2.7
1
0.70
4.9
9.2
5.4
3.2
4.8
8.3
6.3
8.7
7.7
6.6
6.4
8.8
9.8
8.3
9
9.7
11.1
6.2
5.6
7.5
11.2
4.5
9.7
5.3
9.8
5.7
8.5
11.1
10.4
7.8
14.2
4.3
12.2
6.6
20.5
12.5
10.9
2.7
6.3
1.4
4.3
4.6
5.2
4
4.8
4.7
4.6
14.8
6.7
8.7
6.3
1.8
7.5
7.9
14.6
12.4
7
8
6.7
8
7.2
8.6
11.7
12.2
12.9
16.5
11.5
10.1
6.5
6.4
6.8
6.2
12
9.7
5
3.6
6.9
6.9
4.3
6.7
4.3
3.9
4.4
1.7
2
4.8
4.4
7.3
7.8
5.3
4.7
4.6
3.8
7.8
6.2
4
7.5
9.8
4.6
2.4
3.4
8.1
9.5
4.9
2.7
1.8
2.4
3.8
3.1
4.8
1
2.9
3
1.9
4.9
3.4
5.9
4.7
3.9
3.2
2.8
1.8
1.4
2
3.5
5.1
9.1
5.4
2.5
3.8
2.5
2.2
1.2
1
0.9
2.5
1.6
1.9
1.5
2.9
1
1.8
1.5
1.1
1.7
2.1
4.6
4.8
4.7
3.1
2.7
0.6
3.9
2.5
3.6
1.4
1.4
1.4
1.4
0.6
2.2
0.4
1.9
1.9
1.6
0.7
1.2
1.3
1.7
2.4
1.6
3.4
3.2
1.4
2.3
0.50];

wmin = min(W); wmax = max(W);

%% ten states
S = zeros(length(W), 1);

state = [
    0, 2;
    2, 4;
    4, 6;
    6, 8;
    8, 10;
    10, 12;
    12, 14;
    14, 16;
    16, 18;
    18, 20.5;
    ];

for i = 1:length(W)
   if W(i) >= state(1, 1) && W(i) < state(1, 2) 
       S(i) = 1;
   elseif W(i) >= state(2, 1) && W(i) < state(2, 2)
       S(i) = 2;
   elseif W(i) >= state(3, 1) && W(i) < state(3, 2)
       S(i) = 3;
   elseif W(i) >= state(4, 1) && W(i) < state(4, 2)
       S(i) = 4;
   elseif W(i) >= state(5, 1) && W(i) < state(5, 2)
       S(i) = 5;
   elseif W(i) >= state(6, 1) && W(i) < state(6, 2)
       S(i) = 6;
   elseif W(i) >= state(7, 1) && W(i) < state(7, 2)
       S(i) = 7;
   elseif W(i) >= state(8, 1) && W(i) < state(8, 2)
       S(i) = 8;
   elseif W(i) >= state(9, 1) && W(i) < state(9, 2)
       S(i) = 9;
   elseif W(i) >= state(10, 1) && W(i) <= state(10, 2)
       S(i) = 10;
   end
end

% find the next state after state 1
idx1 = find(S == 1);
S1_n = zeros(length(idx1), 1);
for i = 1:length(idx1)-1
    S1_n(i) = S(idx1(i) + 1);
end

% find the next state after state 2
idx2 = find(S == 2);
S2_n = zeros(length(idx2), 1);
for i = 1:length(idx2)
    S2_n(i) = S(idx2(i) + 1);
end

% find the next state after state 3
idx3 = find(S == 3);
S3_n = zeros(length(idx3), 1);
for i = 1:length(idx3)
    S3_n(i) = S(idx3(i) + 1);
end

% find the next state after state 4
idx4 = find(S == 4);
S4_n = zeros(length(idx4), 1);
for i = 1:length(idx4)
    S4_n(i) = S(idx4(i) + 1);
end

% find the next state after state 5
idx5 = find(S == 5);
S5_n = zeros(length(idx5), 1);
for i = 1:length(idx5)
    S5_n(i) = S(idx5(i) + 1);
end

% find the next state after state 6
idx6 = find(S == 6);
S6_n = zeros(length(idx6), 1);
for i = 1:length(idx6)
    S6_n(i) = S(idx6(i) + 1);
end

% find the next state after state 7
idx7 = find(S == 7);
S7_n = zeros(length(idx7), 1);
for i = 1:length(idx7)
    S7_n(i) = S(idx7(i) + 1);
end

% find the next state after state 8
idx8 = find(S == 8);
S8_n = zeros(length(idx8), 1);
for i = 1:length(idx8)
    S8_n(i) = S(idx8(i) + 1);
end

% find the next state after state 9
idx9 = find(S == 9);
S9_n = zeros(length(idx9), 1);
for i = 1:length(idx9)
    S9_n(i) = S(idx9(i) + 1);
end

% find the next state after state 10
idx10 = find(S == 10);
S10_n = zeros(length(idx10), 1);
for i = 1:length(idx10)
    S10_n(i) = S(idx10(i) + 1);
end

M = zeros(10);

% create transition M
for i = 1:10
    M(1,i) = sum(S1_n == i)/length(S1_n);
end

for i = 1:10
    M(2,i) = sum(S2_n == i)/length(S2_n);
end

for i = 1:10
    M(3,i) = sum(S3_n == i)/length(S3_n);
end

for i = 1:10
    M(4,i) = sum(S4_n == i)/length(S4_n);
end

for i = 1:10
    M(5,i) = sum(S5_n == i)/length(S5_n);
end

for i = 1:10
    M(6,i) = sum(S6_n == i)/length(S6_n);
end

for i = 1:10
    M(7,i) = sum(S7_n == i)/length(S7_n);
end

for i = 1:10
    M(8,i) = sum(S8_n == i)/length(S8_n);
end

for i = 1:10
    M(9,i) = sum(S9_n == i)/length(S9_n);
end

for i = 1:10
    M(10,i) = sum(S10_n == i)/length(S10_n);
end


%% wind speed predict
v = 11;
% the speed is at state 6

argv = [1,3,5,7,9,11,13,15,17,19];

pv = 0;
for i = 1:10
    pv = pv + M(6 ,i) * argv(i);
end