function [c, dp] = bezier_der1(b,t)
    %izracuna tangentni vektor na bezierjevo krivuljo v t
    
    n = length(b);
    dp = b(:,2:end)-b(:,1:(end-1));
    dp = (n-1)*dp;
    c = deCasteljau(dp,t);
end