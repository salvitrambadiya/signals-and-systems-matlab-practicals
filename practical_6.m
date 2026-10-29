% Experiment 6: Response of a System using filter and Frequency Response
% System: y[n] - y[n-1] = x[n]
clc;
clear all;
close all;

b = 1;                               % Numerator coefficients
a = [1 -1];                          % Denominator coefficients
n = 0:10;

% Part 1: Impulse response (unit impulse applied to filter)
x_imp = [1, zeros(1,length(n)-1)];
h = filter(b,a,x_imp);

figure;
subplot(2,1,1);
stem(n,x_imp);
title('Unit Impulse Input');
xlabel('n');
ylabel('Amplitude');
subplot(2,1,2);
stem(n,h);
title('Impulse Response using filter');
xlabel('n');
ylabel('Amplitude');

% Part 2: Response to a ramp input x[n] = n
y = filter(b,a,n);

figure;
subplot(2,1,1);
stem(n,n);
title('Input Signal x[n] = n');
xlabel('n');
ylabel('Amplitude');
subplot(2,1,2);
stem(n,y);
title('Output using filter');
xlabel('n');
ylabel('Amplitude');

% Part 3: Frequency response H(w) = B(e^jw) / A(e^jw)
w = linspace(0.01,pi,512);            
kb = 0:length(b)-1;
ka = 0:length(a)-1;
H = (b*exp(-1i*kb.'*w)) ./ (a*exp(-1i*ka.'*w));

figure;
subplot(2,1,1);
plot(w,abs(H));
title('Magnitude Response');
xlabel('Frequency (rad/sample)');
ylabel('|H(w)|');
grid on;
subplot(2,1,2);
plot(w,angle(H));
title('Phase Response');
xlabel('Frequency (rad/sample)');
ylabel('Phase (rad)');
grid on;