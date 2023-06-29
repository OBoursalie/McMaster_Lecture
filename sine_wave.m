%IBEHS 3A03 "Fourier Analysis and Filtering of Biomedical Signals"
%Generate sine wave in time and frequency domain
clear all, close all, clc

%%Time specifications:
A = 1;
Fc = 1;                     % hertz

Fs = 500;                    %500 samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1.28;             % seconds
t = (0:dt:StopTime-dt)';     % seconds

%%Sine wave
x = A*sin(2*pi*Fc*t);
L = length(x); %Number of samples
num_samples = (0:1:L-1)';

% Plot the signal versus time:
figure;

%plot(t,x,'LineWidth',2.0,'Color', 'b');
plot(num_samples,x,'LineWidth',2.0,'Color', 'b');
%plot(t,x,'LineWidth',2.0,'Color', 'r');
%plot(t,x,'LineWidth',2.0,'Color', [0.9290 0.6940 0.1250]);
xlim([0 L-1])
ylim([-1 1])
xtickformat('%.1f')


title('Discrete Signal (Time Domain)');
ylabel('x[n] (V)');
xlabel('n');
zoom xon;
grid on;

set(gcf, 'PaperUnits', 'inches');
x_width=4.5;
y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
print(gcf, '-dtiff', 'time1.tiff');

Y = fft(x);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure;
stem(f,P1,'filled','MarkerSize',3,'Color', 'b');
%stem(f,P1,'filled','MarkerSize',3,'Color', 'r');
%stem(f,P1,'filled','MarkerSize',3,'Color', [0.9290 0.6940 0.1250]);
title("Frequency Domain");
ylim([0 1]);
xlabel("k (Hz)");
ylabel("|X_k|");
grid on;

set(gcf, 'PaperUnits', 'inches');
x_width=4.5;
y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
print(gcf, '-dtiff', 'freq1.tiff');