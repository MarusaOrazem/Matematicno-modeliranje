    
function [w,dw,D,C] = risi_ver(T1,T2,l,tol)
% RISI_VER narise zvezno veriznico. Pri tem so:
% T1 in T2 sta krajisci veriznice oblike T1(a,A) in
% T2(b,B),
% l je dolzina veriznice,
% tol je toleranca, ki doloca natancnost priblizka
% pri navadni iteraciji.
    z0=1;
    z = isci_z(T1,T2,l,z0,tol);
    
    a = T1(1);
    b = T2(1);
    A = T1(2);
    B = T2(2);
    
    v = atanh((B-A)/l) + z;
    u = atanh((B-A)/l) - z;
    
    C = (b-a)/(v-u);
    D = (a*v - b*u)/(v-u);
    
    lambda = A - C*cosh((a-D)/C);
    
    X = linspace(a,b);
    w = @(x) C*cosh((x-D)/C) + lambda;
    WX = w(X);
    dw = @(x) sinh((x-D)/C);
    
    %plot(X,WX);
    