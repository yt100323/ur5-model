%% Global matrix functions
global fM fC fG

%% Initial conds.
x0 = [ 0 1.57 pi/4 -1.57 0 0 0 0 0 0 0 0 ]';

%% Time
t = [0 : 0.01 : 10];

%% Solve
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[t, x] = ode45(@ur5odefun, t, x0, options);

plot(t, x(:, 1:6));
legend('q1', 'q2', 'q3', 'q4', 'q5', 'q6');