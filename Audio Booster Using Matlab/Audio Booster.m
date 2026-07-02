clc;
clear;
close all;

[file, path] = uigetfile({'*.wav;*.mp3'}, 'Select an Audio File');

if isequal(file,0)
    disp('No file selected');
    return;
end

[audio, Fs] = audioread(fullfile(path, file));

disp('Audio File Loaded Successfully');

sound(audio, Fs);

pause(length(audio)/Fs + 2);

gain = 10;

boosted_audio = gain * audio;

max_value = max(abs(boosted_audio));

boosted_audio = 0.9 * boosted_audio / max_value;

disp('Playing Boosted Audio...');
sound(boosted_audio, Fs);

t = (0:length(audio)-1)/Fs;

figure;

subplot(2,1,1);
plot(t, audio);
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, boosted_audio);
title('Boosted Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

audiowrite('boosted_audio.wav', boosted_audio, Fs);

disp('Boosted Audio Saved Successfully');
