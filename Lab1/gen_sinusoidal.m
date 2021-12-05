# x(t)= A * sin(2*pi*f*t + phi)
Fs = 44100;
dt = 1/Fs;
Fsig = 440;
Tdur = 3;

tvec = 0:dt:Tdur-dt; 
x = 0.2 * sin(2*pi*Fsig*tvec);
z = 0.1 * sin(2*pi*500*tvec + 0.5*pi);

figure
subplot(1,3,1);
plot(tvec,x)
xlabel("Time (s)");
ylabel("Amplitude (V)");

subplot(1,3,2);
plot(tvec,z);
xlabel("Time (s)");
ylabel("Amplitude (V)");

subplot(1,3,3);
plot(tvec,x+z);
xlabel("Time (s)");
ylabel("Amplitude (V)");

player = audioplayer(x+z,Fs);
play(player)