clc;
clear y Fs;
%https://www.mathworks.com/help/matlab/ref/load.html
f = load('data.mat');
%A primeira coluna � o tamanho da casa, a segunda coluna � o n�mero de quartos, e a terceira coluna � o pre�o da casa.

%https://www.mathworks.com/help/matlab/import_export/load-parts-of-variables-from-mat-files.html
%https://www.mathworks.com/matlabcentral/answers/182662-conversion-of-a-matrix-into-multiple-column-vectors
X = f.data(:,1:2);
Y = f.data(:,3);