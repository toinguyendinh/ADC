clear all, close all;

%read input from txt (matrix)
%file_path = 'data_input.txt';
%data_input = load(file_path);

%read f_offset
fileID = fopen('data_f_offset.txt', 'r');
f_offset = fscanf(fileID, 'freq_0 = %e');
fclose(fileID);



%{
input = 

v1 = 
v2 = 
f1 = 
f2 = 

K_v = (f1-f2)/(v1-v2);

f_offset = 

f_vco = K_v * input + f_offset;


file_path = 'data_linear.txt'
matrix = load(file_path);

matrix_1 = matrix(:, 1);
matrix_2 = matrix(:, 2);

plot(matrix_1, matrix_2);
%}
