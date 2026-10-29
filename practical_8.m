% Experiment 8: Fourier Transform using FFT and IFFT (Magnitude and Phase Spectra)
clc;
clear all;
close all;

fs = 100;                        % Sampling frequency (Hz)
t = -10:1/fs:10-1/fs;            % Time vector

% Part 1: Exponential signal
x1 = 3.^t;
plot_fft_ifft(x1,t,fs,'Exponential Signal');

% Part 2: Sine wave
x2 = sin(t);
plot_fft_ifft(x2,t,fs,'Sine Wave');

% Part 3: Parabolic signal
x3 = t.^2;
plot_fft_ifft(x3,t,fs,'Parabolic Signal');

% Function: computes FFT, plots spectra, and recovers the signal using IFFT
function plot_fft_ifft(x,t,fs,name)
N = length(x);
f = (-N/2:N/2-1)*(fs/N);                       % Frequency vector (Hz)
X = fftshift(fft(ifftshift(x)))/fs;            % FFT (centered at f = 0)
xr = real(fftshift(ifft(ifftshift(X*fs))));    % IFFT (recovered signal)
ph = angle(X);
ph(abs(X) < 1e-3*max(abs(X))) = 0;             

figure;
subplot(2,2,1);
plot(t,x);
title(name);
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(2,2,2);
plot(f,abs(X));
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
xlim([-5 5]);
grid on;
subplot(2,2,3);
plot(f,ph);
title('Phase Spectrum');
xlabel('Frequency (Hz)');
ylabel('Phase (rad)');
xlim([-5 5]);
grid on;
subplot(2,2,4);
plot(t,xr);
title('Recovered Signal using IFFT');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
end