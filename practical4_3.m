% PRACTICAL 4.3: Verify Time Invariance of a System, y(n) = exp(x(n))
clc;
clear;
close all;
x = [1, 1, 1, 1];
x1 = [x, zeros(1, 10)];
k = input('Enter the shift value: ');

% Delay the input first, then apply the system: T(x(n-k))
x_delayed = [zeros(1, k), x1];
y_input_delayed = exp(x_delayed);

% Apply the system first, then delay the output: y(n-k)
% (the system maps 0 to exp(0) = 1, so the delayed part is ones)
y_output_delayed = [exp(zeros(1, k)), exp(x1)];

subplot(2,2,1); stem(x1);
title('Input x(n)');
subplot(2,2,2); stem(x_delayed);
title('Delayed Input x(n-k)');
subplot(2,2,3); stem(y_input_delayed);
title('Response to Delayed Input');
subplot(2,2,4); stem(y_output_delayed);
title('Delayed Output y(n-k)');

if all(abs(y_input_delayed - y_output_delayed) <= 0.0001)
    disp('The System is Time Invariant');
else
    disp('The System is Time Variant');
end