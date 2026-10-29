% PRACTICAL 4.5: Even and Odd Components of a Signal
clc;
clear;
close all;

n = -3:3;
x = [1, 1, -1, 2, -2, 3, 0];

% Even and odd parts
xe = (x + fliplr(x)) / 2;     % (x(n) + x(-n)) / 2
xo = (x - fliplr(x)) / 2;     % (x(n) - x(-n)) / 2

subplot(1,3,1); stem(n, x);
title('Original Signal');
xlabel('n'); ylabel('Amplitude');

subplot(1,3,2); stem(n, xe);
title('Even Component');
xlabel('n'); ylabel('Amplitude');

subplot(1,3,3); stem(n, xo);
title('Odd Component');
xlabel('n'); ylabel('Amplitude');