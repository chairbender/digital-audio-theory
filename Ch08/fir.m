#[stereo,Fs] = audioread("Lab1.wav");
#x = stereo(:,1)';

Fs = 44100;
dt = 1/Fs;
a0 = 0.5;
a1 = -0.5;
a2 = 0.5;

# observation (from specgram) - with a0 = a1 = 0.5, it's a low pass
# changing a1 to -0.5 and its a high pass
# with my a2 addition it seems to become a band reject

Tdur=2;
tvec = 0:dt:Tdur-dt;
# white noise in range +- 1
x = ((rand(length(tvec),1) - 0.5)*2)';
x = x(1:length(tvec));

xnml = [0, x, 0];
xnm2 = [0, 0, x];
x = [x, 0, 0];

y = a0 * x + a1 * xnml + a2 * xnm2;

sound(x,Fs)
sound(y,Fs)

#{
figure
subplot(1,2,1)
plot(x)
subplot(1,2,2)
plot(y)
#}
figure
subplot(1,2,1)
specgram(x,128,Fs);
subplot(1,2,2)
specgram(y,128,Fs);