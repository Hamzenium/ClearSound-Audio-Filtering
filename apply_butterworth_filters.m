% Read the audio file
[inputAudio, sampleRate] = audioread('music_noisy.wav'); % Load the noisy audio signal

% Define the Nyquist frequency
Nyquist = sampleRate / 2;

% Design a second-order stopband filter for frequencies around 1100 Hz
lowerCutoff1 = 1085; % Lower cutoff frequency for the first stopband
upperCutoff1 = 1115; % Upper cutoff frequency for the first stopband
[b1, a1] = butter(2, [lowerCutoff1/Nyquist, upperCutoff1/Nyquist], 'stop'); % Design the filter
filteredAudio1 = filtfilt(b1, a1, inputAudio); % Apply the filter to the input audio

% Design a second-order stopband filter for frequencies around 2750 Hz
lowerCutoff2 = 2735; % Lower cutoff frequency for the second stopband
upperCutoff2 = 2770; % Upper cutoff frequency for the second stopband
[b2, a2] = butter(2, [lowerCutoff2/Nyquist, upperCutoff2/Nyquist], 'stop'); % Design the filter
filteredAudio = filtfilt(b2, a2, filteredAudio1); % Apply the second filter to the output of the first filter

% Play the final filtered signal
sound(filteredAudio, sampleRate);

% Save the filtered audio to a new file
audiowrite('music_filtered_butterworth.wav', filteredAudio, sampleRate);
disp('Filtered audio saved as "music_filtered_butterworth.wav".');
