clear all; close all; clc;

% Set up

n = 18;

% Coefficient for object function

co_obj = zeros(1, n^2);
co_obj(1, n^2+1:n^2+n) = ones(1, n);

% Coefficient for first constraint

co1 = zeros(n, n^2+n);
for i = 1:n
   co1(i, (i-1)*n+1:i*n) = ones(1, n);
end

% Coefficient for second constraint

co2 = zeros(n^2, n^2+n);

for i = 1:n
    co2((i-1)*n+1:i*n, n^2+i) = -1;
    for j = 1:n
        co2((i-1)*n+j, (j-1)*n+i) = 1;
    end
end

% Coefficient for third constraint
% Since (1, 2) and (2, 1) are the same, we only consider unique edges.
 
% For edge (1, 2)

x = 1; y = 2;
co3_1 = zeros(n, n^2+n);
for i = 1:n
    co3_1(i, (x-1)*n+i) = 1;
    co3_1(i, (y-1)*n+i) = 1;
end

% For edge (2, 3)

x = 2; y = 3;
co3_2 = zeros(n, n^2+n);
for i = 1:n
    co3_2(i, (x-1)*n+i) = 1;
    co3_2(i, (y-1)*n+i) = 1;
end

% For edge (3, 4)

x = 3; y = 4;
co3_3 = zeros(n, n^2+n);
for i = 1:n
    co3_3(i, (x-1)*n+i) = 1;
    co3_3(i, (y-1)*n+i) = 1;
end

% For edge (2, 4)

x = 2; y = 4;
co3_4 = zeros(n, n^2+n);
for i = 1:n
    co3_4(i, (x-1)*n+i) = 1;
    co3_4(i, (y-1)*n+i) = 1;
end

% For edge (2, 5)

x = 2; y = 5;
co3_5 = zeros(n, n^2+n);
for i = 1:n
    co3_5(i, (x-1)*n+i) = 1;
    co3_5(i, (y-1)*n+i) = 1;
end

% For edge (2, 6)

x = 2; y = 6;
co3_6 = zeros(n, n^2+n);
for i = 1:n
    co3_6(i, (x-1)*n+i) = 1;
    co3_6(i, (y-1)*n+i) = 1;
end

% For edge (1, 6)

x = 1; y = 6;
co3_7 = zeros(n, n^2+n);
for i = 1:n
    co3_7(i, (x-1)*n+i) = 1;
    co3_7(i, (y-1)*n+i) = 1;
end

% For edge (6, 7)

x = 6; y = 7;
co3_8 = zeros(n, n^2+n);
for i = 1:n
    co3_8(i, (x-1)*n+i) = 1;
    co3_8(i, (y-1)*n+i) = 1;
end

% For edge (7, 8)

x = 7; y = 8;
co3_9 = zeros(n, n^2+n);
for i = 1:n
    co3_9(i, (x-1)*n+i) = 1;
    co3_9(i, (y-1)*n+i) = 1;
end

% For edge (6, 9)

x = 6; y = 9;
co3_10 = zeros(n, n^2+n);
for i = 1:n
    co3_10(i, (x-1)*n+i) = 1;
    co3_10(i, (y-1)*n+i) = 1;
end

% For edge (6, 8)

x = 6; y = 8;
co3_11 = zeros(n, n^2+n);
for i = 1:n
    co3_11(i, (x-1)*n+i) = 1;
    co3_11(i, (y-1)*n+i) = 1;
end

% For edge (4, 5)

x = 4; y = 5;
co3_12 = zeros(n, n^2+n);
for i = 1:n
    co3_12(i, (x-1)*n+i) = 1;
    co3_12(i, (y-1)*n+i) = 1;
end

% For edge (5, 6)

x = 5; y = 6;
co3_13 = zeros(n, n^2+n);
for i = 1:n
    co3_13(i, (x-1)*n+i) = 1;
    co3_13(i, (y-1)*n+i) = 1;
end

% For edge (5, 9)

x = 5; y = 9;
co3_14 = zeros(n, n^2+n);
for i = 1:n
    co3_14(i, (x-1)*n+i) = 1;
    co3_14(i, (y-1)*n+i) = 1;
end

% For edge (5, 10)

x = 5; y = 10;
co3_15 = zeros(n, n^2+n);
for i = 1:n
    co3_15(i, (x-1)*n+i) = 1;
    co3_15(i, (y-1)*n+i) = 1;
end

% For edge (5, 11)

x = 5; y = 11;
co3_16 = zeros(n, n^2+n);
for i = 1:n
    co3_16(i, (x-1)*n+i) = 1;
    co3_16(i, (y-1)*n+i) = 1;
end

% For edge (4, 11)

x = 4; y = 11;
co3_17 = zeros(n, n^2+n);
for i = 1:n
    co3_17(i, (x-1)*n+i) = 1;
    co3_17(i, (y-1)*n+i) = 1;
