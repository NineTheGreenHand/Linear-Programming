function transMatrix = transMatrix(limit)

n = limit + 1;      % Since we always include 0 as one of the states.
A = zeros(n, n);
A(n, n) = 1;
p = 1/6;            % Probability of getting one of the six sides of a dice.

for i = 1:limit
    for j = 1:6 
        % Refresh the score for all six possibilities
        score = i - 1;
        % Case the sum is prime number
        if isprime(score + j)
            if score + j >= limit
                A(i, n) = A(i, n) + p; 
            elseif score == 0
                score = score + j;
                A(i, score + 1) = A(i, score + 1) + p;
            else
                score = score - j;
                if score <= 0
                    A(i, 1) = A(i, 1) + p;
                else
                    A(i, score + 1) = A(i, score + 1) + p;
                end
            end
        % Case the sum is not prime number    
        else
            score = score + j;
            if score >= limit
                A(i, n) = A(i, n) + p;
            else
                A(i, score + 1) = A(i, score + 1) + p;
            end
        end
    end
end

transMatrix = A;

end

