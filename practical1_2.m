% PRACTICAL 1.2: Generation of Sine Wave with Different Amplitudes and Frequencies
clc;
clear;
close all;

t = 0:0.1:2*pi;

% (i) sin(t)
subplot(2,2,1);
plot(t, sin(t));
xlabel("Time"); ylabel("Amplitude");
title("sin(t)");

% (ii) sin(5t)
subplot(2,2,2);
plot(t, sin(5*t));
xlabel("Time"); ylabel("Amplitude");
title("sin(5t)");

% (iii) sin(2t)
subplot(2,2,3);
plot(t, sin(2*t));
xlabel("Time"); ylabel("Amplitude");
title("sin(2t)");

% (iv) 2sin(2t)
subplot(2,2,4);
plot(t, 2*sin(2*t));
xlabel("Time"); ylabel("Amplitude");
title("2sin(2t)");