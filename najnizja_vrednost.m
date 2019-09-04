function min = najnizja_vrednost(T1,T2,l,tol)
    
    [w,~,~] = risi_ver(T1,T2,l,tol);
    a=T1(1);
    A=T1(2);
    b=T2(1);
    B=T2(2);
    
    x_min = najnizja_tocka(a,A,b,B,l);
    min = w(x_min);
end