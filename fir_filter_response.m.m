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

% Frequency response of the designed filter
[h, f] = freqz(filter_coefficients, 1, 1024, sampling_rate);

% Plot the magnitude response
figure;
plot(f, abs(h), 'b', 'LineWidth', 1.5); % Plot magnitude response
hold on;

% Add stopband ripple and passband ripple lines
yline(1 + ripple_tolerance(2), 'g--', 'Passband Ripple', 'LineWidth', 1.2);
yline(1 - ripple_tolerance(2), 'g--', 'LineWidth', 1.2);
yline(ripple_tolerance(1), 'r--', 'Stopband Ripple', 'LineWidth', 1.2);

% Customize the graph
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Response with Specifications');
legend('Magnitude Response', 'Stopband Ripple', 'Passband Ripple');
grid on;

% Display filter specifications
disp('Filter Specifications:');
disp(['Filter Coefficients: ', mat2str(filter_coefficients, 5)])
disp(['Order: ', num2str(filter_order)]);
disp(['Band Edges: ', mat2str(band_edges)]);
disp(['Amplitude: ', mat2str(amplitude)]);
disp(['Weights: ', mat2str(weights)]);
