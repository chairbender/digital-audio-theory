Fs = 44100;

y = karplus(440,Fs,0.8);
sound(y,Fs);