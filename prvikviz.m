% 1 kviz

% 1 naloga
a = 20;
f = @(x) e.^(-(a/100)*cos((pi*x)/2)+1);

prva = integral(f,0,1);

df = @(x) e.^(-(a/100).*cos((pi.*x)/2)+1) .* ((a.*pi)/(200)) .*sin(pi.*x/2);
dolzina = @(x) sqrt(1+df(x).^2);
druga = integral(dolzina,0,1) + f(0) + f(1) +1;

dela = @(x) integral(f,0,x) - integral(f,x,1);
tretja = fzero(dela,0.5);

k = df(1);
n = f(1) - k*1;
cetrta = -n;

% 2 naloga
b = 61;
A = [0 0];
B = [4 1];
M = [2+b/100,3.4,0.8,1+b/100,0.6,3.1];
L = [1,1,1,1,1,1];
g = 9.8;

W0 = [-1; -1];
zac = [A' B'];
mi = (1/2)*(M(1:end-1)+M(2:end)); 
vsote_mi = [0,cumsum(mi)]; 
sistem = @(W) sistem_uv(W, zac, L, vsote_mi);
W = fsolve(sistem, W0);

u=W(1);
v=W(2);

xi = L./sqrt(1+(v-u*vsote_mi).^2);
eta = xi.*(v-u*vsote_mi);

X=[zac(1,1)+cumsum(xi);zac(2,1)+cumsum(eta)];
X=[zac(:,1) X];

K1 = X(:,2);
K5 = X(:,6);

p1 = @(x) K5(2)/K5(1)*x;
p2 = @(x) (B(2) - K1(2))/(B(1) - K1(1))*x + B(2) - 4*(B(2) - K1(2))/(B(1) - K1(1));

p = @(x) p1(x) - p2(x);
iks = fzero(p,0);

pet = iks + p1(iks);

zac2 = [K1 K5];

sistem2 = @(W) sistem_uv(W, zac2, L, vsote_mi);
W2 = fsolve(sistem2, W0);

u2=W2(1);
v2=W2(2);

xi2 = L./sqrt(1+(v2-u2*vsote_mi).^2);
eta2 = xi.*(v2-u2*vsote_mi);

X2=[zac2(1,1)+cumsum(xi2);zac2(2,1)+cumsum(eta2)];
X2=[zac2(:,1) X2];
teziscay = 1/2*(X2(2,1:end-1)+X2(2,2:end));
sedem = (M*teziscay')*g
plot(X2(1,:), X2(2,:));
hold on
plot(X(1,:),X(2,:));