end

% For edge (4, 12)

x = 4; y = 12;
co3_18 = zeros(n, n^2+n);
for i = 1:n
    co3_18(i, (x-1)*n+i) = 1;
    co3_18(i, (y-1)*n+i) = 1;
end

% For edge (8, 9)

x = 8; y = 9;
co3_19 = zeros(n, n^2+n);
for i = 1:n
    co3_19(i, (x-1)*n+i) = 1;
    co3_19(i, (y-1)*n+i) = 1;
end

% For edge (8, 15)

x = 8; y = 15;
co3_20 = zeros(n, n^2+n);
for i = 1:n
    co3_20(i, (x-1)*n+i) = 1;
    co3_20(i, (y-1)*n+i) = 1;
end

% For edge (9, 10)

x = 9; y = 10;
co3_21 = zeros(n, n^2+n);
for i = 1:n
    co3_21(i, (x-1)*n+i) = 1;
    co3_21(i, (y-1)*n+i) = 1;
end

% For edge (9, 14)

x = 9; y = 14;
co3_22 = zeros(n, n^2+n);
for i = 1:n
    co3_22(i, (x-1)*n+i) = 1;
    co3_22(i, (y-1)*n+i) = 1;
end

% For edge (9, 15)

x = 9; y = 15;
co3_23 = zeros(n, n^2+n);
for i = 1:n
    co3_23(i, (x-1)*n+i) = 1;
    co3_23(i, (y-1)*n+i) = 1;
end

% For edge (10, 11)

x = 10; y = 11;
co3_24 = zeros(n, n^2+n);
for i = 1:n
    co3_24(i, (x-1)*n+i) = 1;
    co3_24(i, (y-1)*n+i) = 1;
end

% For edge (10, 12)

x = 10; y = 12;
co3_25 = zeros(n, n^2+n);
for i = 1:n
    co3_25(i, (x-1)*n+i) = 1;
    co3_25(i, (y-1)*n+i) = 1;
end

% For edge (10, 14)

x = 10; y = 14;
co3_26 = zeros(n, n^2+n);
for i = 1:n
    co3_26(i, (x-1)*n+i) = 1;
    co3_26(i, (y-1)*n+i) = 1;
end

% For edge (11, 12)

x = 11; y = 12;
co3_27 = zeros(n, n^2+n);
for i = 1:n
    co3_27(i, (x-1)*n+i) = 1;
    co3_27(i, (y-1)*n+i) = 1;
end

% For edge (12, 13)

x = 12; y = 13;
co3_28 = zeros(n, n^2+n);
for i = 1:n
    co3_28(i, (x-1)*n+i) = 1;
    co3_28(i, (y-1)*n+i) = 1;
end

% For edge (12, 14)

x = 12; y = 14;
co3_29 = zeros(n, n^2+n);
for i = 1:n
    co3_29(i, (x-1)*n+i) = 1;
    co3_29(i, (y-1)*n+i) = 1;
end

% For edge (13, 14)

x = 13; y = 14;
co3_30 = zeros(n, n^2+n);
for i = 1:n
    co3_30(i, (x-1)*n+i) = 1;
    co3_30(i, (y-1)*n+i) = 1;
end

% For edge (14, 15)

x = 14; y = 15;
co3_31 = zeros(n, n^2+n);
for i = 1:n
    co3_31(i, (x-1)*n+i) = 1;
    co3_31(i, (y-1)*n+i) = 1;
end

% For edge (15, 16)

x = 15; y = 16;
co3_32 = zeros(n, n^2+n);
for i = 1:n
    co3_32(i, (x-1)*n+i) = 1;
    co3_32(i, (y-1)*n+i) = 1;
end

% For edge (15, 17)

x = 15; y = 17;
co3_33 = zeros(n, n^2+n);
for i = 1:n
    co3_33(i, (x-1)*n+i) = 1;
    co3_33(i, (y-1)*n+i) = 1;
end

% For edge (15, 18)

x = 15; y = 18;
co3_34 = zeros(n, n^2+n);
for i = 1:n
    co3_34(i, (x-1)*n+i) = 1;
    co3_34(i, (y-1)*n+i) = 1;
end

% For edge (16, 17)

x = 16; y = 17;
co3_35 = zeros(n, n^2+n);
for i = 1:n
    co3_35(i, (x-1)*n+i) = 1;
    co3_35(i, (y-1)*n+i) = 1;
end

% For edge (17, 18)

x = 17; y = 18;
co3_36 = zeros(n, n^2+n);
for i = 1:n
    co3_36(i, (x-1)*n+i) = 1;
    co3_36(i, (y-1)*n+i) = 1;
end

% Coefficient for the speed up constraint

co4 = zeros(n-1, n^2+n);

