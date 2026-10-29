% PRACTICAL 4.1: Verify Linearity of a System, y(n) = exp(x(n))
clc;
clear;
close all;

x1 = [1, 0, -1, 2];
x2 = [-2, 3, 2, -3];
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');

% Output of combined input: T(a*x1 + b*x2)
y_combined = exp(a*x1 + b*x2);

% Combination of individual outputs: a*T(x1) + b*T(x2)
y_separate = a*exp(x1) + b*exp(x2);

subplot(2,2,1); stem(x1);
title('Input x1');
subplot(2,2,2); stem(x2);
title('Input x2');
subplot(2,2,3); stem(y_combined);
title('T(a*x1 + b*x2)');
subplot(2,2,4); stem(y_separate);
title('a*T(x1) + b*T(x2)');

if all(abs(y_combined - y_separate) <= 0.0001)
    disp('The System is Linear');
else
    disp('The System is Non-Linear');
end