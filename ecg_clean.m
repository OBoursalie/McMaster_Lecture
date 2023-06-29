%IBEHS 3A03 "Fourier Analysis and Filtering of Biomedical Signals"
%Clean ECG Signal
%Modified code from Sannino, Giovanna, and Giuseppe De Pietro. "A deep learning approach for ECG-based heartbeat classification for arrhythmia detection." Future Generation Computer Systems 86 (2018): 446-455. 
%ECG Data from Moody GB, Mark RG. The impact of the MIT-BIH Arrhythmia Database. IEEE Eng in Med and Biol 20(3):45-50 (May-June 2001). (PMID: 11446209) 

clear all, close all, clc

load('101m.mat')      % input signal data to 'val' variable
val = (val - 0)/200;                % removing "base" and "gain"
sig = val(1,1:3600);                % choosing Lead 1 (V1) data and 3600 datapoints (first 10 secs)
Fs = 360;                           % sampling frequecy
Fn = Fs/2;                          % Nyquist frequency
t = (0:length(sig)-1)/Fs;           % time

% Plot signal before processing
figure(1)
plot(t, sig, 'LineWidth', 2);
xlabel("Time (s)")
ylabel("ECG Amplitude (mV)")
grid

Ts = 1/Fs;
% Time vector

fNoise = 50;    % Frequency [Hz]
aNoise = 0.25;  % Amplitude
noise  = aNoise*sin(2*pi.*t.*fNoise);

signalNoise = sig;

figure(1)
plot(t, signalNoise, 'LineWidth', 2);
xlabel("Time (s)")
ylabel("ECG Amplitude (mV)")
grid

x=signalNoise;
L = length(signalNoise); %Number of samples
num_samples = (0:1:L-1)';

% Plot the signal versus time:
figure;
%plot(t,x,'LineWidth',2.0,'Color', 'k');
plot(num_samples,x,'LineWidth',2.0,'Color', 'b');
%xlim([0 StopTime-dt])
xlim([0 L-1])
ylim([-1 2])
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
print(gcf, '-dtiff', 'time_ecg.tiff');

Y = fft(signalNoise);

L = length(signalNoise); %Number of samples

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
f = 0:1:L/2;

figure;
stem(f,P1,'filled','MarkerSize',3,'Color', 'b');
title("Frequency Domain");
ylim([0 0.5]);
xlim([0 L/2]);
%xticks(0:5:50);
xlabel("k");
ylabel("|X_k|");
grid on;

set(gcf, 'PaperUnits', 'inches');
x_width=4.5;
y_width=2;
set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
print(gcf, '-dtiff', 'freq_ecg.tiff');


