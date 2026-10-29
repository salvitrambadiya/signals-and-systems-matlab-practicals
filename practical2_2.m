% PRACTICAL 2.2: Time Shifting, Scaling and Reversal of Signals
clc;
clear;
close all;

t = -10:0.05:10;

% Base signals
ustep = double(t >= 0);
ramp  = t .* ustep;

% (i) Time Shifting
u_delay   = double(t - 2 >= 0);        % u(t-2)
u_advance = double(t + 2 >= 0);        % u(t+2)
r_shift   = (t - 2) .* (t - 2 >= 0);   % r(t-2)

% (ii) Time Scaling: r(2t)
r_scale = (2*t) .* (2*t >= 0);

% (iii) Time Reversal: r(-t)
r_rev = (-t) .* (-t >= 0);

figure;

subplot(2,4,1);
plot(t, ustep, 'b', 'LineWidth', 1.5);
title('Unit Step u(t)');
xlabel('Time'); ylabel('Amplitude');
ylim([-0.2, 1.2]); grid on;

subplot(2,4,2);
plot(t, u_delay, 'b', 'LineWidth', 1.5);
title('Delayed Step u(t-2)');
xlabel('Time'); ylabel('Amplitude');
ylim([-0.2, 1.2]); grid on;

subplot(2,4,3);
plot(t, u_advance, 'b', 'LineWidth', 1.5);
title('Advanced Step u(t+2)');
xlabel('Time'); ylabel('Amplitude');
ylim([-0.2, 1.2]); grid on;

subplot(2,4,4);
plot(t, ramp, 'b', 'LineWidth', 1.5);
title('Unit Ramp r(t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(2,4,5);
plot(t, r_shift, 'b', 'LineWidth', 1.5);
title('Shifted Ramp r(t-2)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(2,4,6);
plot(t, r_scale, 'b', 'LineWidth', 1.5);
title('Scaled Ramp r(2t)');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(2,4,7);
plot(t, r_rev, 'b', 'LineWidth', 1.5);
title('Reversed Ramp r(-t)');
xlabel('Time'); ylabel('Amplitude');
grid on;