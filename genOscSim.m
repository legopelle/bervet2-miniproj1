%Kommandofil för simuleringen av den genetiska oscillatorn
%Nathalie 2015-01-30

clear all;

%Tidsintervall (timmar)
starttid = 0;
sluttid = 200;
tidsintervall = [starttid,sluttid];

%Parametrar (alla utom har enhet h^(-1), utom gammavariablerna som istället
%har mol^(-1) h^(-1) )
alphaA = 50;
alphapA = 500;
alphaR = 0.01;
alphapR = 50;
betaA = 50;
betaR = 5;
deltaMA = 10;
deltaMR = 0.5;
deltaA = 1;
deltaR = 0.2;
%deltaR = 0.08;
gammaA = 1;
gammaR = 1;
gammaC = 2;
thetaA = 50;
thetaR = 100;

%En allokerad vektor som innehåller problemets samtliga parametrar, samt 
%elementens betydelser
b = zeros(15);
b(1) = alphaA;
b(2) = alphapA;
b(3) = alphaR;
b(4) = alphapR;
b(5) = betaA;
b(6) = betaR;
b(7) = deltaMA;
b(8) = deltaMR;
b(9) = deltaA;
b(10) = deltaR;
b(11) = gammaA;
b(12) = gammaR;
b(13) = gammaC;
b(14) = thetaA;
b(15) = thetaR;

%Begynnelsevärden (enhet mol)
DA = 1;
DR = 1;
DpA = 0;
DpR = 0;
MA = 0;
A = 0;
MR = 0;
R = 0;
C = 0;
y0 = [DA;DR;DpA;DpR;MA;A;MR;R;C];

%Omskrivning av högerledsfunktionerna
fun = @(t,y)(genOscODE(t,y,b));

%Lösning av ODE
[t,y] = ode45(fun,tidsintervall,y0);

plot(t,y);

