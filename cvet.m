function cvet(a,b,n)
% CVET﻿narise na isto sliko n rotacij elipse tako, da je vsaka
% naslednja zarotirana glede na prejsnjo za kot 2pi/n.

t = linspace(0,2*pi,100);

% parametrizacija elipse
x = a*cos(t);
y = b*sin(t);

axis equal
axis off

% narisimo grafe na isto sliko
hold on
plot(x,y);

for i = 1:(n-1)
    
    % kot rotacije
    fi = i*2*pi/n;
    
    %množenje z rotacijsko matriko [cos(fi) -sin(fi);sin(fi) cos(fi)]
    x1 = cos(fi)*x - sin(fi)*y;  
    y1 = sin(fi)*x + cos(fi)*y;
    
    plot(x1,y1)  
end

hold off


