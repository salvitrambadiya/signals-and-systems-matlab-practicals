% Experiment 7: Fourier Series Representation of Periodic Waveforms
clc;
clear all;
close all;

T = 2*pi;                       % Period
omega = 2*pi/T;                 % Fundamental frequency
t = linspace(0,4*pi,1000);
N_list = [1 3 9 49];            % Number of harmonics used in each subplot

% Part 1: Square wave
figure;
for i = 1:length(N_list)
    N = N_list(i);
    x = zeros(size(t));
    for n = 1:2:N
        x = x + 4/(n*pi)*sin(n*omega*t);
    end
    subplot(2,2,i);
    plot(t,x);
    title(sprintf('Square Wave, harmonics up to %d',N));
    xlabel('Time');
    ylabel('Amplitude');
    grid on;
end

% Part 2: Triangular wave
figure;
for i = 1:length(N_list)
    N = N_list(i);
    x = zeros(size(t));
    for n = 1:2:N
        x = x + 8/(pi^2)*(-1)^((n-1)/2)/n^2*sin(n*omega*t);
    end
    subplot(2,2,i);
    plot(t,x);
    title(sprintf('Triangular Wave, harmonics up to %d',N));
    xlabel('Time');
    ylabel('Amplitude');
    grid on;
end

% Part 3: Sawtooth wave
figure;
for i = 1:length(N_list)
    N = N_list(i);
    x = zeros(size(t));
    for n = 1:N
        x = x + 2/pi*(-1)^(n+1)/n*sin(n*omega*t);
    end
    subplot(2,2,i);
    plot(t,x);
    title(sprintf('Sawtooth Wave, harmonics up to %d',N));
    xlabel('Time');
    ylabel('Amplitude');
    grid on;
end