%https://www.mathworks.com/help/matlab/matlab_prog/create-functions-in-files.html
%https://www.mathworks.com/help/matlab/ref/mean.html
%http://users.df.uba.ar/gsolovey/fisica2/Matlab_Intro/introduccion.html
function c = correlacao(x,y)
%Soma ( (x � m�dia de x) .* (y � m�dia de y))
superior = sum((x - mean(x)) .* (y - mean(y)));
%Raiz quadrada ( (soma de (x � m�dia de x)2 ) .* (soma de (y � m�dia de y)2 ))
inferior = sqrt((sum((x - mean(x)).^2)) .* (sum((y - mean(y)).^2)));
c = superior/inferior;
end

%https://www.mathworks.com/help/matlab/data_analysis/linear-regression.html