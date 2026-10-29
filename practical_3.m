% PRACTICAL 3: Generation of Continuous-Time Signals
clc;
clear;
close all;

% (i) Sine and Cosine Signal
t = 0:0.0001:1;
f = 5;
x_cos = cos(2*pi*f*t);
x_sin = sin(2*pi*f*t);

figure;
plot(t, x_cos, 'r', t, x_sin, 'b');
xlabel("Time"); ylabel("Amplitude");
title("Sine and Cosine Signal");
legend("Cosine", "Sine");
grid on;

% (ii) Sinc Function
t_sinc = -5:0.005:5;
x_sinc = sin(pi*t_sinc) ./ (pi*t_sinc);
x_sinc(t_sinc == 0) = 1;                  % value at t = 0

figure;
plot(t_sinc, x_sinc, 'LineWidth', 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Sinc Function");
grid on;

% (iii) Triangular Waveform
t_w = -2*pi:0.01:2*pi;
x_tri = (2/pi) * asin(sin(t_w));

figure;
plot(t_w, x_tri, 'LineWidth', 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Triangular Waveform");
grid on;

% (iv) Rectangular Pulse
t_rect = -1:0.001:1;
x_rect = double(abs(t_rect) <= 0.5);

figure;
plot(t_rect, x_rect, 'LineWidth', 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Rectangular Pulse");
ylim([-0.2, 1.2]); grid on;

% (v) Sawtooth Waveform
x_saw = 2 * ((t_w/(2*pi)) - floor(0.5 + (t_w/(2*pi))));

figure;
plot(t_w, x_saw, 'LineWidth', 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Sawtooth Waveform");
grid on;

% (vi) Exponential Function
t_exp = 0:0.0001:1;
x_exp = exp(-0.5*t_exp);

figure;
plot(t_exp, x_exp, 'LineWidth', 1.5);
xlabel("Time"); ylabel("Amplitude");
title("Exponential Function");
grid on;