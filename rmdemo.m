clc;
clear y Fs;
%% Carregamento Arquivo
%https://www.mathworks.com/help/matlab/ref/load.html
f = load('data.mat');
%A primeira coluna � o tamanho da casa, a segunda coluna � o n�mero de quartos, e a terceira coluna � o pre�o da casa.

%% Colocado os dados em Matriz
%https://www.mathworks.com/help/matlab/import_export/load-parts-of-variables-from-mat-files.html
%https://www.mathworks.com/matlabcentral/answers/182662-conversion-of-a-matrix-into-multiple-column-vectors

y = f.data(:,3);
%Adicionar coluna de uns
X = [ones(size(y)) f.data(:,1:2)];

%% Calculo da regress�o
[B,yy] = regmultipla(X,y);
% B deve ser 1.0e+04 | 8.9598 | 0.0139 | -0.8738

% tamanho, numero de quartos e pre�o
scatter3(X(:,2), X(:,3), y);
hold on;
grid on;
xlabel('Tamanho');
ylabel('N de Quartos');
zlabel('Pre�o');
% tamanho, numeo de quartos e regressao
plot3(X(:,2), X(:,3), yy);

%% Calcule o pre�o de uma casa que tem tamanho de 1650 e 3 quartos. O resultado deve ser igual a 293081.
qg = [1 1650 3];
resultadoQG = qg * B;
disp(resultadoQG);


%https://www.mathworks.com/help/stats/regress.html


