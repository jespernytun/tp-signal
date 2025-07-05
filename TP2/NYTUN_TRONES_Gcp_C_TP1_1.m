%NYTUN Jesper Bartholomay ; TRONES Peder
%2IMACS Groupe C
%date de soumission: 05/12/2024
%TP1_1 Calcul de coefficients de fourier complexe de une signal quelleqonque

%cette programme caluclent et affichient les coefficients de fourier complexe
%de une signal defini par le utilisateur

%REMARQUE IMPORTANT, LES VARIABLES A CHANGER SONT MARQUES

%------------------ PARTIE DEBUT -----------------------------------------------

%definition de variables

E = 1; %Amplitude de signal de test (à changer a votre preferences)
N = 5; %N de coefficients de Fourier à calculer (à changer a votre preferences)

  %definitions de variables de temps
T0 = 40; %Periode de signal (à changer a votre preferences)
Tau = T0/8; %largeur de fontion porte (à changer a votre preferences)
dt = T0/400; %pas (à changer a votre preferences)
t = 0:dt:T0; %Temps de une periode discretisè

  %valeurs utile
j = sqrt(-1);

  %valeurs a t = 0
A0 = 0; %coefficient A0 de fourier
C = zeros(1,N); %coefficients de fourier complexe 1 jusqu a N

%definitions de fonctions utiles
expo = @(n,T0,t) exp(-j*(n-1)*(2*pi/T0)*t); %exponentiel complexe de formule de fourier
rect = @(x,y,t) (t>=x) .* (t<=y); %fucntion rectangle/porte

%definition de notre signals de test
  %singal sinusoïdal de amplitude E
s1= E.*abs(sin(pi*t/T0));

  %signal portes
f = @(t) E*rect((T0/4)-(Tau/2),(T0/4)+(Tau/2),t)-E*rect((3*T0/4)-(Tau/2),(3*T0/4)+(Tau/2),t);
s2 = f(t);

%definition de singal de utilisateur
s3= E.*abs(sin(pi*t/T0)); %(à changer a votre preferences)

%trace de s
figure(1);
plot(t, s3),
xlabel('temps (t)');
ylabel('amplitude E');
title('signal de utilisateur');
grid on;


%------------------ PARTIE CALCUL ET AFFICHAGE ---------------------------------

%calcul du coefficient A0
A0 = (1 / T0) * sum(s3) * dt; % intégration riemann


%calcul des coefficients Cn
for n = 1:N
    expo_t = expo(n, T0, t); %terme exponentiel pour chaque n
    C(n) = (1 / T0) * sum(s3 .* expo_t) * dt;
end

%display de coefficients
disp('A0:')
disp(A0);
disp('Coefficients Cn:');
disp(C);





