[kvals5,energies,b5,ecut,fitvals5] = kurie(data5minClean);
[kvals10,energies,b10,ecut,fitvals10] = kurie(data10minClean - data5minClean);
[kvals15,energies,b15 ,ecut,fitvals15] = kurie(data15minClean - data10minClean);
[kvals20,energies,b20 ,ecut,fitvals20] = kurie(data20minClean - data15minClean);
[kvals25,energies,b25 ,ecut,fitvals25] = kurie(data25minClean - data20minClean);
[kvals1Tot,energies,btot ,ecut,fitvals1Tot] = kurie(data25minClean);
[kvals125,energies,b125,ecut,fitvals125] = kurie(clean25);
[kvals35,energies,b35,ecut,fitvals35] = kurie(clean35 - clean25);
[kvals40,energies,b40,ecut,fitvals40] = kurie(clean40 - clean35);
[kvals45,energies,b45,ecut,fitvals45] = kurie(clean45 - clean40);
[kvals52,energies,b52,ecut,fitvals52] = kurie(clean52 - clean45);
[kFINAL,energies,bFINAL,ecut,fitvalsFINAL] = kurie(clean52);




figure(1)
plot(energies(1000:1600),kvals5(1000:1600),'r',energies(1000:1600),kvals10(1000:1600),'b',energies(1000:1600),kvals15(1000:1600),'g',energies(1000:1600),kvals20(1000:1600),'k',energies(1000:1600),kvals25(1000:1600),'y')
hold on
title('Kurie Plots of 5 min Activation')
xlabel('Energy [eV]')
legend('5min','10min','15min','20min','25min','Total')
plot(ecut,fitvals5,'k',ecut,fitvals10,'k',ecut,fitvals15,'k',ecut,fitvals20,'k',ecut,fitvals25,'k', 'LineWidth',2)
plot(2121000-b5,0,'ro',2121000-b10,0,'bo',2121000-b15,0,'go',2121000-b20,0,'ko',2121000-b25,0,'yo',2121000-btot,0,'mo')
plot([2121000 2121000],[0 7],'k')
hold off

figure(2)
plot(energies(1000:1600),kvals125(1000:1600),'r',energies(1000:1600),kvals35(1000:1600),'b',energies(1000:1600),kvals40(1000:1600),'g',energies(1000:1600),kvals45(1000:1600),'k',energies(1000:1600),kvals52(1000:1600),'y')
hold on
title('Kurie Plots of 10 min Activation')
xlabel('Energy [eV]')
legend('25min','35min','40min','45min','50min','Total')
plot(ecut,fitvals125,'k',ecut,fitvals35,'k',ecut,fitvals40,'k',ecut,fitvals45,'k',ecut,fitvals52,'k', 'LineWidth',2)
plot(2121000-b125,0,'ro',2121000-b35,0,'bo',2121000-b40,0,'go',2121000-b45,0,'ko',2121000-b52,0,'yo',2121000-bFINAL,0,'mo')
plot([2121000 2121000],[0 7],'k')
hold off
