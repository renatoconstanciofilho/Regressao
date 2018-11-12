clc;
clear all;
format short;

%% Configuração
percentual_teste = 0.1;

%% Carregamento Arquivo
%https://www.mathworks.com/help/matlab/ref/load.html
f = load('data_preg.mat');

%% Colocado os dados em matrizes
%Baixe o arquivo data_preg.mat. A primeira coluna representa os valores de x e a segunda coluna representa os valores de y
x = f.data(:,1);
y = f.data(:,2);

%% Gráfico de dispersão
scatter(x,y,'filled');
hold on;

%% Polyfit B
% 1 Calcular o B
B2 = polyfit(x,y,2);
% 2 Inverter os B = calcula_y
[y2] = calcula_y(B2,x);
plot(x,y2,'g');
B3 = polyfit(x,y,3);
[y3] = calcula_y(B3,x);
plot(x,y3,'k');
B8 = polyfit(x,y,8);
[y8] = calcula_y(B8,x);
plot(x,y8,'r');

%% EQM
% 3 Calcular EQM
[eqm2] = calcula_eqm(y, y2);
[eqm3] = calcula_eqm(y, y3);
[eqm8] = calcula_eqm(y, y8);

%% Aprendizado
% 4 Separar os dados 90%/10%
qtd_teste = round(length(x) * percentual_teste);
sorteados = randperm(length(x),qtd_teste);
x_teste = x(sorteados);
y_teste = y(sorteados);
x_aprend = x;
y_aprend = y;
x_aprend(sorteados,:) = [];
y_aprend(sorteados,:) = [];

%% Calcular regressão da base de aprendizado
% 5 Calcular o B e regressao 90%
BA2 = polyfit(x_aprend, y_aprend, 2);
ya2 = calcula_y(BA2, x_aprend);
BA3 = polyfit(x_aprend, y_aprend, 3);
ya3 = calcula_y(BA3, x_aprend);
BA8 = polyfit(x_aprend, y_aprend, 8);
ya8 = calcula_y(BA8, x_aprend);

%% Calcular regressao da base de teste usando B do treinamento
% 6 Calcular A regressao EQM teste (com B do treinamento)
yt2 = calcula_y(BA2, x_teste);
yt3 = calcula_y(BA3, x_teste);
yt8 = calcula_y(BA8, x_teste);

% calcular o EQM utilizando os 5 selecionados e o y calculado dos valores
% de teste
[eqmt2] = calcula_eqm(y_aprend,ya2);
[eqmt3] = calcula_eqm(y_aprend,ya3);
[eqmt8] = calcula_eqm(y_aprend,ya8);

%% Display dos EQM para comparação
disp("----- Erro Quadrático Médio Total -----");
disp(sprintf('EQM 2 pontos: %d', eqm2));
disp(sprintf('EQM 3 pontos: %d', eqm3));
disp(sprintf('EQM 8 pontos: %d', eqm8));
disp("");disp("----- Erro Quadrático Médio Teste -----");
disp(sprintf('EQM 2 pontos: %d', eqmt2));
disp(sprintf('EQM 3 pontos: %d', eqmt3));
disp(sprintf('EQM 8 pontos: %d', eqmt8));