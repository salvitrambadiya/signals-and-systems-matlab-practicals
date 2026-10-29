% PRACTICAL 4.2: Verify Stability of a System
% System: y(n) - 0.5y(n-1) + 0.06y(n-2) = x(n)
clc;
clear;
close all;

b = 1;
a = [1, -0.5, 0.06];

% Impulse response
n = 0:20;
impulse = double(n == 0);
h = filter(b, a, impulse);

figure;
stem(n, h);
xlabel('n'); ylabel('h(n)');
title('Impulse Response');
grid on;

% A system is stable if all poles lie inside the unit circle
poles = roots(a);
disp('Poles of the system:');
disp(poles);

if all(abs(poles) < 1)
    disp('The System is Stable');
else
    disp('The System is Unstable');
end