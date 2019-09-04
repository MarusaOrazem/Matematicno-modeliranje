% 1. izpit

% 1 naloga
a = 20;
f = @(x) 1-(a/100) * x.^2;
n = 100;
tol = 1e-12;
X = linspace(0,5,n+1);
y0 = [0;1];

g = @(x,y) [y(2) ; f(x) - y(1) - y(2)*(y(1)^2 -1)];

[~,Y] = ode45(g, X, y0, tol);

prva = Y(41,1);

a1 = Y(61,1);
a2 = Y(61,2);

druga = f(3) - a1 - a2*(a1^2-1);


% 2 naloga ZVEZNA VERIŽNICA
b = 28;
l = 16;
T1 = [1 2];
T2 = [5+b/100,2];
tol = 1e-12;
[w,D,C] = risi_ver(T1,T2,l,tol);

%doloèi toèko na verižnici da bosta dolžini v razmerju 2:1
dw = @(x) sinh((x-D)./C);
dolzina = @(x) sqrt(1+dw(x).^2);
enacba = @(x) integral(dolzina,T1(1),x) - 2.*integral(dolzina,x,T2(1));
prva = fzero(enacba,3);

%razdalja med najnižjo toèko in težišèem krivulje
dyT = @(x) w(x) .* sqrt(1+(dw(x)).^2);
dxT = @(x) x .* sqrt(1+(dw(x)).^2);
yT = integral(dyT,T1(1),T2(1)) /l;
xT = integral(dxT,T1(1),T2(1)) /l;
druga = norm([xT-D;yT-w(D)]);

%presek premice z krivuljo, razdalja preseèišè
k = @(x) w(x) + x - 1;
p1_x = fzero(k,1);
p2_x = fzero(k, 5);
p1_y = w(p1_x);
p2_y = w(p2_x);
tretja = norm([p1_x-p2_x;p1_y-p2_y]);

%koliko mora biti dolžina, da bo najnižja toèka na abcisi
%NE DELA
najn = @(l) najnizja_vrednost(T1,T2,l,tol);
cetrta = fzero(najn,5);

% 3. naloga BEZIEROVE KRIVULJE
c = 90;
b = [0,1,3+c/100,4;1,2,2,-1];

%pri kateri vrednosti je vzporedna s premico
v = [1;-1];
h = @(t) vzporedna_s_premico(b,v,t);
osma = fzero(h,3);

%pod kakšnim kotom (v radijanih) se sekata premica in b(t)
tang = bezier_der(b,0.6,false);
v2 = [1;3/2];
kot = (tang'*v2)/(sqrt(tang'*tang)*sqrt(v2'*v2));
deveta = acos(kot);

%dolžina bezierove krivulje
pomozna = @(t) y_bez_der(b,t);
pomozna2 = @(t) sqrt(1+pomozna(t).^2);
%dolzina = integral(pomozna2,0,4)

%najmanjsa ploscina, dve toèki, tretja na krivulji
ploscina = @(t) abs(y_bez(b,t) - 2)*(2+c/100)/2;
xmin = fminsearch(ploscina,0);
enajsta = ploscina(xmin)

