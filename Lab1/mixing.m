[wav,fs] = audioread("Lab1.wav");

Fs = 44100;
dt = 1/Fs;
Fsig = 440;
Tdur = audioinfo("Lab1.wav").Duration;

tvec = 0:dt:Tdur-dt; 
a = 0.2 * sin(2*pi*Fsig*tvec);
at = a';

combined = [at + wav(:,1), at + wav(:,2)];

scale = max(abs(combined));

scaled = scale .* combined;

audiowrite("Mixed.wav",scaled,Fs);

#player = audioplayer(scaled, Fs);
#play(player)
