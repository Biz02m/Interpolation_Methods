%Projekt 3
% Metoda funkcjami sklejanymi 3 stopnia

clear all
close all
A = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
startOf = 1;
endOf = 100;
%endOf = size(A.data,1);
n = 5;

RealData = A.data(startOf:endOf, :);
interpolationNodes = RealData(startOf:n:endOf, :);

b = splines(interpolationNodes);
interpolatedValues = performSplineInterpolation(interpolatedValues,RealData,b);

xmin = 0;
xmax = max(RealData(:,1));
ymin = min(RealData(:,2));
ymax = max(RealData(:,2)) + 10;
figure
plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]);
hold on
scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan");
plot(interpolatedValues(:,1), interpolatedValues(:,2)), xlabel("Dystans"), ylabel("Wysokość"), title("Profil wysokościowy - Interpolacja splajnami 3 stopnia"), xlim([xmin, xmax]), ylim([ymin, ymax])