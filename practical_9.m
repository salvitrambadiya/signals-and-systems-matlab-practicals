% Experiment 9: Z-Transform and Region of Convergence (ROC)
clc;
clear all;
close all;

% Part 1: Right-sided sequence x[n] = (0.5)^n u[n]
% X(z) = z/(z - 0.5),  ROC: |z| > 0.5
b1 = [1 0];
a1 = [1 -0.5];
plot_roc(b1,a1,0.5,Inf,'x[n] = (0.5)^n u[n],  ROC: |z| > 0.5');

% Part 2: Left-sided sequence x[n] = -(0.5)^n u[-n-1]
% X(z) = z/(z - 0.5),  ROC: |z| < 0.5
plot_roc(b1,a1,0,0.5,'x[n] = -(0.5)^n u[-n-1],  ROC: |z| < 0.5');

% Part 3: Two-sided sequence x[n] = (0.5)^n u[n] - (2)^n u[-n-1]
% X(z) = z/(z - 0.5) + z/(z - 2),  ROC: 0.5 < |z| < 2
b3 = [2 -2.5 0];
a3 = poly([0.5 2]);
plot_roc(b3,a3,0.5,2,'x[n] = (0.5)^n u[n] - (2)^n u[-n-1],  ROC: 0.5 < |z| < 2');

% Function: plots pole-zero diagram and shaded ROC for X(z) = B(z)/A(z)
% (local functions must be at the end of a script file)
function plot_roc(b,a,r_in,r_out,name)
lim = 3;                                   % Display limit of the z-plane
if isinf(r_out)
    r_out = lim;
end
th = linspace(0,2*pi,400);
zeros_z = roots(b);
poles_z = roots(a);

figure;
hold on;
fill([r_out*cos(th), r_in*cos(fliplr(th))], ...
    [r_out*sin(th), r_in*sin(fliplr(th))], [0.8 0.9 1], 'EdgeColor','none');
plot(cos(th),sin(th),'k--');
plot(real(zeros_z),imag(zeros_z),'bo','MarkerSize',8,'LineWidth',1.5);
plot(real(poles_z),imag(poles_z),'rx','MarkerSize',10,'LineWidth',1.5);
axis equal;
xlim([-lim lim]);
ylim([-lim lim]);
grid on;
title(name);
xlabel('Real part');
ylabel('Imaginary part');
legend('ROC','Unit circle','Zeros','Poles','Location','northeast');
end