function h = predznacena_ukrivljenost(b,t)
[~,db] = bezier_der1(b, t);
[~,ddb] = bezier_der1(db,t);

h = (det([deCasteljau(db,t) deCasteljau(ddb,t)]))/norm(deCasteljau(db,t))^3;

  
  
  
  
end
