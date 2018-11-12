function [eqm] = calcula_eqm(y,yy)
residuo = (y - yy).^(2);
eqm = (sum(residuo))/size(y,1)
end