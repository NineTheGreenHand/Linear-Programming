clear all; close all; clc;

% Set up

value_list = floor(50 + 30 * cos(1:50));
weight_list = floor(14 + 9 * cos(11 * (1:50) + 2));
volume_list = floor(10 + 2 * cos(4 * (1:50) - 1));

% Generate the lpsolve input file

lp = mxlpsolve('make_lp', 0, 50);                
% mxlpsolve('set_verbose', lp, 3);

mxlpsolve('set_maxim', lp);                                 % Maximize
mxlpsolve('set_binary', lp, (1:50));                        % Set xi to be 0 or 1
mxlpsolve('set_obj_fn', lp, value_list);                    % Set object fun

mxlpsolve('add_constraint', lp, weight_list, 1, 200);       % Total weight <= 200 kg
mxlpsolve('add_constraint', lp, volume_list, 1, 100);       % Total volume <= 100 L

mxlpsolve('set_row_name', lp, 1, 'Weight');
mxlpsolve('set_row_name', lp, 2, 'Volume');

mxlpsolve('write_lp', lp, 'hw1a.lp');

