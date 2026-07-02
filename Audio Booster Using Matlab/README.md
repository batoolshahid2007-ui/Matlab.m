# Audio Booster Using MATLAB

A script that loads an audio file, amplifies its amplitude by a fixed gain, normalizes the output to prevent clipping, and plots the comparative waveforms.

## Program Workflow

The code executes the following linear pipeline natively in MATLAB:
1. **File Selection:** Opens a UI dialog box supporting `.wav` and `.mp3` files.
2. **Audio Ingestion:** Reads the audio vector and its sampling frequency (`Fs`).
3. **Reference Playback:** Plays the original audio sequence.
4. **Amplitude Scaling:** Applies a fixed multiplication factor (`gain = 10`) to the audio array.
5. **Peak Normalization:** Computes the absolute maximum peak (`max_value`) and dynamically scales the boosted signal down to a `0.9` ceiling threshold to prevent digital distortion.
6. **Output Playback:** Plays the normalized boosted tracking sequence.
7. **Time-Domain Plotting:** Generates a dual-subplot figure visualizing Time vs. Amplitude for both the Original Audio Signal and the Boosted Audio Signal.
8. **File Export:** Writes and saves the final processed matrix as `boosted_audio.wav`.

## Code Execution Requirements

### Prerequisites
- MATLAB environment.
- A standard `.wav` or `.mp3` audio sample for testing.

### Operational Steps
1. Open the script file in MATLAB.
2. Run the script.
3. Select your input audio file via the file browser prompt.
4. Monitor the command window log displays and analyze the generated waveform plot figure.
