%kviz pdf
format long


b = 37;
A = [0 0];
B = [3 0];
M = [2 +b/100 3.4 0.8 1+b/100 0.6 3.1];
L = [1 1 1 1 1 1];
g = 9.8;
zac = [A(1) B(1);A(2) B(2)];

%Prva naloga: 
%Koliko je vsota koordinat težišèa diskretne verižnice?

X = ver_uv([-0.5;-1.2],zac,L,M);
x = X(:,1); %x-koordinate stolpec
y = X(:,2); %y-koordinate stolpec
plot([x;B(1);A(1)],[y;B(2)+1;A(2)])

%Potrebujem izraèunati težišèe diskretne verižnice: 
x_tezisce = sum(1/2.*M'.*(x(1:end-1,1) + x(2:end,1)))/sum(M);
y_tezisce = sum(1/2.*M'.*(y(1:end-1,1) + y(2:end,1)))/sum(M);

vsota_tezisc = x_tezisce + y_tezisce
