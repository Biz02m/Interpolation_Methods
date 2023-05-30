%Projekt 3
% Metoda funkcjami sklejanymi 3 stopnia
clear all
close all
Data(1) = importdata("./profile_wysokosciowe/GlebiaChallengera.csv");
Titles(1) = "Głębia Challengera";
%Data(2) = importdata("./profile_wysokosciowe/SpacerniakGdansk.csv");
%Titles(2) = "Spacerniak w Gdańsku";
%Data(3) = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
%Titles(3) = "Wielki Kanion Kolorado";

numberOfInterpolationNodes = 25;

for i = 1:3
    startOf = 1;
    endOf = size(Data(i).data,1);
    
    n = floor(endOf/(numberOfInterpolationNodes-1));
    if mod(n,2) == 0
        n = n - 1;
    end
    
    RealData = Data(i).data(startOf:endOf, :);
    indices = [1,248,375,512];
    interpolationNodes = RealData(indices, :);
    %interpolationNodes = RealData(startOf:n:endOf, :);
    
    %RealData = zeros(7, 2);  % Inicjalizacja macierzy 7x2 wypełnionej zerami
    %for i = 1:7
    %    RealData(i, 1) = i - 1;  % Wypełnienie pierwszej kolumny wartościami 0-6
    %end
    %RealData(2, 2) = 6;
    %RealData(4,2) = -2
    %RealData(6,2) = 4;
    
    %interpolationNodes = zeros(3,2);
    %interpolationNodes(1,1) = 1;
    %interpolationNodes(1,2) = 6;
    %interpolationNodes(2,1) = 3;
    %interpolationNodes(2,2) = -2;
    %interpolationNodes(3,1) = 5;
    %interpolationNodes(3,2) = 4;
    
    b = splines(interpolationNodes);
    interpolatedValues = performSplineInterpolation(interpolationNodes,RealData,b);

    err = sqrt(sum((RealData(:,2) - interpolatedValues(:,2)).^2)) / numel(RealData(:,2))
    
    xmin = 0;
    xmax = max(RealData(:,1));
    ymin = min(RealData(:,2));
    ymax = max(RealData(:,2)) + 10;
    figure
    plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]);
    hold on
    scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan");
    plot(interpolatedValues(:,1), interpolatedValues(:,2), 'r'), xlabel("Dystans"), ylabel("Wysokość"), title(strcat("Interpolacja splajnami 3 stopnia - ", Titles(i))), xlim([xmin, xmax]), ylim([ymin, ymax])
end