%1 kviz leto 2017/2018

%1 naloga
a = 77;
A1 = [0 5];
A2 = [10 1+a/100];
%[c1,c2] = risi_brah(A1,A2);

%taka toèka da je koeficient tangente enak -1
b = A2(1) - A1(1);
B = A2(2) - A1(2);

[k,theta0]=isci_theta(b,B);

% theta0 doloca interval risanje, k obliko krivulje
theta = linspace(0,theta0,100);

% Premaknemo brahistrono v originalni koordinatni sistem
x = 1/2*k^2*(theta-sin(theta)) + T1(1);
y = -1/2*k^2*(1-cos(theta)) + T1(2);

[k,theta0]=isci_theta(b,B);
dy = @(theta) - sin(theta) /(1-cos(theta)) + 1;
parametr = fzero(dy,1);
x1 =@(theta) 1/2*k^2*(theta-sin(theta)) + A1(1);
abcisa = x1(parametr);
y1 =@(theta) -1/2*k^2*(1-cos(theta)) + A1(2);
ordinata = y1(parametr);
P = [abcisa; ordinata];
smerni = [1; -1];
presecisce_y = presek_premic([0; 0], P, [0 ;1], smerni);
presecisce_x = presek_premic([0;0], P , [1;0], smerni);
ploscina = presecisce_y(2) * presecisce_x(1) *0.5;


% 2 naloga, zvezna verižnica
b = 94;
l = 16;
T1 = [1 5];
T2 = [4 3+b/100];

%spremenimo zaèetne toèke, kok se premakne najnižja toèka
T3 = [1 4];
T4 = [4 5+b/100];
tol = 1e-10;
D1 = najnizja_tocka(T1(1),T1(2),T2(1),T2(2),l);
D2 = najnizja_tocka(T3(1),T3(2),T4(1),T4(2),l);
D1_y = najnizja_vrednost(T1,T2,l,tol);
D2_y = najnizja_vrednost(T3,T4,l,tol);
norm([D1-D2;D1_y-D2_y]);

%preseèišèe dveh verižnic
[w1,dw1,D1,C1] = risi_ver(T1,T2,l,tol);
[w2,dw2,D2,C2] = risi_ver(T3,T4,l,tol);
presek = @(x) w1(x) - w2(x);
p_x = fzero(presek,1);
p_y = w1(p_x);

%vsota plošèin krivoèrtnih trikotnikov
p1 = integral(w1,1,p_x) - integral(w2,1,p_x);
p2 = integral(w2,p_x,4) - integral(w1,p_x,4);
p1+p2;

%dolžina krivulje
dolzina1 = @(x) sqrt(1+dw1(x).^2);
dolzina2 = @(x) sqrt(1+dw2(x).^2);
integral(dolzina1,1,p_x) + integral(dolzina2,p_x,4);

% 3 naloga, bezierjeve krivulje
c = 85;
b = [0,1,3,4+c/100;1,2,2,-1];

predznacena_ukrivljenost(b,0.4);

tocka = deCasteljau(b,0.5);
normala = normala_bez(b,0.5);
T = tocka + 2 .*normala;
norm(T);

smerni = [1;-1];
isci = @(t) vzporedna_s_premico(b,smerni,t);
fzero(isci,0.5);



