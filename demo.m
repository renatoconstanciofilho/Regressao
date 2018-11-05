clc
clear

%Grafico x1/y1=0.81642 B0=3.0001 B1=0.50009
x1 = [10;8;13;9;11;14;6;4;12;7;5];
y1 = [8.04;6.95;7.58;8.81;8.33;9.96;7.24;4.26;10.84;4.82;5.68];

%Grafico x2/y2=0.80162 B0=3.0647 B1=0.49018
x2 = [10;8;13;9;11;14;6;4;12;7;5];
y2 = [9.14;8.14;8.47;8.77;9.26;8.10;6.13;3.10;9.13;7.26;4.74];

%Grafico x3/y3=0.81652 B0=3.0017 B1=0.49991
x3 = [8;8;8;8;8;8;8;8;8;8;19];
y3 = [6.58;5.76;7.71;8.84;8.47;7.04;5.25;5.56;7.91;6.89;12.50];

format long;
c = correlacao(x1,y1);
[yy,b0,b1] = regressao(x1,y1);
%https://www.mathworks.com/help/matlab/ref/scatter.html
scatter(x1,y1);
hold on;
plot(x1,yy);
grid on;
xlabel('X1');
ylabel('Y1');
t = sprintf('Correlação: %d | B0: %d  | B1: %d', c, b0, b1)
title(t);
hold off;

figure;
c = correlacao(x2,y2);
[yy,b0,b1] = regressao(x2,y2);
%https://www.mathworks.com/help/matlab/ref/scatter.html
scatter(x2,y2);
hold on;
plot(x2,yy);
grid on;
xlabel('X2');
ylabel('Y2');
t = sprintf('Correlação: %d | B0: %d  | B1: %d', c, b0, b1)
title(t);
hold off;

figure
c = correlacao(x3,y3);
[yy,b0,b1] = regressao(x3,y3);
%https://www.mathworks.com/help/matlab/ref/scatter.html
scatter(x3,y3);
hold on;
plot(x3,yy);
grid on;
xlabel('X3');
ylabel('Y3');
t = sprintf('Correlação: %d | B0: %d  | B1: %d', c, b0, b1)
title(t);
hold off;



