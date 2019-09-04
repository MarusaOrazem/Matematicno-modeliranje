function [ x, X, k ] = newton( f,Jf,x0,tol,N )
%Funkcija izvede Newtonovo metodo za resevanje sistema nelinearnih enaèb
%
%Vhodni podatki: 
% f  preslikava, ki doloèa nelinearni sistem f(x) = 0
% JF Jakobijeva matrika preslikave f
% x0 zaèetni približel (stolpec)
% tol toleranca za razlike dveh zaporednjih problizkov
% N maksimalno stevilo korakov iteracije
% 
% Izhodni podatek: 
% x   koncni priblizek za resitev sistema f(x) = 0
% X   vektor priblizkov
% k   število korakov

if nargin < 5
    N = 100;
    if nargin < 4
        tol = 1e-10;
    end
end

k = 0;
X = x0;
deltax = Inf;
while norm(deltax) > tol && k < N
    k = k+1;
    x = X(:,k);
    deltax = -Jf(x)\f(x);
    X(:,k+1) = x + deltax;
end    
x = X(:,k+1);
end
