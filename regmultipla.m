function [B, yy] = regmultipla(X,y)
% Matriz transporta M'
B = ((X'* X)^(-1)) * X' * y;
% Linha de regress�o
yy = X * B;
end