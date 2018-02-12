%% Beta Spectrum Plotting function
function [kvals,energies,upperBound,ecut,fitvals] = kurie(data)
%% Constants
Z = 53;
c = 299792458; % [m/s]
mec2 = 511E3; % [eV]
slope = 1.411e3;
b = -1.1212e4;
%% Data
%T25 = xlsread('Data/Test1/25min.xlsx');
T25 = abs(data);
T25 = T25(50:2000)';
energies = ((1:length(T25))*slope+b);
kvals = zeros(length(T25));

%% Functions
Fn = @(y) y/abs(1-exp(-y)); % Fermi Function
y = @(ZI,v) 2*pi*ZI*(v/c)/137;
ve = @(E) sqrt(c^2*(1-(1/(1+(E/mec2)))^2)); % Electron velocity

%% Kurie Plot
for i=1:length(T25)
    F = Fn(y(Z,ve(energies(i))));
    kvals(i) = T25(i)^(1/2)/F;
    
end

% 
% figure(1)
% plot(1:length(T25),T25)
% title('Raw Data')
% ylabel('Counts')
% xlabel('Bin')


% figure(2)
% plot(energies,kvals)
% title('Kurie attempt')
% xlabel('Energy [eV]')


ecut = energies(1000:1450);
kcut = kvals(1000:1450);
fit = fitlm(ecut,kcut);
int = table2array(fit.Coefficients(1,1));
m = table2array(fit.Coefficients(2,1));
upperBound = 2.121e6 - (-int/m);
fitvals = m*ecut+int;

fprintf('The Nobel Prize winning neutrino mass upper bound is: %0.0f eV\n', upperBound)


% figure(3)
% plot(ecut, kcut)
% hold on
% plot(ecut,m*ecut+int, 'r')
% title('Kurie Trim')
% xlabel('Energy [eV]')
% hold off
% 
end




