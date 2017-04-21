function [ dx ] = ur5odefun( t, x )
%UR5ODEFUN Calculates UR5 derivatives

disp(t);

%% Import robot dynamic matrices
global Ms Cs Gs

%% Produce inputs
u = [0 0 0 0 0 0]';

%% Compute matrices
q_1 = x(1);
q_2 = x(2);
q_3 = x(3);
q_4 = x(4);
q_5 = x(5);
q_6 = x(6);
dq_1 = x(7);
dq_2 = x(8);
dq_3 = x(9);
dq_4 = x(10);
dq_5 = x(11);
dq_6 = x(12);

q = [q_1 q_2 q_3 q_4 q_5 q_6]';
dq = [dq_1 dq_2 dq_3 dq_4 dq_5 dq_6]';
g = -9.81;

% tM = zeros(6, 6);
% tC = zeros(6, 6);
% tG = zeros(6, 1);
% 
% for i = 1:6
%     for j = 1:6
%         %disp([i j]);
%         tM(i, j) = fM{i, j}(q_1, q_2, q_3, q_4, q_5, q_6);
%         tC(i, j) = pC{i, j}(dq_1, dq_2, dq_3, dq_4, dq_5, dq_6, q_1, q_2, q_3, q_4, q_5, q_6);
%     end
%     
%     tG(i) = pG{i}(q_1, q_2, q_3, q_4, q_5, q_6);
% end

s1 = sin(q(1)); c1 = cos(q(1));
s2 = sin(q(2)); c2 = cos(q(2));
s3 = sin(q(3)); c3 = cos(q(3));
s4 = sin(q(4)); c4 = cos(q(4));
s5 = sin(q(5)); c5 = cos(q(5));
s6 = sin(q(6)); c6 = cos(q(6));
dq_1 = dq(1);
dq_2 = dq(2);
dq_3 = dq(3);
dq_4 = dq(4);
dq_5 = dq(5);
dq_6 = dq(6);
g = 9.81;

Mc = Ms(c1,c2,c3,c4,c5,c6,s1,s2,s3,s4,s5,s6);
Cc = Cs(c1,c2,c3,c4,c5,c6,dq_1,dq_2,dq_3,dq_4,dq_5,dq_6,s1,s2,s3,s4,s5,s6);
Gc = Gs(c2,c3,c4,c5,g,s2,s3,s4,s5);

ddq = pinv(Mc) * (u - Cc*dq - Gc);

dx(1, 1) = dq_1;
dx(2, 1) = dq_2;
dx(3, 1) = dq_3;
dx(4, 1) = dq_4;
dx(5, 1) = dq_5;
dx(6, 1) = dq_6;
dx(7, 1) = ddq(1);
dx(8, 1) = ddq(2);
dx(9, 1) = ddq(3);
dx(10, 1) = ddq(4);
dx(11, 1) = ddq(5);
dx(12, 1) = ddq(6);

%disp('!');

end

