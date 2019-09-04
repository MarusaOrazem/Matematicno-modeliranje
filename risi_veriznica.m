function risi_veriznica(zac,L,M)
% RISI_VER_UV narise sliko veriznice
%
% Vhodni parametri:
% zac = [x_0 x_n+1;y_0 y_n+1], kjer sta (x_0,y_0) in
% (x_n+1, y_n+1) obesisci. 
% L je vrstica, ki doloca dolzine palic.
% M je vrstica, ki doloca mase palic.

X = ver_uv([-0.5;-1.2],zac,L,M); %tuki da� en poljube za�etni pribli�ek, �e kej ne dela spreminji ta pribli�ek!!
x = X(:,1); %vklucuje tudi prvo in zadnjo to�ko!
y = X(:,2);
plot(x,y)

