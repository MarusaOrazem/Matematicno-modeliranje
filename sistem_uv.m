function Z = sistem_uv(W,zac,L,vsote_mi)
% SISTEM_UV nastavi sistem dveh nelinearnih enacb za
% diskretno veriznico. To sta enacbi (30) in (31) iz
% prilozenega clanka.
% 
% Vhodni parametri:
% W = [u;v], kjer sta u in v iskani neznanki.
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% vsote_mi je vrstica kumulativnih vsot, definiranih v (33).
% 
% Z = [U(u,v);V(u,v)]

% moja rešitev:
% U = 0;
% V = 0;
% for i = 1:n+1
%     Ei = L(i)/(sqrt(1 + (W(2) - W(1) * vsote_mi(end))^2));
%     Ni = Ei*(W(2)- W(1) * vsote_mi(end));
%     U = U + Ei;
%     V = V + Ni;
%     
% end
% U = U - (zac(1,2)-zac(1,1));
% V = V - (zac(2,2)-zac(2,1));
% Z = [U;V];

% hitrejša rešitev: 
u = W(1);
v = W(2);

Ei = L./sqrt(1 + (v - u *vsote_mi).^2.);
Ni = Ei.*(v - u*vsote_mi);

Z = [sum(Ei)-(zac(1,2)-zac(1,1)); sum(Ni) - (zac(2,2)-zac(2,1))];