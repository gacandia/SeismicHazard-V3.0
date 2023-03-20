function[lny,sigma,tau,phi]=FG15(To,M,Rrup,Zhyp,Vs30,SOF,arc,regtype,adjfun)
% Syntax : FG15 SOF forearc rtype                                           

% Foulser-Piggott, R., & Goda, K. (2015). Ground?motion prediction models
% for Arias intensity and cumulative absolute velocity for Japanese
% earthquakes considering single?station sigma and within?event spatial
% correlation. Bulletin of the Seismological Society of America, 105(4), 1903-1918.
% DOI: https://doi.org/10.1785/0120140316

isadmisible = imag(To)==0 && any(To==[-4 -5]);
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

% random effect term
e1=0;

Fintraslab=0;
Finterface=0;
switch SOF
    case 'intraslab'                    ,  Frv=0;  Fnm=0; Finterface=0; Fintraslab=1;
    case 'interface'                    ,  Frv=0;  Fnm=0; Finterface=1;
    case {'strike-slip','unspecified'}  ,  Frv=0;  Fnm=0;
    case {'reverse','reverse-oblique'}  ,  Frv=1;  Fnm=0;
    case {'normal','normal-oblique'}    ,  Frv=0;  Fnm=1;
end

Frfa=0; Frba=0;
switch arc
    case 'forearc', Frfa=1;
    case 'backarc', Frba=1;       
end

switch sprintf('%s%g',lower(regtype),To)
    case 'linear-5'
        c0=3.056224;
        c1=2.639315;
        c2=-2.352244;
        c3=-0.080591;
        c4=12.682338;
        c5=0.009653;
        c6=-0.001436;
        c7=-0.006374;
        c8=1.869827;
        c9=1.639023;
        c10=0.573052;
        c11=1.856785;
        v1=-1.030608;
        tau=0.9015;
        phi=1.035;
        
        lnIref = c0+c1*(M-5)+(c2+c3*M).*log(sqrt(Rrup.^2+c4^2)) + c5*max(Zhyp-30,0) + (c6*Frfa + c7*Frba)*Rrup + c8*Fintraslab + c9*Finterface + c10*Frv + c11*Fnm;
        lny   = lnIref + e1 + v1*log(Vs30/1100);
        
    case 'linear-4'
        c0 = 2.643261;
        c1 = 1.60688;
        c2 = -0.754765;
        c3 = -0.072283;
        c4 = 12.626135;
        c5 = 0.003811;
        c6 = -0.00059;
        c7 = -0.002767;
        c8 = 0.877694;
        c9 = 0.822831;
        c10= 0.86527;
        c11= 0.918286;
        v1 = -0.65776;
        tau = 0.4114;
        phi = 0.4900;
        
        lnIref = c0+c1*(M-5)+(c2+c3*M).*log(sqrt(Rrup.^2+c4^2)) + c5*max(Zhyp-30,0) + (c6*Frfa + c7*Frba)*Rrup + c8*Fintraslab + c9*Finterface + c10*Frv + c11*Fnm;
        lny   = lnIref + e1 + v1*log(Vs30/1100);
        
    case 'nonlinear-5'
        c0 = 2.16574;
        c1 = 3.508756;
        c2 = -1.294525;
        c3 = -0.256147;
        c4 = 7.244428;
        c5 = 0.009592;
        c6 = -0.001819;
        c7 = -0.006795;
        c8 = 1.886186;
        c9 = 1.650818;
        c10= 0.570372;
        c11= 1.854696;
        v1 = -1.060057;
        v2 = -0.629392;
        v3 = -0.006856;
        v4 = 0.346117;
        tau = 0.9082;
        phi = 1.0328;
        
        lnIref = c0+c1*(M-5)+(c2+c3*M).*log(sqrt(Rrup.^2+c4^2)) + c5*max(Zhyp-30,0) + (c6*Frfa + c7*Frba)*Rrup + c8*Fintraslab + c9*Finterface + c10*Frv + c11*Fnm;
        lny   = lnIref + e1 + v1*log(Vs30/1100) + v2*(exp(v3*(min(Vs30,1100)-280))-exp(v3*(1100-280)))*log((exp(lnIref+e1)+v4)/v4);
       
    case 'nonlinear-4'
        c0 = 2.47814;
        c1 = 1.799346;
        c2 = -0.539751;
        c3 = -0.109694;
        c4 = 11.47;2109;
        c5 = 0.003831;
        c6 = -0.000685;
        c7 = -0.002882;
        c8 = 0.882441;
        c9 = 0.826529;
        c10= 0.285578;
        c11= 0.916566;
        v1 = -0.686706;
        v2 = -0.229981;
        v3 = -0.015479;
        v4 = 15.85;
        tau = 0.4149;
        phi = 0.4893;
        
        lnIref = c0+c1*(M-5)+(c2+c3*M).*log(sqrt(Rrup.^2+c4^2)) + c5*max(Zhyp-30,0) + (c6*Frfa + c7*Frba)*Rrup + c8*Fintraslab + c9*Finterface + c10*Frv + c11*Fnm;
        lny   = lnIref + e1 + v1*log(Vs30/1100) + v2*(exp(v3*(min(Vs30,1100)-280))-exp(v3*(1100-280)))*log((exp(lnIref+e1)+v4)/v4);
    
end

sigma = sqrt(phi.^2+tau.^2);

% unit convertion
lny  = lny+log(100);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

