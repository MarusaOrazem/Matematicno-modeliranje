format long
a = 49;
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
integral(dt,0,3)