function n = normala_bez(b,t)
  [tangenta,~] = bezier_der1(b,t);
  normala1 = [-tangenta(2);tangenta(1)];
  n = normala1 /norm(normala1);
  
  
  
end
