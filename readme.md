# ClearSound: A Signal Filtering and Noise Reduction Framework

ClearSound is a MATLAB-based framework designed to process and enhance audio signals by removing unwanted noise. The project employs advanced FIR and Butterworth filtering techniques, enabling clear and high-quality audio output. This repository provides all necessary scripts and instructions for analysis, filtering, and visualization.

## Features

- **FIR Filter Design**: Leverage the Parks-McClellan algorithm to create custom FIR filters.
- **Butterworth Filters**: Implement precise stopband filtering using second-order Butterworth filters.
- **Audio Spectrum Analysis**: Examine noisy audio signals using FFT and spectrograms.
- **Output Comparison**: Visualize and compare the effectiveness of FIR and Butterworth filtering techniques.

## Scripts Description

### 1. **fir_filter_design.m**
- **Purpose**: Designs a Finite Impulse Response (FIR) filter using the Parks-McClellan algorithm.
- **Outputs**: 
  - Filter coefficients
  - Frequency response plot

### 2. **fir_filter_response.m**
- **Purpose**: Visualizes the FIR filter’s magnitude response and highlights ripple specifications.
- **Outputs**: 
  - Magnitude response plot
  - Ripple annotations for passband and stopband

### 3. **analyze_noisy_signal.m**
- **Purpose**: Analyzes the frequency spectrum of the noisy audio signal using FFT and spectrogram.
- **Dependencies**: `data/noisy_audio.wav`
- **Outputs**: 
  - Frequency spectrum plot
  - Spectrogram plot

### 4. **apply_fir_filters.m**
- **Purpose**: Designs and applies two FIR filters to remove noise from specific frequencies.
- **Dependencies**: `data/noisy_audio.wav`
- **Outputs**: 
  - Filtered audio saved as `results/filtered_audio_fir.wav`
  - Ripple specifications plot

### 5. **apply_butterworth_filters.m**
- **Purpose**: Implements second-order Butterworth filters to attenuate unwanted noise.
- **Dependencies**: `data/noisy_audio.wav`
- **Outputs**: 
  - Filtered audio saved as `results/filtered_audio_butter.wav`

### 6. **compare_filtered_signals.m**
- **Purpose**: Compares the magnitude spectra of audio files filtered using FIR and Butterworth techniques.
- **Dependencies**: 
  - `results/filtered_audio_fir.wav`
  - `results/filtered_audio_butter.wav`
- **Outputs**: 
  - Comparison plots

## How to Use

1. **Setup**: Place the input noisy audio file (`noisy_audio.wav`) in the `data/` folder.
2. **Execution**: Run the scripts sequentially in MATLAB:
   - Start with `fir_filter_design.m` to design the filter.
   - Use `fir_filter_response.m` to validate the filter’s performance.
   - Analyze the noisy signal using `analyze_noisy_signal.m`.
   - Apply FIR filters with `apply_fir_filters.m`.
   - Use `apply_butterworth_filters.m` for Butterworth filtering.
   - Compare results with `compare_filtered_signals.m`.
3. **Output**: Filtered audio and visualizations will be saved in the `results/` folder.

## Requirements

- MATLAB (R2021b or later recommended)
- Audio Processing Toolbox (optional for some functions)

## Outputs

- **Filtered Audio**:
  - `filtered_audio_fir.wav`: FIR-filtered audio
  - `filtered_audio_butter.wav`: Butterworth-filtered audio
- **Visualizations**:
  - Frequency response plots
  - Spectrum analysis plots
  - Filter comparison plots

## Notes

- Adjust file paths in scripts if the folder structure is changed.
- Ensure a configured sound system for audio playback.
- Scripts are optimized for reproducibility and modularity.

## Contact

For questions, feedback, or contributions, please contact [Your Name or Email].

