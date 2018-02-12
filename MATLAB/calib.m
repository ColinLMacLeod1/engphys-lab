addpath('D:\Documents\school\4\ENPH 453\Data');
Co60=xlsread('D:\Documents\school\4\ENPH 453\Data\60Co.xlsx');
Cs137=xlsread('D:\Documents\school\4\ENPH 453\Data\137cs.xlsx');
Ba133=xlsread('D:\Documents\school\4\ENPH 453\Data\133Ba_1.xlsx');
Bi207=xlsread('D:\Documents\school\4\ENPH 453\Data\207Bi.xlsx');
Na22=xlsread('D:\Documents\school\4\ENPH 453\Data\22Na.xlsx');
Na22_1=xlsread('D:\Documents\school\4\ENPH 453\Data\22Na_1.xlsx');
ThO2=xlsread('D:\Documents\school\4\ENPH 453\Data\ThO2.xlsx');
ThO2_1=xlsread('D:\Documents\school\4\ENPH 453\Data\ThO2_1.xlsx');
load('D:\Documents\school\4\ENPH 453\Trial1CleanData.mat');

tCo60=519;
tCs137=203;
tBi207=2567;
tBa133=410;
tNa22=152;
tNa22_1=609;
tThO2=861;
tThO2_1=704;

Co60=Co60(1:2048);
Co60=Co60-bgnorm*tCo60;
Cs137=Cs137(1:2048);
Cs137=Cs137-bgnorm*tCs137;
Bi207=Bi207(1:2048);
Bi207=Bi207-bgnorm*tBi207;
Ba133=Ba133(1:2048);
Ba133=Ba133-bgnorm*tBa133;
Na22=Na22(1:2048);
Na22=Na22-bgnorm*tNa22;
Na22_1=Na22_1(1:2048);
Na22_1=Na22_1-bgnorm*tNa22_1;
ThO2=ThO2(1:2048);
ThO2=ThO2-bgnorm*tThO2;
ThO2_1=ThO2_1(1:2048);
ThO2_1=ThO2_1-bgnorm*tThO2_1;

Co60p1=Co60(820:920);
Co60binp1=820:920;
[fCo1,~]=Gaussianfit(Co60binp1,Co60p1);
coeffCo1=coeffvalues(fCo1);
peak(1)=coeffCo1(2);
ciCo1=confint(fCo1,0.68);
Errpeak1=ciCo1(2,2)-peak(1);
res(1)=coeffCo1(3);
E(1)=1.17e6;

Co60p2=Co60(920:1040);
Co60binp2=920:1040;
[fCo2,~]=Gaussianfit(Co60binp2,Co60p2);
coeffCo2=coeffvalues(fCo2);
peak(2)=coeffCo2(2);
ciCo2=confint(fCo2,0.68);
Errpeak2=ciCo2(2,2)-peak(2);
res(2)=coeffCo2(3);
E(2)=1.33e6;

Cs137p1=Cs137(430:540);
Cs137binp1=430:540;
[fCs1,~]=Gaussianfit2(Cs137binp1,Cs137p1);
coeffCs1=coeffvalues(fCs1);
peak(3)=coeffCs1(2);
ciCs1=confint(fCs1,0.68);
Errpeak3=ciCs1(2,2)-peak(3);
res(3)=coeffCs1(3);
E(3)=661e3;

Bi207p1=Bi207(370:450);
Bi207binp1=370:450;
[fBi1,~]=Gaussianfit2(Bi207binp1,Bi207p1);
coeffBi1=coeffvalues(fBi1);
peak(4)=coeffBi1(2);
ciBi1=confint(fBi1,0.68);
Errpeak4=ciBi1(2,2)-peak(4);
res(4)=coeffBi1(3);
E(4)=569e3;

Bi207p2=Bi207(725:810);
Bi207binp2=725:810;
[fBi2,~]=Gaussianfit(Bi207binp2,Bi207p2);
coeffBi2=coeffvalues(fBi2);
peak(5)=coeffBi2(2);
ciBi2=confint(fBi2,0.68);
Errpeak5=ciBi2(2,2)-peak(5);
res(5)=coeffBi2(3);
E(5)=1063e3;

Na22p1=Na22_1(880:975);
Na22binp1=880:975;
[fNa1,~]=Gaussianfit(Na22binp1,Na22p1);
coeffNa1=coeffvalues(fNa1);
peak(6)=coeffNa1(2);
ciNa1=confint(fNa1,0.68);
Errpeak6=ciNa1(2,2)-peak(6);
res(6)=coeffNa1(3);
E(6)=1274e3;

ThO2p1=ThO2(1860:1950);
ThO2binp1=1860:1950;
[fThO,~]=Gaussianfit3(ThO2binp1,ThO2p1);
coeffThO=coeffvalues(fThO);
peak(7)=coeffThO(2);
ciThO=confint(fThO,0.68);
Errpeak7=ciThO(2,2)-peak(7);
res(7)=coeffThO(3);
E(7)=2614e3;

% ThO2p2=ThO2_1(1860:1960);
% ThO2binp2=1860:1960;
% [fThO2,~]=Gaussianfit3(ThO2binp2,ThO2p2);
% coeffThO2=coeffvalues(fThO2);
% peak(8)=coeffThO2(2);
% ciThO2=confint(fThO2,0.68);
% Errpeak8=ciThO2(2,2)-peak(8);
% res(8)=coeffThO2(3);
% E(8)=2614e3;

figure(1)
plot(peak,E,'*')
hold on
Calibfit=polyfit(peak,E,1);
energy=1:2048;
energy=energy*Calibfit(1)+Calibfit(2);
resolutions=res*Calibfit(1)+Calibfit(2);
plot(1:2048,energy)
hold off

figure(2)
plot(E,resolutions,'*')

resfit=polyfit(E,resolutions,1);
Response=energy*resfit(1)+resfit(2);
hold on
plot(energy,Response)