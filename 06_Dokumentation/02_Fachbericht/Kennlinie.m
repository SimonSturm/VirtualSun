% Parameter der Solarzelle eingeben
Isc=3.09; Uoc=22; Ipmax=2.90; Upmax=18;

% Steigung M im Leerlaufpunkt berechnen
k1=-5.411; k2=6.450; k3=3.417; k4=-4.422;
M=Uoc/Isc*((k1*Ipmax*Upmax)/(Isc*Uoc)+(k2*Upmax)/Uoc+(k3*Ipmax)/Isc+k4)

% Solarzellenwiderstand Rpv berechnen
Rpv=-M*Isc/Ipmax+Upmax/Ipmax*(1-Isc/Ipmax)

% Temperaturspannung Ut berechnen
Ut=-(M+Rpv)*Isc

% Sperrstrom I0 berechnen
I0=Isc*exp(-Uoc/Ut)

% Photostrom Iph berechnen
Iph=Isc

% Kennlinie berechnen
I=linspace(0,3.09,10000);
U=Ut.*log((Iph-I+I0)./I0)-I.*Rpv;

% Kennlinie anzeigen
plot(U,I),grid on;
axis([0,25,0,3.5]);
title('Kennline der Solarzelle f(x)=I(U)');