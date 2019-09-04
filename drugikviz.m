%2 kviz
format long
a = 74;
T0 = [0;3];
T1 = [3;a/100];

%doloèitev parabole
vod_clen= (T0(2)-T1(2))/((T0(1)-T1(1))^2);
p = @(x) vod_clen * (x-T1(1))^2 + T1(2);
p(1);

%kje je kroglica najbližje izhodišèu
razdalja = @(x) sqrt(x^2 + (vod_clen * (x-T1(1))^2 + T1(2))^2);
resitev = fminbnd(razdalja,0,3);

%kdaj ma še èetrtino poti
df = @(x) 2*vod_clen*(x-T1(1));
dol =@(x) sqrt(1+(2*vod_clen*(x-T1(1))).^2);
cas = @(x) integral(dol,0,x) - 3*integral(dol,x,3);
fzero(cas,2.5);

%dolžina krivulje
dt = @(x) sqrt(1+(2*vod_clen*(x-T1(1))).^2) ./ sqrt(2*9.8*(3-(vod_clen * (x-T1(1)).^2 + T1(2))));
integral(dt,0,3);

%bezierjeve krivulje
c = 94;
b = [0,1/2,3,4;1,0,-2,c/100];
tol = 1e-10;
y = @(t) y_bez(b,t);
peta = fminbnd(y,0,4);

%vzporedna premici
B0 = [0;1];
B3 = [4;c/100];
k = B3-B0;
sistem = @(t) vzporedna_s_premico(b,k,t);
sesta = fzero(sistem,1);

%en korak subdivizije
[k1,k2] = sub_demo(b,0.5,true);
sedma = [0 1]*k2*[1 1 1 1]'