for i = 1:n-1
    co4(i, n^2+i) = 1;
    co4(i, n^2+i+1) = -1;
end

%% New constraint

co_new1 = co(1, 3, n);
co_new2 = co(1, 4, n);
co_new3 = co(1, 5, n);
co_new4 = co(1, 7, n);
co_new5 = co(1, 8, n);
co_new6 = co(1, 9, n);
co_new7 = co(2, 7, n);
co_new8 = co(2, 8, n);
co_new9 = co(2, 9, n);
co_new10 = co(2, 10, n);
co_new11 = co(2, 11, n);
co_new12 = co(2, 12, n);
co_new13 = co(3, 5, n);
co_new14 = co(3, 6, n);
co_new15 = co(3, 11, n);
co_new16 = co(3, 12, n);
co_new17 = co(4, 6, n);
co_new18 = co(4, 9, n);
co_new19 = co(4, 10, n);
co_new20 = co(4, 13, n);
co_new21 = co(4, 14, n);
co_new22 = co(5, 7, n);
co_new23 = co(5, 8, n);
co_new24 = co(5, 12, n);
co_new25 = co(5, 14, n);
co_new26 = co(5, 15, n);
co_new27 = co(6, 10, n);
co_new28 = co(6, 11, n);
co_new29 = co(6, 14, n);
co_new30 = co(6, 15, n);
co_new31 = co(7, 9, n);
co_new32 = co(7, 15, n);
co_new33 = co(8, 10, n);
co_new34 = co(8, 14, n);
co_new35 = co(8, 16, n);
co_new36 = co(8, 17, n);
co_new37 = co(8, 18, n);
co_new38 = co(9, 11, n);
co_new39 = co(9, 12, n);
co_new40 = co(9, 13, n);
co_new41 = co(9, 16, n);
co_new42 = co(9, 17, n);
co_new43 = co(9, 18, n);
co_new44 = co(10, 13, n);
co_new45 = co(10, 15, n);
co_new46 = co(11, 13, n);
co_new47 = co(11, 14, n);
co_new48 = co(12, 15, n);
co_new49 = co(13, 15, n);
co_new50 = co(14, 16, n);
co_new51 = co(14, 17, n);
co_new52 = co(14, 18, n);
co_new53 = co(16, 18, n);

%% Write the LP input file

lp = mxlpsolve('make_lp', 0, n^2+n);    

mxlpsolve('set_binary', lp, (1:n^2+n));               % Bin x_i_k, and y_k
mxlpsolve('set_obj_fn', lp, co_obj);                  % Set object fun
 
% Add constraints and name variables
% First constraint

for k = 1:n
    temp1 = co1(k, :);
    mxlpsolve('add_constraint', lp, temp1, 3, 1);
end

% Second constraint

for k = 1:n^2
    temp2 = co2(k, :);
    mxlpsolve('add_constraint', lp, temp2, 1, 0);
end

% Third constraint

for k = 1:n
    temp3 = co3_1(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_2(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_3(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_4(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_5(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_6(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_7(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_8(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_9(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_10(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_11(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_12(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_13(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_14(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_15(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_16(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_17(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_18(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_19(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_20(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_21(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_22(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_23(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_24(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_25(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_26(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_27(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_28(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_29(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_30(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_31(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_32(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_33(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_34(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_35(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

for k = 1:n
    temp3 = co3_36(k, :);
    mxlpsolve('add_constraint', lp, temp3, 1, 1);
end

% Fourth constraint

for k = 1:n-1
    temp4 = co4(k, :);
    mxlpsolve('add_constraint', lp, temp4, 2, 0);
end

%% New constraint

for k = 1:n
    temp_new = co_new1(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new2(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new3(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new4(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new5(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new6(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new7(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new8(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new9(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new10(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new11(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new12(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new13(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new14(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new15(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new16(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new17(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new18(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new19(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new20(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new21(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new22(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new23(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new24(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new25(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new26(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new27(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new28(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new29(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new30(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new31(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new32(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new33(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new34(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new35(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new36(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new37(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new38(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new39(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new40(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new41(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new42(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new43(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new44(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new45(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new46(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new47(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new48(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new49(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new50(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new51(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new52(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

for k = 1:n
    temp_new = co_new53(k, :);
    mxlpsolve('add_constraint', lp, temp_new, 1, 1);
end

%% Name x_i_k, and y_k

start = 1;
for i = 1:n
    for j = 1:n
        names{start} = strcat('x_', num2str(i), '_', num2str(j));
        start = start + 1;
    end
end

for i = 1:n
    names{start} = strcat('y_', num2str(i));
    start = start + 1;
end

for i = 1:n^2+n
    mxlpsolve('set_col_name', lp, i, names{i});
end

% Write lpsolve input file

mxlpsolve('write_lp', lp, 'hw3_1');