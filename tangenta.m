function tangenta(f,df,interval,st_tock)
% TANGENTA izrise animacijo 'drsenja' tangente po grafu funkcije.
% 
% Vhodni podatki:
% f je funkcija, df je njen odvod.
% interval je interval, kjer risemo sliko.
% st_tock je stevilo tock pri risanju.

a=interval(1);
b=interval(2);
h=(b-a)/st_tock;

% graf funkcije f
hold on;

x = linspace(a,b,st_tock);
y = f(x);
plot(x,y,'k')

% fiksiramo sliko na [a,b] x [min(y)-1, max(y)+1];
axis([a,b,min(y)-1,max(y)+1]);

for i=a:h:b
    
    %enacba tangente
    tangenta = @(x) f(i)+df(i)*(x-i);
    
    % graf tangente
    premica=plot(x,tangenta(x),'b'); 
    
    pause(0.05) %pocaka
    
    % izbrise trenutno tangento, da lahko
    % v naslednjem koraku narisemo novo
    delete(premica)
    
end

hold off

end