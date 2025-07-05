% NYTUN Jesper Bartholomay ; TRONES Peder
% 2IMACS Groupe C
% Date de soumission: 05/12/2024
% TP1_2 Calcul de pusissance moyenne

% Cette programme va calculer la pusissance moyenne de une signal et calculer les
% coefficients fourier associe a le signal. Après on le rèconstuit pour calculer
% sa puissance moyenne. En fin on affiche la èvolution de la pussiance moyenne
% de la reconstruction en fonction de nombre des harmoniques utilise

% on a decide de faire le reconstruction avec les coeffs an bn et a0

clear all; close all; clc;

% Définition des constantes
E = 1;           % Amplitude
T0 = 40;         % Période du signal
Tau = T0 / 8;    % Largeur de la fonction porte
dt = T0 / 400;   % Pas d'èchantillage
t = 0:dt:T0;     % Discrétisation du temps
N_max = 10;      % Nombre de coefficient qu'on calcule

% Signal d'entrèe
s3 = E .* abs(sin(pi * t / T0));

% Approximation de integral avec une somme
integ = @(s_de_t, Te) sum(s_de_t) * Te;

% ------------------ CALCUL -------------------
% Calcul de la puissance moyenne du signal original
P_moy = (1 / T0) * integ(abs(s3).^2, dt);
disp(['Puissance moyenne du signal original (P_moy): ', num2str(P_moy)]);

% Tableau pour stocker puissance moyenne en fonction de N
P_moy_r_values = zeros(1, N_max);

% Calcul des coefficients de Fourier et reconstruction
for N = 1:N_max
    % Calcul des coefficients de Fourier (formules de cours)
    a0 = (2 / T0) * integ(s3, dt);
    an = zeros(1, N);
    bn = zeros(1, N);

    for n = 1:N
        an(n) = (2 / T0) * integ(s3 .* cos(2 * pi * n * t / T0), dt);
        bn(n) = (2 / T0) * integ(s3 .* sin(2 * pi * n * t / T0), dt);
    end

    % Reconstruction du signal à partir des coefficients de Fourier
    s_r = a0 / 2; % initialisation
    for n = 1:N
        s_r = s_r + an(n) * cos(2 * pi * n * t / T0) + bn(n) * sin(2 * pi * n * t / T0);
    end

    % Calcul de la puissance moyenne du signal reconstruit
    P_moy_r = (1 / T0) * integ(abs(s_r).^2, dt);
    P_moy_r_values(N) = P_moy_r;

end

% graphique

% affichage du signal original et reconstruit pour N_max
figure;
hold on;
plot(t, s3, 'b', 'DisplayName', 'Signal original');
plot(t, s_r, 'r--', 'DisplayName', ['Signal reconstruit (N = ', num2str(N_max), ')']);
title('signal original vs reconstruction');
xlabel('Temps (s)');
ylabel('amplitude');
legend;
grid on;
hold off;

% affichage de P_moy et P_moy_r en fonction de N
figure;
hold on;
plot(1:N_max, P_moy_r_values, 'bo-', 'DisplayName', 'P_{moy_r} (Signal reconstruit)');
yline(P_moy, 'r--', 'DisplayName', ['P_{moy} (Signal original) = ', num2str(P_moy)]);
title('Puissance moyenne en fonction de N');
xlabel('Nombre de coefficients de Fourier N');
ylabel('Puissance moyenne');
legend;
grid on;
hold off;

