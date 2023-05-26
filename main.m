%Projekt3
clear all;
close all;

%test
%A = importdata("./profile_wysokosciowe/Obiadek.csv");
%A = importdata("./profile_wysokosciowe/MountEverest.csv");
A = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
startOf = 1;
endOf = 100;
%endOf = size(A.data,1);
n = 5;

interpolation_nodes = A.data(startOf:n:endOf, :);
interpolatedValues = lagrange(interpolation_nodes, A.data(startOf:endOf, :));


splines(A)