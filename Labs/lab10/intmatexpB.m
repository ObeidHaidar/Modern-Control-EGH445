function H = intmatexpB(A,B,T,n)
%intmatexpB Computes H using an approximation of order n for the matrix exponential
G=zeros(size(A));
for k=0:n
    G= G+((A^k)*((T^(k+1))/(k+1)))/factorial(k);
end
H=G*B;
end

% function H = intmatexpB(A,B,T,n)
% %intmatexpB Computes H using an approximation of order n for the matrix exponential
% G=zeros(size(A));
% for k=0:n
%     G= G+((A*T)^k)/factorial(k);
% end
% H=inv(A)*(G-eye(length(G)))*B;
% end
