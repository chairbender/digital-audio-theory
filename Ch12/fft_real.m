[stereo,Fs] = audioread("snare_hit.wav");
x = stereo(:,1);
[stereoIR,Fs] = audioread("IR.wav");
h = stereoIR(:,1);

id = tic();
convd = conv(x,h);
toc(id)
# not calling myconv because it runs too slowly
#id = tic();
#myconvd = myconv(x,h);
#toc(id)
id = tic();
freqconvd = freqconv(x,h);
toc(id)

audiowrite("convd.wav",convd,Fs);
#audiowrite("myconvd.wav",myconvd,Fs);
audiowrite("freqconvd.wav",freqconvd,Fs);