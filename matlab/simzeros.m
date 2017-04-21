function [ P ] = simzeros(A, thr)
P = A;
sP = char(P);
ns = regexp(char(sP), '0\.\d*', 'Match');
ns = [ns regexp(char(sP), '\d.\d*e-\d*', 'Match')];

for i = 1:numel(ns)
    if str2num(strjoin(ns(i))) < thr
        sP = strrep(sP, ns(i), '0');
        %disp([num2str(i) ' ' num2str(j)]);
    end
end

P = sym(sP);