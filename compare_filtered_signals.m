% Read the first filtered audio file
[y1, fs1] = audioread('music_filtered_adjusted.wav');
n1 = length(y1); % Number of samples
Y1 = fft(y1);    % Compute the FFT
f1 = (0:n1-1)*(fs1/n1); % Frequency axis
magnitude1 = abs(Y1); % Magnitude of the FFT

% Plot the magnitude spectrum for the first file
figure;
plot(f1(1:floor(n1/2)), magnitude1(1:floor(n1/2)), 'b', 'LineWidth', 1.5);
title('Magnitude Spectrum of Filtered Adjusted Audio');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Read the second filtered audio file
[y2, fs2] = audioread('music_filtered_butterworth.wav');
n2 = length(y2); % Number of samples
Y2 = fft(y2);    % Compute the FFT
f2 = (0:n2-1)*(fs2/n2); % Frequency axis
magnitude2 = abs(Y2); % Magnitude of the FFT

% Plot the magnitude spectrum for the second file
figure;
plot(f2(1:floor(n2/2)), magnitude2(1:floor(n2/2)), 'r', 'LineWidth', 1.5);
title('Magnitude Spectrum of Butterworth Filtered Audio');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
