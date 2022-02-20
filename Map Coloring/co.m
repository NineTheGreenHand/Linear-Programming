function coeff = co(x, y, n)

co = zeros(n, n^2+n);
for i = 1:n
    co(i, (x-1)*n+i) = 1;
    co(i, (y-1)*n+i) = 1; 
end
coeff = co;

end

