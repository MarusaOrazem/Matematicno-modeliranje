function Z = jacobian_uv(W,L,vsote_mi)
% JACOBIAN_UV zgenerira Jacobijevo matriko v tocki W
% za sistem enacb (30) in (31) iz prilozenega clanka.
%kako je sestavljena, glej enabèo (34)
% 
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% vsote_mi je vrstica kumulativnih vsot, definiranih v (33).

w = W(2) - W(1)*vsote_mi;
Z = zeros(2,2);
for i = 1:length(L)
    matrika = [w(i)*vsote_mi(i),-w(i);-vsote_mi(i),1];
    Z = Z + L(i)*(1+w(i)^2)^(-3/2)*matrika;
end



