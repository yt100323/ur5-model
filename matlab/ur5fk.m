function [x1, x2, x3, x4, x5, x6] = ur5fk(q)
%UR5FK Calculate forward kinematics of the UR5 model

global T_1f T_2f T_3f T_4f T_5f T_6f 

s1 = sin(q(1)); c1 = cos(q(1));
s2 = sin(q(2)); c2 = cos(q(2));
s3 = sin(q(3)); c3 = cos(q(3));
s4 = sin(q(4)); c4 = cos(q(4));
s5 = sin(q(5)); c5 = cos(q(5));
s6 = sin(q(6)); c6 = cos(q(6));

T1 = T_1f(c1, s1);
T2 = T_2f(c1, c2, s2);
T3 = T_3f(c3, s3);
T4 = T_4f(c4, s4);
T5 = T_5f(c5, s5);
T6 = T_6f(c6, s6);

x1 = T1 * [0 0 0 1]';
x2 = T1*T2 * [0 0 0 1]';
x3 = T1*T2*T3 * [0 0 0 1]';
x4 = T1*T2*T3*T4 * [0 0 0 1]';
x5 = T1*T2*T3*T4*T5 * [0 0 0 1]';
x6 = T1*T2*T3*T4*T5*T6 * [0 0 0 1]';

end

