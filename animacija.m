function animacija(zac,L,M,h)
% ANIMACIJA izrise animacijo, ko desni konec veriznice
% dvigamo ali spuscamo vertikalno.
% Pri tem stevilo h doloca smer in dolzino:
% negativen predznak: premik navzdol za abs(h)
% pozitiven predznak: premik navzgor za h

if h >= 0
    h_mali = linspace(0,h,50);
else 
    x_mali = linspace(h,0,50);
end

%na vsakem koraku izraèunamo podatke za verižnico pri spremenjenem zaèetnem
%podatku: 

%spremenimo zaèetni podatek: 
for i = 1:49
    zac2 = zac + [0,0;0,h_mali(i)];
    X = ver_uv([-0.5;-1.2],zac2,L,M);
    x = X(:,1);
    y = X(:,2);
    veriznica = plot(x,y);
    axis([zac(1,1),zac(1,2), -6 max(zac(2,1),zac(2,2))+abs(h)+1]);
    pause(0.0001)
    delete(veriznica);
end
plot(x,y);
    

