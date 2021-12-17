Fs = 44100;
dt = 1/Fs;

scale = 0.01;

[stereo,Fs] = audioread("Lab1.wav");
x = stereo(1:Fs*scale,1);
h = stereo(Fs*scale:(Fs*scale+length(x)-1),1);

convd = conv(x,h);
myconvd = myconv(x,h);
freqconvd = freqconv(x,h);

rms(convd - myconvd)
rms(convd - freqconvd)


