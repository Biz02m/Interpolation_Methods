%Projekt3
clear all;
close all;

%test
A = importdata("./profile_wysokosciowe/Obiadek.csv");
%B = importdata("./profile_wysokosciowe/MountEverest.csv");
%C = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
startOf = 1;
endOf = 51
%endOf = size(A,1);
n = 20;

interpolation_nodes = A(startOf:n:endOf, :);
%lg(interpolation_nodes,A(startOf:endOf, :));
lagrange(interpolation_nodes, A(startOf:endOf, :));
splines(A)