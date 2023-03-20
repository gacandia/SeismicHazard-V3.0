function[lny,sigma,tau,phi]=CB11(To,M,Rrup,Rjb,Ztor,dip,VS30,Z25,SOF,Database,adjfun)
% Syntax : CB11 Z25 SOF Database                                            

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

switch lower(Database)
    case 'cb08-nga-psv'  , c0=0.0691; c1=1.151; c2=-0.173; c3=-0.00265; siglnCAVDP=0.446; taulnCAVDP=0.247;
    case 'cb08-nga-nopsv', c0=0.0666; c1=1.137; c2=-0.138; c3=-0.00304; siglnCAVDP=0.435; taulnCAVDP=0.246;
    case 'peer-nga-psv'  , c0=0.0072; c1=1.115; c2=-0.067; c3=-0.00330; siglnCAVDP=0.439; taulnCAVDP=0.247;
    case 'peer-nga-nopsv', c0=0.0152; c1=1.105; c2=-0.044; c3=-0.00369; siglnCAVDP=0.430; taulnCAVDP=0.245;
end

switch SOF
    case 'strike-slip',     Frv = 0; Fnm=0;
    case 'normal',          Frv = 0; Fnm=1;
    case 'normal-oblique',  Frv = 0; Fnm=1;
    case 'reverse',         Frv = 1; Fnm=0;
    case 'reverse-oblique', Frv = 1; Fnm=0;
    case 'unspecified',     Frv = 0; Fnm=0; % assumption        
end

[lnCAVGMmeters,~,taulnCAVGM,siglnCAVGM] = CB10(To,M,Rrup,Rjb,Ztor,dip,VS30,Z25,SOF);
lnCAVGM = lnCAVGMmeters - log(980.66); % in units of g*sec

lny     = c0 + c1*lnCAVGM+c2*(M-6.5).*heaviside(M-6.5)+c3*Rrup;

siglnPGA    = 0.478;  % Table 1 from Campbell & Bozorgnia, 2010
siglnAF     = 0.3;    % Table 1 from Campbell & Bozorgnia, 2010
rhoCAVGMPGA = 0.735;  % Table 1 from Campbell & Bozorgnia, 2010

siglnCAVGMB = (siglnCAVGM.^2-siglnAF^2).^0.5;
siglnPGAB   = (siglnPGA^2   -siglnAF^2).^0.5;


A1100 = PGA1100(M,Rrup,Rjb,Ztor,Z25,dip,Frv,Fnm);
k1    = 400;
k2    = -2.690;
c     = 1.88;
n     = 1.18;
if VS30<k1
    alfa = k2*A1100.*((A1100+c*(VS30/k1).^n).^(-1)-(A1100+c).^(-1));
elseif VS30>= k1
    alfa = zeros(size(M));
end

tau   = (taulnCAVDP+c1^2*taulnCAVGM.^2).^0.5*ones(size(M));
phi   = (siglnCAVDP^2+c1^2*(siglnCAVGMB.^2+siglnAF^2+alfa.^2*siglnPGAB)+2*rhoCAVGMPGA*(alfa.*siglnCAVGMB)*siglnPGAB).^0.5;
sigma = sqrt(tau.^2+phi.^2); 

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
