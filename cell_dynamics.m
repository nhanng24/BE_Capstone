clear, clc, close 

%% Parameters 
% Population growth rate 
r = 0.24;

% Number of days 
days  = 7;

% Number of hours 
hours = 0; 

% Initial number cells 
N0    = 1e6;

% Carrying capacity
K = 1e8;

tspan = [0 (days*24 + hours)]; 

%% Exponential growth
hold on 
dNdt = @(t,N) r*N; 
[t, N] = ode45(dNdt,tspan, N0);
plot(t, N, "k--")


%% Logistic growth 
dNdt = @(t,N) r*N - r*N.^2/K;
[t, N] = ode45(dNdt,tspan, N0);
plot(t, N, "r-")
xlim(tspan)
ylim([0 1.2e8])
hold off 








