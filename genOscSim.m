%Kommandofil för simuleringen av den genetiska oscillatorn
clear all;
close all;
clc;

%Tidsintervall (timmar)
starttid = 0;
sluttid = 200;
tidsintervall = [starttid,sluttid];

%Parametrar (alla har enhet h^(-1), utom gammavariablerna som 
%istället har mol^(-1) h^(-1) )
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

%En allokerad vektor som innehåller problemets samtliga 
%parametrar, samt elementens betydelser
b = zeros(15,1);
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

%Lösning av ODE med explicit metod
tic
[t,y] = ode45(fun,tidsintervall,y0);
ode45 = toc
steg45 = ode45/length(t);
disp(['Tidsåtgång per steg: ',num2str(steg45)])

%Lösning av ODE med implicit metod
tic
[s,z] = ode15s(fun,tidsintervall,y0);
ode15s = toc
steg15s = ode15s/length(s);
disp(['Tidsåtgång per steg: ',num2str(steg15s)])

plot(t,y(:,6));
hold on
plot(t, y(:,8));
hold off
title('Genetisk oscillator')
xlabel('Tid (h)')
ylabel('Antal molekyler (mol)')
legend('A','R')

%figure;
%plot(s,z(:,6));
%hold on
%plot(s,z(:,8));
%hold off

figure;
subplot(2,1,1);
plot(t(1:end-1),diff(t));
xlabel('Tid (h)')
ylabel('Steglängd')
legend('ode45','Location','NorthEast')
subplot(2,1,2);
plot(s(1:end-1),diff(s));
xlabel('Tid (h)')
ylabel('Steglängd')
legend('ode15s','Location','NorthEast')