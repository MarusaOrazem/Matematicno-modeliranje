% test tangenta

f = @(x) sin(x);
df = @(x) cos(x);
interval = [0,2*pi];

tangenta(f,df,interval,100)
