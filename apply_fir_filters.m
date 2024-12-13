[x1, fs1] = audioread('music_noisy.wav');

% Designing filter 1 to remove frequency
F1 = [1090 1098 1102 1112]; % frequency bands (in Hz)
A1 = [1 0 1];               % Desired response (1 for passband, 0 for stopband)
Dev1 = [0.05 0.01 0.05];    % Adjusted allowable ripple deviations
[N1, Fi1, Ai1, W1] = firpmord(F1, A1, Dev1, fs1);
h1 = firpm(N1, Fi1, Ai1, W1);

% Apply Filter 1 using convolution
y1 = filter(h1, 1, x1);

% Designing filter 2 to remove frequency near 2760 Hz (slightly adjusted bands)
F2 = [2745 2753 2763 2770]; % frequency bands (in Hz)
A2 = [1 0 1];               % Desired response (1 for passband, 0 for stopband)
Dev2 = [0.05 0.01 0.05];    % Adjusted allowable ripple deviations
[N2, Fi2, Ai2, W2] = firpmord(F2, A2, Dev2, fs1);
h2 = firpm(N2, Fi2, Ai2, W2);

% Apply Filter 2 using convolution
y2 = filter(h2, 1, y1);

% Play the filtered signal
sound(y2, fs1);

% Save the filtered audio
audiowrite('music_filtered_adjusted.wav', y2, fs1);
disp('Filtered audio saved as "music_filtered_adjusted.wav".');
