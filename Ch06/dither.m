Fs = 44100;
dt = 1/Fs;
Tdur = 3;
tvec = 0:dt:Tdur-dt;

tone = sin(2*pi*500*tvec);

# Observation
# 8 - slight high frequency noise
# 4 - stronger high frequency noise, sounding more like a square
# 2 - even more square-like with high-freq noise more prominent
#{
bitDepth = 8;
quantized = quantBits(tone,bitDepth,1);
sound(quantized,Fs);
#}

plotTone = tone(1:300);
#{
figure
subplot(1,4,1)
plot(plotTone)
subplot(1,4,2)
plot(quantBits(plotTone,8,1))
subplot(1,4,3)
plot(quantBits(plotTone,4,1))
subplot(1,4,4)
plot(quantBits(plotTone,2,1))
#}

#{
subplot(1,2,1)
plot(plotTone)
subplot(1,2,2)
plot(quantBits(plotTone,1,1))
#}

tone2 = 0.4 * sin(2*pi*500*tvec);
plotTone2 = tone2(1:300);

#{
subplot(1,2,1)
plot(plotTone2)
subplot(1,2,2)
plot(quantBits(plotTone2,1,1))
#}

r = rand(length(tone2),1) - .5;

ditherTone2 = r' + tone2;
plotDitherTone2 = ditherTone2(1:300);


#{
figure
subplot(1,2,1)
plot(plotTone2)
subplot(1,2,2)
plot(quantBits(plotDitherTone2,1,1))
#}


#sound(tone,Fs);
#sound(quantBits(tone,8,1),Fs);
#sound(quantBits(tone,4,1),Fs);
#sound(quantBits(tone,2,1),Fs);
#sound(tone2,Fs);
sound(quantBits(ditherTone2,1,1),Fs);



#{ 
2 benefits of dithering - 
 1. tone2 became actually audible 
 2. As opposed to the 2-bit-depth 1-amplitude tone, this is the main benefit of
 dithering being shown. In the original 2-bit depth 1 Amp tone, there is
 a perceptible distortion, like a 2nd HF tone due to the noise floor modulating with
 the original tone.
 In the dithering case, the noise floor is much less correlated with the original
 signal thus is less perceptible as a 2nd HF tone - sounds like "noise". However,
 there is still SOME coupling with the signal, it is just much less.
#}

# note that this generates a TPDF distribution, but does NOT
# improve upon RPDF - the key with TPDF dither is differencing
# the dither with itself
#r1 = rand(length(tone2),1).*2 - 1;
#r2 = rand(length(tone2),1).*2 - 1;
#rtpdf = (r1 + r2) ./ 2;

# backwards differencing to generate TPDF from RPDF dither
d_tri = zeros(size(r));
d_tri(1) = r(1);
d_tri(2:end) = r(2:end) - r(1:end-1);



figure
hist(d_tri, linspace(-1, 1,50));
xlim([-1,1])

tpdfTone2 = d_tri' + tone2;
plotTpdfTone2 = tpdfTone2(1:300);

figure
subplot(1,3,1)
plot(plotTone2)
subplot(1,3,2)
plot(quantBits(plotDitherTone2,1,1))
subplot(1,3,3)
plot(quantBits(plotTpdfTone2,1,1))

# the noise is higher pitched, as expected with TPDF dither -
# backwards differencing is increasing the HF characteristic of the dither noise
sound(quantBits(tpdfTone2,1,1),Fs);


