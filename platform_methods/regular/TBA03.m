function[lny,sigma,tau,phi]=TBA03(To,M,Rrup,classSGS,SOF,adjfun)
% Syntax : TBA03 SGSCLASS SOF                                               

% Travasarou, T., Bray, J. D., & Abrahamson, N. A. (2003). Empirical 
% attenuation relationship for Arias intensity. Earthquake engineering &
% structural dynamics, 32(7), 1133-1155.
% DOI: https://doi.org/10.1002/eqe.270

isadmisible = imag(To)==0 && To==-5;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

% model coefficients
c1      = 2.800;
c2      =-1.981;
c3      =20.72;
c4      =-1.703;
h       =8.78;
s11     =0.454;
s12     =0.101;
s21     =0.479;
s22     =0.334;
f1      =-0.166;
f2      =0.512;

switch SOF % SGS site category 
    case 'strike-slip',     FN = 0; FR = 0; 
    case 'normal',          FN = 1; FR = 0; 
    case 'normal-oblique',  FN = 1; FR = 0; 
    case 'reverse',         FN = 0; FR = 1; 
    case 'reverse-oblique', FN = 0; FR = 1;
    case 'unspecified',     FN = 0; FR = 0; % assumption
end

switch classSGS % SGS site category 
    case 1, SC = 0; SD = 0; phi1 = 1.18;  phi2 = 0.94; %b
    case 2, SC = 1; SD = 0; phi1 = 1.17;  phi2 = 0.93; %c
    case 3, SC = 0; SD = 1; phi1 = 0.96;  phi2 = 0.73; %d
end

lny = c1 + c2*(M-6) + c3 * log(M/6) + c4*log(sqrt(Rrup.^2+h^2)) + (s11+s12*(M-6))*SC + (s21+s22*(M-6))*SD + f1*FN + f2*FR;
Ia  = exp(lny); %Measured in m/s

phi = phi1-0.106*(log(Ia)-log(0.0132));
phi(Ia<=0.013) = phi2;
phi(Ia>=0.125) = phi2;

tau   = 0.611 - 0.047*(M-4.7);
sigma = sqrt(phi.^2+tau.^2);   %Total error

% unit convertion
lny  = lny+log(100);
 
% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end



