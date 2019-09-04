    
function z = isci_z(T1,T2,l,z0,tol)
% ISCI_Z resi enacbo z = asinh(ro*z) za
% zvezno veriznico. Pri tem so:
% ro = l/(b-a)*sqrt(1-((B-A)/l)^2),
% T1 in T2 sta krajisci veriznice oblike T1(a,A) in
% T2(b,B),
% l je dolzina veriznice,
% z0 zacetni priblizek,
% tol je toleranca, ki doloca natancnost priblizka
% pri navadni iteraciji.
    
    ro = l/(T2(1)-T1(1))*sqrt(1-((T2(2)-T1(2))/l)^2);
    Z(1) = z0;
    Z(2) = asinh(z0*ro);
    i = 2;
    while abs(Z(i) - Z(i-1)) > tol
        i = i+1;
        Z(i) = asinh(ro*Z(i-1));
    end
    z = Z(end);