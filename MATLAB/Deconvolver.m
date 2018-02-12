function [deconvolved]=Deconvolver(spectrumdata,resolutionchannel)

Calibfit=[1.371875050518483e3,-4.576592842183955e03];
energy=1:2048;
energy=energy*Calibfit(1)+Calibfit(2);

rescoeff=[31.588870359885973,7.128143603764032e02];

Resfunc=rescoeff(1)*sqrt(energy)+rescoeff(2);

Gauss=1/(sqrt(2*pi*Resfunc(resolutionchannel)^2))*exp(-1*(energy-energy(resolutionchannel)).^2/(2*Resfunc(resolutionchannel)^2));
Gauss(isnan(Gauss))=0.000001;

rf=fft(Gauss(300:end));
datf=fft(spectrumdata(300:end));
datclean=datf/rf';
datclean(isinf(datclean))=0;
deconvolved=ifft(datclean);

end