format long

b = 61;
A = [0;0];
B = [4;1];
M = [2+b/100,3.4,0.8,1+b/100,0.6,3.1]; %vrstica
L = [1,1,1,1,1,1];
g = 9.8;
zac = [A B];

%prva
W0 = [-0.5;-1.2];
tabela = ver_uv(W0,zac,L,M);
tabela_x = tabela(:,1);
tabela_y = tabela(:,2);
K1 = [tabela_x(2); tabela_y(2)];
K5 = [tabela_x(6); tabela_y(6)];
s1 = B-K1;
s2 = K5-A;
p = presek_premic(A,K1,s1,s2);
p(1) + p(2)

