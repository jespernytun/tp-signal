% Jesper NYTUN, Peder TRONES
% 2 IMACS Groupe C
% 09/12/2024
% TP2: Calcul de produit convolution

%fonctions utiles
integ = @(s_de_t, Te) sum(s_de_t)*Te; % integration
rect = @(x, y, t) (t >= x).*(t <= y); % function rectangle/porte

% definition des signaux
E1 = 1;
E2 = 2;
dt = 0.01;
t1 = 0:dt:5
t2 = 0:dt:10
N1 = length(t1);
N2 = length(t2);

% definition des signaux
s = @(E, t1, t2, t) E*rect(t1, t2, t);
s1 = s(E1, 0, 2, t1);
s3 = s(E2, 1, 2, t2);

%signaux qui on va convaluter
f_t = s1;
g_t = s3;

%calcul de convulution et definition de une temps correspondent
h_t = dt*conv(s1,s3);
t3 = (1:length(h_t))* dt;

% Plot f(t)et g(t)
figure(1);
plot(t1, f_t, '-r', 'LineWidth', 1.5);
hold on;
plot(t2, g_t, '--b', 'LineWidth', 1.5);
hold off;

title('f(t) et g(t)');
xlabel('temps (s)');
ylabel('Amplitude');
grid on;

axis([0 max(max(t1), max(t2)) -0.5 2.5]);

% Plot f(t)*g(t)
figure(2);
plot(t3, h_t, 'k', 'LineWidth', 1.5);
title('f(t) * g(t)');
xlabel('temps (s)');
ylabel('Amplitude');
grid on;
axis([0 max(t3) min(h_t)-1 max(h_t)+1]);


%REPONSE AU QUESTIONS
%1)
%a) le convolution est defini sur N1 + N2 -1 points, ou N1 et N2 sont les points
% des fonctions f et g

%b) oui il est temporel bornè, et sa intervalle est a le somme de t_min de la
% deux fonction à le somme de t_max de la deux fonctions
% points et temps non null est aussi facile
% pour le temps c'est le temps non null de les deux fonctions
% pour les points c'est le sommme des points non nulls, N1 + N2 -1


