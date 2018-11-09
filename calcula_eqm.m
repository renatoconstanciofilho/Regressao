function [eqm] = calcula_eqm(y)
residuo = (y - mean(y)).^2;
eqm = (sum(residuo))/size(y,1)
end