%Kviz iz diskretne veriznice
%Rešitve druge in tretje so napaène, ampak tle je asistent baje zajebu. 
%Rešitev prve naloge se razlikuje za zadnje 3 decimalke. 

format long

b = 80;
A = [0,0];
B = [3,0];
M = [2+b/100,3.4,0.8,1+b/100,0.6,3.1]; %vrstica
L = [1,1,1,1,1,1];
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

%Druga naloga: 
%Veriznica je razstavljiva in vrstni red palic lahko poljubno zamenjamo.
%Poišèite tisto konfiguracijo, ki da najmanjšo potencialno energijo.
%Kolikšna je ta vrednost potencialne energije?

%Poiskati moram konfiguracijo, ki ima najnižjo y koordinato težišèa, ker bo
%ta imela najnižjo potencialno energijo.

%Naredim vse permutacije, vektorja M (POZOR! Èe niso vse palice enako dolge
%moraš permutirat tudi dolžine palic!): 
P = perms(M); %vrstice matrike P so permutacije vektorja M, torej ima length(M)! vrstic.
y_tezisce_prejsne = 5; %nekej visokega kar gotovo se ne more zgodit
for i = 1:factorial(length(M))
    X = ver_uv([-0.5;-1.2],zac,L,P(i,:));
    x = X(:,1); %x-koordinate stolpec
    y = X(:,2); %y-koordinate stolpec
    y_tezisce = sum(1/2.*P(i,:)'.*(y(1:end-1,1) + y(2:end,1)))/sum(M);
    if y_tezisce < y_tezisce_prejsne
        y_tezisce_prejsne = y_tezisce;
    end
end

%Potencialna energija je E = mgh:
energija = sum(M)*g*y_tezisce_prejsne


%Tretja naloga: 
%Desno krajišèe B vertikalno dvignemo za 1. Izraèunajte plošèino
%veèkotnika, ki ga dobite, èe povežete krajišèi dobljene verižnice.

zac_premaknen = [A(1),B(1);A(2) B(2)+1];
X_premaknen = ver_uv([-0.5;-1.2],zac_premaknen,L,M);
x_premaknen = X_premaknen(:,1); %x-koordinate stolpec
y_premaknen = X_premaknen(:,2); %y-koordinate stolpec
figure
plot([x_premaknen;A(1)], [y_premaknen;A(2)])

%To bi moral bit rezultat:
ploscina_premaknene = polyarea([x_premaknen;A(1)],[y_premaknen;A(2)])

%Tukaj imam še zraèunano, koliko je plošèina med obema veriznicama.
ploscina_prve = polyarea([x;B(1);A(1)],[y;B(2)+1;A(2)]);
ploscina = ploscina_prve - ploscina_premaknene;
    
    %%%%%%%%%%%%%%

 W0 = [-0.5;-1.2];
tabela = ver_uv(W0,zac,L,M);
tabela_x = tabela(:,1);
tabela_y = tabela(:,2);
K1 = [tabela_x(2); tabela_y(2)];
K5 = [tabela_x(6); tabela_y(6)];
X = ver_uv([-2;-2],[K1 K5],L(2:6),M(2:6));
x = X(:,1); %x-koordinate stolpec
y = X(:,2); %y-koordinate stolpec
y_tezisce = sum(1/2.*M(2:6)'.*(y(1:5,1) + y(2:6,1)))/sum(M(2:6));
    

%Potencialna energija je E = mgh:
energija = sum(M(2:6))*g*y_tezisce
    
    
    