Tmax = 6;
Fmin=100;
Fmax = 1000;
fs=2000;

t=0:1/fs:Tmax;
y=chirp(t,Fmin,Tmax,Fmax);
specgram(y,128,fs);
sound(y,fs)