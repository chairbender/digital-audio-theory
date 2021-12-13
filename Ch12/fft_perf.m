Fs = 44100;
dt = 1/Fs;

[stereo,Fs] = audioread("Lab1.wav");
x = stereo(1:Fs*3,1)';


