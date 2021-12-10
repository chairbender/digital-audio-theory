function y = karplus(F, Fs, a)
% y = karplus(F, Fs, a)
% generate Karplus strong with frequency F, sample rate Fs, 
% and brightness a

L = round(Fs/F);
dt = 1/Fs;
Tdur=5;
tvec = 0:dt:Tdur-dt;
d = 0.99;
y = zeros(length(tvec),1);
x = (rand(L,1) - .5)';

# This might be sub-optimal or slightly wrong as it doesn't seem to
# match the exercise description where it suggests storing
# filter output in x, but it does sound like a pluck
for n = 1:length(y)
  # Might be off by one
  if (n <= L)
    y(n) = x(n);
  else
    y(n) = d * (a*y(n-L) + (1 - a) * y(max(1,n-L-1)));    
  endif
end