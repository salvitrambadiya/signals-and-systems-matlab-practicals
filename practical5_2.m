% Experiment 5.2: Convolution of Two Signals using a User-Defined Function
clc;
clear all;
close all;

% Input signals (enter as row vectors, e.g. [1 2 3])
s1 = input('Enter first signal: ');
s2 = input('Enter second signal: ');

% Convolution using user-defined function
y = Conv_user(s1,s2);

% Plots
figure;
subplot(3,1,1);
stem(s1);
title('Signal 1');
xlabel('Sample');
ylabel('Amplitude');
subplot(3,1,2);
stem(s2);
title('Signal 2');
xlabel('Sample');
ylabel('Amplitude');
subplot(3,1,3);
stem(y);
title('Result of Convolution');
xlabel('Sample');
ylabel('Amplitude');

% User-defined convolution function: y[n] = sum of x[k]*h[n-k]
function y = Conv_user(x,h)
l1 = length(x);
l2 = length(h);
l3 = l1 + l2 - 1;          % Length of output
x1 = [x, zeros(1,l2)];     % Zero-padded x
h1 = [h, zeros(1,l1)];     % Zero-padded h
y = zeros(1,l3);
for n = 1:l3
    acc = 0;
    for k = 1:n
        acc = acc + x1(k)*h1(n-k+1);
    end
    y(n) = acc;
end
end