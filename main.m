%Projekt3
clear all;
close all;

%test
A = importdata("./profile_wysokosciowe/Obiadek.csv");
B = importdata("./profile_wysokosciowe/MountEverest.csv");
C = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");

figure
plot(A(:,1), A(:,2))

figure
plot(B.data(:,1), B.data(:,2))

figure

plot(C.data(:,1), C.data(:,2))