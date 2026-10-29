% Experiment 5.1: Convolution of Rectangular and Triangular Signals
clc;
clear all;
close all;

S1 = [0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0];      % Rectangular signal
S2 = [1,2,3,4,3,2,1,-1,-2,-3,-4,-3,-2,-1];   % Triangular signal

% Part 1: Rectangular * Triangular
y1 = conv(S1,S2);
figure;
subplot(3,1,1);
stem(S1);
title('Rectangular Signal');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,2);
stem(S2);
title('Triangular Signal');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,3);
stem(y1);
title('Convolution: Rectangular * Triangular');
xlabel('n');
ylabel('Amplitude');

% Part 2: Rectangular * Rectangular
y2 = conv(S1,S1);
figure;
subplot(3,1,1);
stem(S1);
title('Rectangular Signal 1');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,2);
stem(S1);
title('Rectangular Signal 2');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,3);
stem(y2);
title('Convolution: Rectangular * Rectangular');
xlabel('n');
ylabel('Amplitude');

% Part 3: Triangular * Triangular
y3 = conv(S2,S2);
figure;
subplot(3,1,1);
stem(S2);
title('Triangular Signal 1');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,2);
stem(S2);
title('Triangular Signal 2');
xlabel('n');
ylabel('Amplitude');
subplot(3,1,3);
stem(y3);
title('Convolution: Triangular * Triangular');
xlabel('n');
ylabel('Amplitude');