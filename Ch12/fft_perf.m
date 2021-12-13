Fs = 44100;
dt = 1/Fs;

[stereo,Fs] = audioread("Lab1.wav");
x = stereo(1:Fs*3,1)';

% for every possible shift amount
for n=0:len-1 
    % for every k from 0 to n; except before complete overlap 
    % when we can stop at the length of h (the length of the filter)
    for k=0:min(length(h)-1,n)
	  % check to see if h has shifted beyond the bounds of x 
        if ((n-k)+1 < length(x))
		% +1 in every array argument since Matlab sequences start
		% at index 1 (and not 0, like other programming languages)
            y(n+1) = y(n+1)+ h(k+1)*x((n-k)+1); 
        end
    end
end
