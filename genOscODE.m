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
deltaB = b(10);

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
A = y(7);

MR = y(6);
R = y(8);

C = y(9);