[wav,fs] = audioread("amplitude_mod.wav");

Fs = 44100;
dt = 1/Fs;
Fsig = 440;
Tdur = audioinfo("amplitude_mod.wav").Duration;
Fmod = 1;
Amod = 0.3;

tvec = 0:dt:Tdur-dt; 
am = (1 + Amod * cos(2*pi*Fmod*tvec))' .* wav;

scale = max(abs(am));

scaled = scale .* am;

audiowrite("tremolo_am.wav",scaled,Fs);

#player = audioplayer(scaled, Fs);
#play(player)