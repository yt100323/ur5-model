%% Simplify matrices calculated by UR5.m

thr = 1e-6;

%% Mass matrix
Ms = subs(M, 'sin(q_1)', 's1');
Ms = subs(Ms, 'cos(q_1)', 'c1');
Ms = subs(Ms, 'sin(q_2)', 's2');
Ms = subs(Ms, 'cos(q_2)', 'c2');
Ms = subs(Ms, 'sin(q_3)', 's3');
Ms = subs(Ms, 'cos(q_3)', 'c3');
Ms = subs(Ms, 'sin(q_4)', 's4');
Ms = subs(Ms, 'cos(q_4)', 'c4');
Ms = subs(Ms, 'sin(q_5)', 's5');
Ms = subs(Ms, 'cos(q_5)', 'c5');
Ms = subs(Ms, 'sin(q_6)', 's6');
Ms = subs(Ms, 'cos(q_6)', 'c6');
% Ms = simplify(Ms)
Ms = vpa(Ms);
for i = 1:6
    for j = 1:6
        disp(['Ms ' num2str(i) ' ' num2str(j)])
        Ms(i, j) = simzeros(Ms(i, j), thr);
    end
end
Ms = matlabFunction(Ms);

%% Coriolis matrix
Cs = subs(C, 'sin(q_1)', 's1');
Cs = subs(Cs, 'cos(q_1)', 'c1');
Cs = subs(Cs, 'sin(q_2)', 's2');
Cs = subs(Cs, 'cos(q_2)', 'c2');
Cs = subs(Cs, 'sin(q_3)', 's3');
Cs = subs(Cs, 'cos(q_3)', 'c3');
Cs = subs(Cs, 'sin(q_4)', 's4');
Cs = subs(Cs, 'cos(q_4)', 'c4');
Cs = subs(Cs, 'sin(q_5)', 's5');
Cs = subs(Cs, 'cos(q_5)', 'c5');
Cs = subs(Cs, 'sin(q_6)', 's6');
Cs = subs(Cs, 'cos(q_6)', 'c6');
% Cs = simplify(Cs)
Cs = vpa(Cs);
for i = 1:6
    for j = 1:6
        disp(['Cs ' num2str(i) ' ' num2str(j)])
        Cs(i, j) = simzeros(Cs(i, j), thr);
    end
end
Cs = matlabFunction(Cs);

%% Gravitational matrix
Gs = subs(G, 'sin(q_1)', 's1');
Gs = subs(Gs, 'cos(q_1)', 'c1');
Gs = subs(Gs, 'sin(q_2)', 's2');
Gs = subs(Gs, 'cos(q_2)', 'c2');
Gs = subs(Gs, 'sin(q_3)', 's3');
Gs = subs(Gs, 'cos(q_3)', 'c3');
Gs = subs(Gs, 'sin(q_4)', 's4');
Gs = subs(Gs, 'cos(q_4)', 'c4');
Gs = subs(Gs, 'sin(q_5)', 's5');
Gs = subs(Gs, 'cos(q_5)', 'c5');
Gs = subs(Gs, 'sin(q_6)', 's6');
Gs = subs(Gs, 'cos(q_6)', 'c6');
% Gs = simplify(Gs)
Gs = vpa(Gs);
for i = 1:6
    disp(['Gs ' num2str(i)])
    Gs(i) = simzeros(Gs(i), thr);
end
Gs = matlabFunction(Gs);
