# x(t)= A * sin(2*pi*f*t + phi)
Fs = 44100;
dt = 1/Fs;

Fcar = 700;
Acar = 0.3;
Fmod = 300;
Amod = 0.9;
Tdur = 2;

tvec = 0:dt:Tdur-dt; 

# NOTE: it's plus one because that's just how AM works -
# it is intended to modulate by a POSITIVE quantity, otherwise you get
# weird behavior because multiplying by negative flips the sign
am = Acar * (1 + Amod * cos(2*pi*Fmod*tvec)) .* cos(2*pi*Fcar*tvec);

#figure
#plot(tvec,am)

player = audioplayer(am,Fs);
play(player)

#audiowrite("amplitude_mod.wav",am,Fs);