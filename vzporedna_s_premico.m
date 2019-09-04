function y = vzporedna_s_premico(b,v,t)
    B = bezier_der(b,t,false);
    C = [B(2);-B(1)];
    y = v'*C;
end