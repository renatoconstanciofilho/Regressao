clc;
clear y Fs;

format long;
%% Carregamento Arquivo
%https://www.mathworks.com/help/matlab/ref/load.html
f = load('data_preg.mat');

%% Colocado os dados em matrizes
%Baixe o arquivo data_preg.mat. A primeira coluna representa os valores de x e a segunda coluna representa os valores de y
x = f.data(:,1);
y = f.data(:,2);

%% Gr�fico de dispers�o
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
[eqm2] = calcula_eqm(y2);
[eqm3] = calcula_eqm(y3);
[eqm8] = calcula_eqm(y8);

%% Aprendizado
% 4 Separar os dados 90%/10%
% 5 Calcular o B e regressao 90%
% 6 Calcular o regressao EQM teste (com B do treinamento)


%polyfit precisa inverter
%polyfit(x,y,n) (n = 2)
% beta s� com dados de treinamento
% y = B(3) + (B(2)*X) + (B(1)*X^2

%teste
%randperm
%pegar os 5 primeiros
% pega o beta do treinamento e aplica dos dados de teste e verifica o EQM