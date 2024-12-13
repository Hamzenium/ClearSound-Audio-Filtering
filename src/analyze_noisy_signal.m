% Load the noisy signal
[noisy_signal, fs] = audioread('music_noisy.wav');

% Compute and plot the frequency spectrum using FFT
n = length(noisy_signal); % Length of the signal
frequencies = (0:floor(n / 2) - 1) * (fs / n); % Frequency bins (up to Nyquist frequency)
spectrum = abs(fft(noisy_signal)) / n; % Normalized magnitude of FFT
single_sided_spectrum = spectrum(1:floor(n / 2)); % Single-sided spectrum

% Plot the single-sided frequency spectrum
figure;
plot(frequencies, single_sided_spectrum, 'LineWidth', 1.5);
title('Frequency Spectrum of Noisy Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Spectrogram for time-frequency analysis
figure;
spectrogram(noisy_signal, 256, 250, 256, fs, 'yaxis');
title('Spectrogram of Noisy Signal');
xlabel('Time (s)');
ylabel('Frequency (Hz)');

% Play the noisy signal (ensure volume is low to avoid loud noises)
disp('Playing noisy signal... Adjust volume if needed.');
sound(noisy_signal, fs);
