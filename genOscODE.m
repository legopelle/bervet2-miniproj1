function yout = genOscODE (t, y, b)

%% Parameters

alphaA = b(1);
alphapA = b(2);
alphaR = b(3);
alphapR = b(4);

betaA = b(5);
betaR = b(6);

deltaMA = b(7);
deltaMR = b(8);
deltaA = b(9);
deltaR = b(10);

gammaA = b(11);
gammaR = b(12);
gammaC = b(13);

thetaA = b(14);
thetaR = b(15);

%% Functions

DA = y(1);
DR = y(2);
DpA = y(3);
DpR = y(4);

MA = y(5);
A = y(6);

MR = y(7);
R = y(8);

C = y(9);

%% Output

yout = [ thetaA*DpA - gammaA*DA*A; ...
         thetaR*DpR - gammaR*DR*A; ...
         gammaA*DA*A - thetaA*DpA; ...
         gammaR*DR*A - thetaR*DpR; ...
         alphapA*DpA + alphaA*DA - deltaMA*MA; ...
         betaA*MA + thetaA*DpA + thetaR*DpR - ...
                A*(gammaA*DA + gammaR*DR+gammaC*R+deltaA); ...
         alphapR*DpR + alphaR*DR - deltaMR*MR; ...
         betaR*MR - gammaC*A*R + deltaA*C - deltaR*R; ...
         gammaC*A*R - deltaA*C ];


