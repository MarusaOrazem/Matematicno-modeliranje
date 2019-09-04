function X = ver_uv(W0,zac,L,M)
% VER_UV resi problem veriznice iz sistema za u in v.
% Rezultat X je 2x(n+2) tabela koordinat vozlisc, kjer
% prva vrstica doloca abscise, druga ordinate iskanih tock.
%
% Vhodni parametri:
% W0 = [u0;v0] zaceten priblizek pri resevanju sistema
% nelinearnih enacb.
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.

%iz vektorja mas moram izraèunat vsote_mi = [0, mi_1,mi_1+mi_2,...]
%glej list za razlago
vektor_mi = 1/2.*(M(1,1:end-1) + M(1,2:end));
vsote_mi = [0,cumsum(vektor_mi)];

%dva naèina: 
%prvi naèin je z ugrajeno f solve: 
FUN = @(W) sistem_uv(W,zac,L,vsote_mi);
UV = fsolve(FUN,W0); 

%drugi naèin je z newtonovo metodo, ki jo sama spogramiram
%F = @(W) sistem_uv(W,zac,L,vsote_mi);
%JF = @(W) jacobian_uv(W,L,vsote_mi);
%UV = newton(F,JF,[-0.5;-1.2],1e-5,1000);
u = UV(1);
v = UV(2);

%z solve sem dobila u,v, zdej rabiš še Ei,Ni, potem pa xi,yi
E = L./sqrt(1 + (v - u *vsote_mi).^2.);
N = E.*(v - u*vsote_mi);

vsote_E = [0,cumsum(E)];
vsote_N = [0,cumsum(N)];
X = zeros(length(E)+1,2);
X(:,1) = zac(1,1) + vsote_E;
X(:,2) = zac(2,1) + vsote_N;


