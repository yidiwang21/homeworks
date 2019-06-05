%%
clear; clc;

x = zeros(1,100);
p = zeros(1,100);
x(1) = 26;

sw = 0; % 0 for off, 1 for on

for t = 1:100
    if x(t) > 26    % turn on
        sw = 1;
    elseif x(t) < 24
        sw = 0;
    end
    
    if sw == 1
        p(t) = 2000;
    else
        p(t) = 0;
    end
    
    x(t+1) = 0.95*x(t) + 0.05*(30-0.9/200*p(t));
    
end

tx = 0:5:500;
tp = 0:5:495;
figure(1);
subplot(2,1,1);
plot(tx,x);
xlabel('Time(minutes)'); ylabel('Degree celsius');
title('Indoor temperature');

subplot(2,1,2);
plot(tp,p/1000);
ylim([-1 3]);
xlabel('Time(minutes)'); ylabel('Power consumption(kW)');

total_e = sum(p) / 12 / 1000;

%%
clear; clc;

x = zeros(1,100);
p = zeros(1,100);
x(1) = 23;

sw = 0; % 0 for off, 1 for on

for t = 1:100
    if x(t) > 26    % turn on
        sw = 1;
    elseif x(t) < 24
        sw = 0;
    end
    
    if sw == 1
        p(t) = 2000;
    else
        p(t) = 0;
    end
    
    x(t+1) = 0.95*x(t) + 0.05*(30-0.9/200*p(t));
    
end

tx = 0:5:500;
tp = 0:5:495;
figure(1);
subplot(2,1,1);
plot(tx,x);
xlabel('Time(minutes)'); ylabel('Degree celsius');
title('Indoor temperature');

subplot(2,1,2);
plot(tp,p/1000);
ylim([-1 3]);
xlabel('Time(minutes)'); ylabel('Power consumption(kW)');

total_e = sum(p) / 12 / 1000;

%%
clear; clc;

x = zeros(1,100);
p = zeros(1,100);
x(1) = 27;

sw = 0; % 0 for off, 1 for on

for t = 1:100
    if x(t) > 26    % turn on
        sw = 1;
    elseif x(t) < 24
        sw = 0;
    end
    
    if sw == 1
        p(t) = 2000;
    else
        p(t) = 0;
    end
    
    x(t+1) = 0.95*x(t) + 0.05*(30-0.9/200*p(t));
    
end

tx = 0:5:500;
tp = 0:5:495;
figure(1);
subplot(2,1,1);
plot(tx,x);
xlabel('Time(minutes)'); ylabel('Degree celsius');
title('Indoor temperature');

subplot(2,1,2);
plot(tp,p/1000);
ylim([-1 3]);
xlabel('Time(minutes)'); ylabel('Power consumption(kW)');

total_e = sum(p) / 12 / 1000;