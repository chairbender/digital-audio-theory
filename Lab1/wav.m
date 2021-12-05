[y,fs] = audioread("Lab1.wav");

figure;
subplot(1,2,1)
plot(y(:,1));

subplot(1,2,2);
plot(y(:,2));

player = audioplayer(y,44100);
play(player)