% PRACTICAL 2.1: Generation and Plotting of Basic Signals
clc;
clear;
close all;

t = -10:0.05:10;

% (i) Unit Impulse
impulse = double(abs(t) < 1e-10);

% (ii) Unit Step
ustep = double(t >= 0);

% (iii) Unit Ramp
ramp = t .* ustep;

% (iv) Signum
sgn = sign(t);

subplot(2,2,1);
stem(t, impulse, 'LineWidth', 1.5);
title('Unit Impulse Signal');
xlabel('Time'); ylabel('Amplitude');
ylim([-0.2, 1.2]); grid on;

subplot(2,2,2);
plot(t, ustep, 'LineWidth', 1.5);
title('Unit Step Signal');
xlabel('Time'); ylabel('Amplitude');
ylim([-0.2, 1.2]); grid on;

subplot(2,2,3);
plot(t, ramp, 'LineWidth', 1.5);
title('Unit Ramp Signal');
xlabel('Time'); ylabel('Amplitude');
grid on;

subplot(2,2,4);
plot(t, sgn, 'LineWidth', 1.5);
title('Signum Function');
xlabel('Time'); ylabel('Amplitude');
ylim([-1.2, 1.2]); grid on;