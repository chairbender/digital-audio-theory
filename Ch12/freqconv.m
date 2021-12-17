function y = freqconv(x,h)

N = length(x)+length(h)-1;

xfft = fft(x,N);
hfft = fft(h,N);  

yfft = xfft .* hfft;

y = ifft(yfft,N);