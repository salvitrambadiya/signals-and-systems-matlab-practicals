% PRACTICAL 4.4: Energy and Power of a Signal
clc;
clear;
close all;

x = [1, -1, 2, -2, 3];

% (i) Energy
E = sum(abs(x).^2);

% (ii) Average Power over the given samples
P = E / length(x);

disp('Energy of the signal:');
disp(E);
disp('Power of the signal:');
disp(P);