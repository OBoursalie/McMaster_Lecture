%IBEHS 3A03 "Fourier Analysis and Filtering of Biomedical Signals"
%Generate three sine waves and add together in time and generate frequency domain
clear all, close all, clc

%%Time specifications:
A = 1;
Fc = 1;                     % hertz

Fs = 500;  %500                 % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1.28;             % seconds
t = (0:dt:StopTime-dt)';     % seconds

%%Sine wave
x1 = A*sin(2*pi*Fc*t);

A = 0.5;
Fc = 5;                     % hertz

Fs = 500;  %500                 % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1.28;             % seconds
t = (0:dt:StopTime-dt)';     % seconds

%%Sine wave
x2 = A*sin(2*pi*Fc*t);

A = 0.25;
Fc = 40;                     % hertz

Fs = 500;  %500                 % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1.28;             % seconds
t = (0:dt:StopTime-dt)';     % seconds

%%Sine wave
x3 = A*sin(2*pi*Fc*t);

x=x1+x2+x3;
L = length(x); %Number of samples
num_samples = (0:1:L-1)';

% Plot the signal versus time:
figure;
%plot(t,x,'LineWidth',2.0,'Color', 'k');
plot(num_samples,x,'LineWidth',2.0,'Color', 'k');
%xlim([0 StopTime-dt])
xlim([0 L-1])
ylim([-2 2])
%xtickformat('%.1f')
%xticks(0:0.1:StopTime-dt)

title('Time Domain');
ylabel('x[n] (V)');
xlabel('n');
zoom xon;
grid on;

set(gcf, 'PaperUnits', 'inches');
x_width=4.5;
y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
print(gcf, '-dtiff', 'time_cmb.tiff');

Y = fft(x);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
f = 0:1:L/2;

figure;
stem(f,P1,'filled','MarkerSize',3,'Color', 'k');
title("Frequency Domain");
ylim([0 1]);
xlim([0 L/2]);
%xticks(0:5:50);
xlabel("k");
ylabel("|X_k|");
grid on;

set(gcf, 'PaperUnits', 'inches');
x_width=4.5;
y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
print(gcf, '-dtiff', 'freq_cmb.tiff');