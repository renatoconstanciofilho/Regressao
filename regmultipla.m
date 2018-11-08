function [B, yy] = regmultipla(X,y)
% Matriz transporta M'
B = ((X'* X)^(-1)) * X' * y;
% Linha de regressão
yy = X * B;
end