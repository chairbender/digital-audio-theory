function y = myconv(x,h)

# NOTE - this was taken basically directly from the book
# example 8_3_3, as instructed, but it runs SO slowly that I can't help
# but think it only runs well in Octave. This post and comment
# seem to indicate that Octave can do poorly in non-vectorized loops
# https://stackoverflow.com/a/12571347 and I don't feel like converting
# this to vectorized version
  
len = length(x)+length(h)-1;
y=zeros(len,1);

% for every possible shift amount
for n=0:len-1
    % for every k from 0 to n; except before complete overlap 
    % when we can stop at the length of h (the length of the filter)
    for k=0:min(length(h)-1,n)
	  % check to see if h has shifted beyond the bounds of x 
        if ((n-k)+1 < length(x))
            y(n+1) = y(n+1)+ h(k+1)*x((n-k)+1); 
        end
    end
end