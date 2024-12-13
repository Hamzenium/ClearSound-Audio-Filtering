% Define frequency band edges (normalized to Nyquist frequency)
freq_edges = [500, 1500, 2000, 3000];
% Desired amplitude for each band (0: stopband, 1: passband)
desired_response = [0 1 0];
% Maximum allowable ripple in each band
ripple_tolerance = [0.01 0.01 0.001];
% Sampling frequency (Hz)
sampling_rate = 8000;

% Normalize frequencies to Nyquist (fs/2)
normalized_freq = freq_edges / (sampling_rate / 2);

% Estimate the required filter order and other parameters
[filter_order, band_edges, amplitude, weights] = firpmord(normalized_freq, desired_response, ripple_tolerance);

% Design the FIR filter using Parks-McClellan algorithm
filter_coefficients = firpm(filter_order, band_edges, amplitude, weights);

% Visualize the frequency response of the designed filter
figure; % Open a new figure window
freqz(filter_coefficients, 1, 1024, sampling_rate); % Plot response with additional control over resolution
title('Frequency Response of Designed FIR Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

% Display filter specifications
disp('Filter Specifications:');
disp(['Filter Coefficients: ', mat2str(filter_coefficients, 5)])
disp(['Order: ', num2str(filter_order)]);
disp(['Band Edges: ', mat2str(band_edges)]);
disp(['Amplitude: ', mat2str(amplitude)]);
disp(['Weights: ', mat2str(weights)]);