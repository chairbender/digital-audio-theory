function Q = quantBits(input, N, A)
% Q = quantBits(input, N, A)
% This function quantizes the input according to the bit depth N for a 
% signal with dynamic range A
q = (A-(-A))/2^N;
Q = round(input/q)*q;