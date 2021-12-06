# x(t)= A * sin(2*pi*f*t + phi)
Fs = 44100;
dt = 1/Fs;

Fcar = 700;
Acar = 0.3;
Fmod = 300;
Amod = 0.9;
Tdur = .01;

tvec = 0:dt:Tdur-dt; 

fm = Acar * cos(2*pi*Fcar*tvec + Amod * cos(2*pi*Fmod*tvec));

figure
plot(tvec,fm)

#player = audioplayer(fm,Fs);
#play(player)

#audiowrite("frequency_mod.wav",fm,Fs);