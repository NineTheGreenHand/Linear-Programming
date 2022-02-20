clear all; close all; clc;

% List n, m

n = 4;
m = 1;

% Set up

Z = zeros(n, n);                    % For given n, generate a matrix with Z_i_j values
coeff1 = zeros(n^2, n^2);           % Generate the first constraint coefficient 
                                    % for the constraints pair for block (i, j).

for i = 1:n
    vec = zeros(n, n^2);
    for j = 1:n
        count = 0;                  % initialize with 0 block attacking (i, j)
        temp = zeros(n, n);         % try to find all locations that attacks (i, j).
        temp(i, j) = -m;
        if i + 1 <= n               % test if (i+1,j+2), (i+1, j-2) exists
            if j + 2 <= n
                count = count + 1;
                temp(i+1, j+2) = 1;
            end
            if j - 2 >= 1
                count = count + 1;
                temp(i+1, j-2) = 1;
            end
        end
        if i - 1 >= 1               % test if (i-1, j+2), (i-1, j-2) exists
            if j + 2 <= n
                count = count + 1;
                temp(i-1, j+2) = 1;
            end
            if j - 2 >= 1
                count = count + 1;
                temp(i-1, j-2) = 1;
            end
        end
        if j + 1 <= n               % test if (i+2, j+1), (i-2, j+1) exists
            if i + 2 <= n
                count = count + 1;
                temp(i+2, j+1) = 1;
            end
            if i - 2 >= 1
                count = count + 1;
                temp(i-2, j+1) = 1;
            end
        end
        if j - 1 >= 1               % test if (i+2, j-1), (i-2, j-1) exists
            if i + 2 <= n
                count = count + 1;
                temp(i+2, j-1) = 1;
            end
            if i - 2 >= 1
                count = count + 1;
                temp(i-2, j-1) = 1;
            end
        end
        Z(i, j) = count;
        temp = reshape(temp', [1, n^2]);
        vec(j,:) = temp;
    end
    coeff1(n*i-(n-1):n*i, :) = vec;
end

% Generate the second constraint coefficient for the constraints pair for block (i, j).

coeff2 = coeff1;
upper = reshape(Z', [1, n^2]);  % This is the Z_i_j on the right hand side         
d = upper - m;
coeff2 = coeff2 - diag(diag(coeff2)) + diag(d);

% Get coefficient for the new constraint for speed up the computation

reminder = mod(n, 2);       % See if n is an even number of odd number
coeff3 = ones(1, n^2);
if reminder == 0            % Case for n is even
    v = ones(1, n^2/2);
    v(1, (n^2/2)+1:n^2) = 0;
    coeff3 = coeff3 - 2.*v;
end
if reminder == 1            % Case for n is odd
    f = floor(n/2);
    v = ones(1, (f+1)*n);
    v(1, (f+1)*n+1:n^2) = 0;
    coeff3 = coeff3 - 2.*v;
end

% Generate the lpsolve input file

lp = mxlpsolve('make_lp', 0, n^2);    

mxlpsolve('set_maxim', lp);                                 % Maximize
mxlpsolve('set_binary', lp, (1:n^2));                       % Set xi to be 0 or 1
mxlpsolve('set_obj_fn', lp, ones(1, n^2));                  % Set object fun

% Add constraints and name variables

for k = 1:n^2
    co1 = coeff1(k, :);
    co2 = coeff2(k, :);
    mxlpsolve('add_constraint', lp, co1, 2, 0);
    mxlpsolve('add_constraint', lp, co2, 1, upper(k));
end

% New constraint

mxlpsolve('add_constraint', lp, coeff3, 1, 0);

% Name x_ij

start = 1;
for i = 1:n
    for j = 1:n
        names{start} = strcat('x_', num2str(i), '_', num2str(j));
        start = start + 1;
    end
end
    
for i = 1:n^2
    mxlpsolve('set_col_name', lp, i, names{i});
end

% Write lpsolve input file

mxlpsolve('write_lp', lp, strcat('hw2_n', num2str(n), 'm', num2str(m), '.lp'));