clear all; close all; clc;

% Set up

value_list = floor(50 + 30 * cos(1:50));
weight_list = floor(14 + 9 * cos(11 * (1:50) + 2));
volume_list = floor(10 + 2 * cos(4 * (1:50) - 1));

value_weight = value_list ./ weight_list;
value_volume = value_list ./ volume_list;

[v1, i1] = max(value_weight);
[v2, i2] = max(value_volume);