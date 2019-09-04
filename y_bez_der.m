function y = y_bez_der(b,t)
    tocka = bezier_der(b,t,false);
    y = tocka(2);
end