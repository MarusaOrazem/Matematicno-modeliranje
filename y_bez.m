function y = y_bez(b,t)
    tocka = deCasteljau(b,t);
    y = tocka(2);
end