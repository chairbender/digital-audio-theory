function y = myconf(x,h)
  
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