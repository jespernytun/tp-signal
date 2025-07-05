% Jesper NYTUN, Peder TRONES
% 2 IMACS Groupe C
% 20/12/2024
% TP2: correlation de deux fonctions

%fonctions utiles
integ = @(s_de_t, Te) sum(s_de_t) * Te;
rect = @(x, y, t) (t >= x) .* (t <= y);

function s = drac(x, t)
    s = zeros(size(t));
    s(round(x)) = 1;
end

%variables
E1 = 1;
E2 = 2;
dt = 0.1;
t1 = 0:dt:5;
t2 = 0:dt:5;

s = @(E, t1, t2, t) E * rect(t1, t2, t);
s1 = s(E1, 0, 2, t1);
s2 = drac(3 / dt, t2);
s3 = s(E1, 1, 2, t2) + s(E1 , 3, 4, t2);

%definition de signals d|entree
f_t = s1;
g_t = s3;

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
plot(t1, f_t, 'r');
title('f(t)');
grid on;
xlabel('t');
ylabel('amplitude');

subplot(2,2,3);
plot(t2, g_t, 'b');
title('g(t)');
grid on;
xlabel('t');
ylabel('amplitude');


subplot(2,2,[2 4]);
plot(t3, h_t, 'k');
title('f(t)*g(t)');
grid on;
xlabel('t');
ylabel('amplitude');


%REPONSE AU QUESTIONS
%1)
%a) le convolution est defini sur N1 + N2 -1 points, ou N1 et N2 sont les points
% des fonctions f et g

%b) oui il est temporel bornè, et sa intervalle est a le somme de t_min de la
% deux fonction à le somme de t_max de la deux fonctions
% points et temps non null est aussi facile
% pour le temps c'est le DIFFERENCE temps non null de les deux fonctions
% pour les points c'est le sommme des points non nulls, N1 + N2 -1
