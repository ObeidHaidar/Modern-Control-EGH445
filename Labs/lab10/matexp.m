function out = matexp(A,T,n)
%matexp Compute the matrix exponential using an approximation of order n
out=zeros(size(A));
for k=0:n
    out= out+((A*T)^k)/factorial(k);
end
end

