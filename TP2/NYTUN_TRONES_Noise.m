% Jesper NYTUN, Peder TRONES
% 2 IMACS Groupe C
% 20/12/2024
% TP2: Traitement de signauxs avec bruit

clear all;
clear;
close;

%fonctions utiles
integ = @(s_de_t, Te) sum(s_de_t) * Te; % integration
rect = @(x, y, t) (t >= x) .* (t <= y); % function rectangle/porte

% definition des signaux
dt = 0.1;
t1 = 0:dt:5
N1 = length(t1);

% definition des signaux
s = @(E, t1, t2, t) E * rect(t1, t2, t);

sx = audioread('Documents\donnees_TP2\signal_inconnu.wav');
s1 = audioread('Documents\donnees_TP2\sequence1.wav');
s2 = audioread('Documents\donnees_TP2\sequence2.wav');
s3 = audioread('Documents\donnees_TP2\sequence3.wav');

%definition de signals d|entree
f_t = sx;
g_t = sx;

%calcul de correlation
h_t = xcorr(f_t, g_t, 'none')*dt; %calcul de correlation normalisè
lag = -(length(f_t)-1):(length(f_t)-1); %dephasage
t3 = lag * dt; %recentration

%affichage
subplot(2,2,[2 4]);
plot(t3, h_t, 'k');
title('f(t)*g(t) correlation rÈponse');
grid on;
xlabel('\tau (s)');
ylabel('amplitude');
xlim([-max(t1), max(t1)]); %centre le plot autour de 0

figure(1);

subplot(2,2,1);
plot(g_t, 'r');
title('signal_innonnu bruit');
grid on;
xlabel('t');
ylabel('amplitude');


subplot(2,2,[2 4]);
plot(t3, h_t, 'k');
title('correlation de bruit');
grid on;
xlabel('t');
ylabel('amplitude');



%R\EPONSE AU QUESTIONS
% 1)2) Comment estimer energie du bruit?
% on sait tout simplement calculer le energie de signal total avec une somme
% notre idee ici dessous est de estimer le bruit en prennant le moyenne entre
% les valeurs de la signal autocorrelation dans une partie avec peu de
% correlation, comme ca on sait que c'est le bruit qui joue

% comme ca on sait calculer le contribution de bruit total dans la signal
% apres le cacul pour trouver les energie de sequence est facile

E_tot = sum((sx.^2))*dt;
E_bruit = mean(h_t(1:20))*length(sx);
E_sq = E_tot - E_bruit;

% E_tot = 18.746 W
% E_Bruit = 4.9279W
% E_sequence = 13.818 W

% 3) Commen trouver le periode?
% si on a une signal qui est peridoqiue, si on affiche le autocorrelation on va
% voir que il y a des points elevèes. Pour trouver le periode, on peut par
% exemple calculer le correlation normalis\e avec xcorr(f_t, g_t, 'coeff'), ou
% coeff est une fonction pour normaliser le signal.
% après cette point il faut just chercher le temps qui passe entre chaque point
% ou le autocorrelation normalise vaut 100%.
% si il y a de bruit dans le signal, ca peut-etre aider de avoir une taux plus
% bas que 100%.

% comme notre signal n'as pas des autres peaks on peut concluir que il n'est pas
% periodique

% 4) Chechons sequence plus simmilaire
% pour trover le signal plus resemblant on a rajoute les sequences, s1 s2 et s3
% dans le script. comme ca on peut chercher le cross correlation entre les
% signaux. On sait que une signal va avoir plus de correlation si ils sont
% resemblant. Autrement dit, le signal avec le plus de correlation, et avec une
% graph qui resemble le graph de autocorrelation de sx est le signal on cherche.

% on a fait des testes, et comme sequence2.wav nous renvoyent
% le amplitiude plus elevèe entre les sequences, ca devient notre reponse de
% question. Il est a remarque que le peak est pas a T = 0, mais a t = 10s
% on peut par ca concluir que le sequence2 est offset par 10 secondes.






