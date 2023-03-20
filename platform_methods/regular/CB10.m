function[lny,sigma,tau,phi]=CB10(To,M,Rrup,Rjb,Ztor,dip,VS30,Z25,SOF,adjfun)
% Syntax : CB10 Z25 SOF                                                     

% Kenneth W. Campbell and Yousef Bozorgnia (2010) A Ground Motion
% Prediction Equation for the Horizontal Component of Cumulative Absolute
% Velocity (CAV) Based on the PEER-NGA Strong Motion Database.
% Earthquake Spectra: August 2010, Vol. 26, No. 3, pp. 635-650.
% https://doi.org/10.1193/1.3457158

isadmisible = imag(To)==0 && To==-4;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

switch SOF
    case 'strike-slip',     Frv = 0; Fnm=0;
    case 'normal',          Frv = 0; Fnm=1;
    case 'normal-oblique',  Frv = 0; Fnm=1;
    case 'reverse',         Frv = 1; Fnm=0;
    case 'reverse-oblique', Frv = 1; Fnm=0;
    case 'unspecified',     Frv = 0; Fnm=0; % assumption        
end

% CAV coefficients
c0 = -4.354;
c1 = 0.942;
c2 = -0.178;
c3 = -0.346;
c4 = -1.309;
c5 = 0.087;
c6 = 7.24;
c7 = 0.111;
c8 = -0.108;
c9 = 0.362;
c10= 2.549;
c11= 0.090;
c12= 1.277;
k1 = 400;
k2 = -2.690;
k3 = 1.0;
c  = 1.88;
n  = 1.18;

sigmalnAF = 0.3;
sigmalnCAVGM  = 0.371;
taulnCAVGM    = 0.196;

sigmalnPGA  = 0.478;
rho         = 0.735;

% Magnitude term for CAV
Fmag = c0+c1*M + c2*(M-5.5);
Fmag(M<=5.5)= c0+c1*M(M<=5.5);
Fmag(M>6.5) = c0+c1*M(M>6.5) + c2*(M(M>6.5)-5.5) + c3*(M(M>6.5)-6.5);

Fdis  = (c4 + c5*M).*log(sqrt(Rrup.^2+c6^2));
Ffltz = Ztor;
Ffltz(Ztor>=1)=1;
Fflt  = c7*Frv*Ffltz+c8*Fnm;


fhngR=zeros(size(M));
ind1 = (Rjb==0);
ind2 = and(Rjb>0,Ztor<1);  fval2 = (max(Rrup,sqrt(Rjb.^2+1))-Rjb)./max(Rrup,sqrt(Rjb.^2+1));
ind3 = and(Rjb>0,Ztor>=1); fval3 = (Rrup-Rjb)./Rrup;
fhngR(ind1) = 1;
fhngR(ind2) = fval2(ind2);
fhngR(ind3) = fval3(ind3);

% fhngR=fhngR*0+1;

fhngM=2*(M-6);
fhngM(M<=6)=0;
fhngM(M>=6.5)=1;
fhngZ=(20-Ztor)/20;
fhngZ(Ztor>=20)=0;
fhngdelta =( 90-abs(dip))/20;
fhngdelta(abs(dip)<=70)=1;
Fhng = c9.* fhngR.*fhngM.*fhngZ.*fhngdelta;

%% Shallow site response term for CAV
A1100 = PGA1100(M,Rrup,Rjb,Ztor,Z25,dip,Frv,Fnm);

if VS30<k1
    Fsite=c10*log(VS30/k1)+k2*(log(A1100+c*(VS30/k1).^n)-log(A1100+c));
elseif and(k1<=VS30,VS30<1100)
    Fsite=(c10+k2*n)*log(VS30/k1);
else
    Fsite=(c10+k2*n)*log(1100/k1);
end

if Z25<1
    Fsed = c11*(Z25-1);
elseif and(1<=Z25,Z25<=3)
    Fsed = 0;
elseif Z25>3
    Fsed = c12*k3*exp(-0.75)*(1-exp(-0.25*(Z25-3)));
end

%% Median GMPE general equation for CAV
lny = Fmag + Fdis + Fflt + Fhng + Fsite + Fsed;

if VS30<k1
    alpha = k2*A1100.*((A1100+c*(VS30/k1).^n).^(-1)-(A1100+c).^(-1));
elseif VS30>= k1
    alpha = 0;
end

sigmalnCAVGMB = sqrt(sigmalnCAVGM^2 - sigmalnAF^2);
sigmalnPGAB   = sqrt(sigmalnPGA^2   - sigmalnAF^2);

tau    = taulnCAVGM;
phi    = sqrt(sigmalnCAVGMB^2 + sigmalnAF^2 + alpha.^2*sigmalnPGAB^2 + 2*alpha*rho*sigmalnCAVGMB*sigmalnPGAB);
sigma  = sqrt(phi.^2+tau.^2);

% unit convertion
lny  = lny+log(980.66);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end


function [A1100] = PGA1100(M,Rrup,Rjb,Ztor,Z25,delta,Frv,Fnm)
%% PGA Coefficients
c0  = -1.715;
c1  = 0.500;
c2  = -0.530;
c3  = -0.262;
c4  = -2.118;
c5  = 0.170;
c6  = 5.60;
c7  = 0.280;
c8  = -0.120;
c9  = 0.490;
c10 = 1.058;
c11 = 0.040;
c12 = 0.610;
k1  = 865.00;
k2  = -1.186;
k3  = 1.839;
n   = 1.18;


Fmag = c0+c1*M + c2*(M-5.5);
Fmag(M<=5.5)= c0+c1*M(M<=5.5);
Fmag(M>6.5) = c0+c1*M(M>6.5) + c2*(M(M>6.5)-5.5) + c3*(M(M>6.5)-6.5);

Fdis  = (c4 + c5*M).*log(sqrt(Rrup.^2+c6^2));
Ffltz = Ztor;
Ffltz(Ztor>=1)=1;
Fflt  = c7*Frv*Ffltz+c8*Fnm;


fhngR=zeros(size(M));
ind1 = (Rjb==0);
ind2 = and(Rjb>0,Ztor<1);  fval2 = (max(Rrup,sqrt(Rjb.^2+1))-Rjb)./max(Rrup,sqrt(Rjb.^2+1));
ind3 = and(Rjb>0,Ztor>=1); fval3 = (Rrup-Rjb)./Rrup;
fhngR(ind1) = 1;
fhngR(ind2) = fval2(ind2);
fhngR(ind3) = fval3(ind3);

fhngM=2*(M-6);
fhngM(M<=6)=0;
fhngM(M>=6.5)=1;
fhngZ=(20-Ztor)/20;
fhngZ(Ztor>=20)=0;
fhngdelta =( 90-abs(delta))/20;
fhngdelta(abs(delta)<=70)=1;
Fhng = c9.* fhngR.*fhngM.*fhngZ.*fhngdelta;

Fsite =(c10+k2*n)*log(1100/k1);

if Z25<1
    Fsed = c11*(Z25-1);
elseif and(1<=Z25,Z25<=3)
    Fsed = 0;
elseif Z25>3
    Fsed = c12*k3*exp(-0.75)*(1-exp(-0.25*(Z25-3)));
end

%% Median Value
lnPGA = Fmag + Fdis + Fflt + Fhng + Fsite + Fsed;

A1100 = exp(lnPGA);