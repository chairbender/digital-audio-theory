Fs = 44100;
dt = 1/Fs;

# bandwidth hz
Fb = 500;
# normalized
B = 2*pi*Fb/Fs'
#pole radius
A = 1 - B/2;
# peak frequency
F0 = 5000;
# pole frequency
w0 = F0 / Fs*2*pi;
wx=acos(cos(w0)*2*A/(1+A^2));
# normalized amp
a0 = (1 - A^2)*sin(wx);
# Filter difference eqn
#y(n) = a0*x(n)-(-2*a*cos(wx))*y(n-1)-A^2*y(n-2);
# Xfer fn
#H(n) = a0 / (1 + (-2*A*cos(wx))z^-1 + A^2z^-2);

num = [a0];
den = [1,-2*A*cos(wx), A^2];
zero = roots(num);
pole = roots(den);

figure
subplot(1,2,1);
zplane(num, den);
subplot(1,2,2);
[~, F]=freqz(num,den,Fs,Fs);
[Grd,~]=grpdelay(num,den,Fs,Fs);
plot(F, Grd); grid on;

figure
freqz(num, den, Fs, Fs);



