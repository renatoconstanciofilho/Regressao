clc;
clear y Fs;
%% Carregamento Arquivo
%https://www.mathworks.com/help/matlab/ref/load.html
f = load('data.mat');
%A primeira coluna é o tamanho da casa, a segunda coluna é o número de quartos, e a terceira coluna é o preço da casa.

%% Colocado os dados em Matriz
%https://www.mathworks.com/help/matlab/import_export/load-parts-of-variables-from-mat-files.html
%https://www.mathworks.com/matlabcentral/answers/182662-conversion-of-a-matrix-into-multiple-column-vectors

y = f.data(:,3);
%Adicionar coluna de uns
X = [ones(size(y)) f.data(:,1:2)];

%% Calculo da regressão
[B,yy] = regmultipla(X,y);
% B deve ser 1.0e+04 | 8.9598 | 0.0139 | -0.8738

%% Plotagem gráfico 3D
% Plotagem regressão 3D
% tamanho, numero de quartos e preço
scatter3(X(:,2), X(:,3), y, 'filled');
hold on;
grid on;
xlabel('Tamanho');
ylabel('N de Quartos');
zlabel('Preço');
% tamanho, numeo de quartos e regressao
plot3(X(:,2), X(:,3), yy);
legend('Dados', 'Linha de regressão', 'Location', 'best');
hold off;

% Regressão linear tamanho preço
figure;
c = correlacao(X(:,2),y);
[yt,b0,b1] = regressao(X(:,2),y);
scatter(X(:,2),y,'filled');
hold on;
plot(X(:,2),yt);
grid on;
xlabel('Tamanho');
ylabel('Preço');
t = sprintf('Correlação: %d | B0: %d  | B1: %d', c, b0, b1)
title(t);
legend('Dados', 'Linha de regressão', 'Location', 'southeast');
hold off;

% Regressão linear qtd quartos preço
figure;
c = correlacao(X(:,3),y);
[yq,b0,b1] = regressao(X(:,3),y);
scatter(X(:,3),y,'filled');
hold on;
plot(X(:,3),yq);
grid on;
xlabel('Tamanho');
ylabel('Preço');
t = sprintf('Correlação: %d | B0: %d  | B1: %d', c, b0, b1)
title(t);
legend('Dados', 'Linha de regressão', 'Location', 'southeast');
hold off;

%% Calcule o preço de uma casa que tem tamanho de 1650 e 3 quartos. O resultado deve ser igual a 293081.
qg = [1 1650 3];
resultadoQG = qg * B;
disp(sprintf('Valor previsto: %d', resultadoQG));


%https://www.mathworks.com/help/stats/regress.html


