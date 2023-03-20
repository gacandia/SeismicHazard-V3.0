function[lny,sigma,tau,phi]=CB19(To,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,width,VS30,Z25in,SOF,region,adjfun)

% Syntax : CB19 Z25 SOF region                                              
% Reference: Ground Motion Models for the Horizontal Components of Arias
% Intensity (AI) and Cumulative Absolute Velocity (CAV) Using
% the NGA-West2 Database. Kenneth W. Campbell,a) M.EERI,
% and Yousef Bozorgnia,b) M.EERI

isadmisible = imag(To)==0 && any(To==[-4 -5]);
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

[coef,rho1,rho2] = getcoefs(To);

switch SOF
    case 'strike-slip',     Frv = 0; Fnm=0;
    case 'normal',          Frv = 0; Fnm=1;
    case 'normal-oblique',  Frv = 0; Fnm=1;
    case 'reverse',         Frv = 1; Fnm=0;
    case 'reverse-oblique', Frv = 1; Fnm=0;
    case 'unspecified',     Frv = 0; Fnm=0; % assumption
end

switch region
    case 'global',     region=0; SJ=0; delta_c20 = 0;
    case 'california', region=1; SJ=0; delta_c20 = 0;
    case 'japan',      region=2; SJ=1; delta_c20 = coef(22);
    case 'china',      region=3; SJ=0; delta_c20 = coef(23);
    case 'italy',      region=4; SJ=0; delta_c20 = coef(22);
    case 'turkey',     region=5; SJ=0; delta_c20 = 0;
end

% if Ztor is unknown
if isnan(Ztor(1))
    if Frv == 1
        Ztor = max(2.704 - 1.226*max(M-5.849,0),0).^2;
    else
        Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2;
    end
end

% if W is unknown
if width == 999
    if Frv == 1
        Ztori = max(2.704 - 1.226*max(M-5.849,0),0).^2;
    else
        Ztori = max(2.673 - 1.136*max(M-4.970,0),0).^2;
    end
    width = min(sqrt(10.^((M-4.07)./0.98)),(Zbot - Ztori)./sin(pi/180*dip));
    Zhyp = 9*ones(size(M));
end

% if Zhyp is unknown
% if Zhyp(1) == 999 && width(1) ~= 999
%     fdZM=-4.317 + 0.984.*M;
%     fdZM(M>=6.75)=1.325;
%     if dip <= 40
%         fdZD = 0.0445*(dip-40);
%     else
%         fdZD = 0;
%     end
%     if Frv == 1
%         Ztori = max(2.704 - 1.226*max(M-5.849,0),0).^2;
%     else
%         Ztori = max(2.673 - 1.136*max(M-4.970,0),0).^2;
%     end
%     Zbor = Ztori + width.*sin(pi/180*dip); % The depth to the bottom of the rupture plane
%     d_Z = exp(min(fdZM+fdZD,log(0.9*(Zbor-Ztori))));
%     Zhyp = d_Z + Ztori;
% end

%%
c0 = coef(1);
c1 = coef(2);
c2 = coef(3);
c3 = coef(4);
c4 = coef(5);
c5 = coef(6);
c6 = coef(7);
c7 = coef(8);
c8 = coef(9);
c9 = coef(10);
c10 = coef(11);
c11 = coef(12);
c12 = coef(13);
c13 = coef(14);
c14 = coef(15);
c15 = coef(16);
c16 = coef(17);
c17 = coef(18);
c18 = coef(19);
c19 = coef(20);
c20 = coef(21);
h1 = coef(25);
h2 = coef(26);
h3 = coef(27);
h4 = coef(28);
h5 = coef(29);
h6 = coef(30);
a1 = coef(24);
a2 = a1;


% Magnitude Term
ind1 = (M<=4.5);            fmag1 = c0 + c1*M;
ind2 = and(M>4.5,M <= 5.5); fmag2 = c0 + c1*M + c2*(M-4.5);
ind3 = and(M>5.5,M <= 6.5); fmag3 = c0 + c1*M + c2*(M-4.5) + c3*(M-5.5);
ind4 = M>6.5;               fmag4 = c0 + c1*M + c2*(M-4.5) + c3*(M-5.5) + c4*(M-6.5);
fmag = zeros(size(M));
fmag(ind1)=fmag1(ind1);
fmag(ind2)=fmag2(ind2);
fmag(ind3)=fmag3(ind3);
fmag(ind4)=fmag4(ind4);
% Geometric Attenuation Term
fdis = (c5 + c6*M).*log(sqrt(Rrup.^2+c7^2));
fflt_F = c8*Frv + c9*Fnm;
ind1 = (M<4.5);
ind2 = and(M >4.5,M <= 5.5); val2 = M - 4.5;
ind3 = (M>4.5);
fflt_M = zeros(size(M));
fflt_M(ind1) = 0;
fflt_M(ind2) = val2(ind2);
fflt_M(ind3) = 1;
fflt = fflt_F .* fflt_M;
% Hanging Wall Term
R1 = width*cosd(dip);
R2 = 62*M-350;
f1_Rx=h1+h2*Rx./R1+h3*(Rx./R1).^2;
f2_Rx=max(h4+h5*(Rx-R1)./(R2-R1)+h6*((Rx-R1)./(R2-R1)).^2,0);
ind2 = and(Rx>=0,Rx<R1);
ind3 = (Rx>=R1);
fhng_Rx = zeros(size(M));
fhng_Rx(ind2)=f1_Rx(ind2);
fhng_Rx(ind3)=f2_Rx(ind3);
fhng_rup = (Rrup-Rjb)./Rrup;
fhng_rup(Rrup==0)=1;
ind2=and(M>5.5,M<=6.5); val2 = (M-5.5).*(1+a2*(M-6.5));
ind3=(M>6.5);           val3 = 1+a2*(M-6.5);
fhng_M=zeros(size(M));
fhng_M(ind2)=val2(ind2);
fhng_M(ind3)=val3(ind3);
fhng_Z=1-0.06*Ztor;
fhng_Z(Ztor>16.66)=0;
fhng_delta=(90-dip)/45;
fhng=c10*(fhng_Rx.*fhng_rup.*fhng_M.*fhng_Z)*fhng_delta;

%% Shallow Site Response Term
%*****************************************************************************
k1 = coef(31);
k2 = coef(32);
c  = coef(34);
n  = coef(35);

A1100=CB14_A1100(M,Rrup,Rjb,Rx,Zhyp,Ztor,dip,width,SOF,VS30,Z25in,region,999);

if VS30<=k1
    fsite_G=c11*log(VS30/k1)+k2*(log(A1100+c*(VS30/k1).^n)-log(A1100+c));
else
    fsite_G=(c11+k2*n)*log(VS30/k1);
end

if VS30<=200
    fsite_J=(c12+k2*n)*(log(VS30/k1)-log(200/k1));
else
    fsite_J=(c13+k2*n)*log(VS30/k1);
end

fsite = fsite_G+SJ*fsite_J;

%% Basin Response Term
if isnan(Z25in)
    if region ~= 2  % if in California or other locations
        if A1100==999
            Z25in = exp(7.089 - 1.144 * log(VS30));
        else
            Z25in = exp(7.089 - 1.144 * log(1100));
        end
    elseif region == 2  % if in Japan
        if A1100==999
            Z25in = exp(5.359 - 1.102 * log(VS30));
        else
            Z25in = exp(5.359 - 1.102 * log(1100));
        end
    end
else
    % Assign Z2.5 from user input into Z25 and calc Z25A for Vs30=1100m/s
    if region ~= 2  % if in California or other locations
        if A1100(1)==999
            %Z25in = Z25in;
        else
            Z25in = exp(7.089 - 1.144 * log(1100));
        end
    elseif region == 2  % if in Japan
        if A1100(1)==999
            %Z25in = Z25in;
        else
            Z25in = exp(5.359 - 1.102 * log(1100));
        end
    end
end

if isnan(Z25in)
    fsed=0;
elseif Z25in<=1
    fsed=(c14+c15*SJ)*(Z25in-1);
elseif Z25in>1 &&Z25in<=3
    fsed=0;
elseif Z25in>3
    k3 = c_coef(33);
    fsed=c16*k3*exp(-0.75)*(1-exp(-0.25*(Z25in-3)));
end

%% Hypocentral Depth Term
fhyph = zeros(size(M));
ind2 = and(Zhyp > 7,Zhyp <= 20); fhyph(ind2)=Zhyp(ind2)-7;
ind3 = (Zhyp > 20);              fhyph(ind3)=13;

ind1 = (M<=5.5);
ind2 = and(M > 5.5,M<=6.5);
ind3 = (M>6.5);
fhypm = zeros(size(M));
fhypm(ind1) = c17;
fhypm(ind2) = c17+(c18-c17)*(M(ind2)-5.5);
fhypm(ind3) = c18;
fhyp = fhyph.*fhypm;

%% Fault Dip Term
fdip = c19*(5.5-M)*dip;
fdip(M<=4.5)=c19*dip;
fdip(M> 5.5)=0;

%% Anelastic Attenuation Term
fatn=(c20+delta_c20)*(Rrup-80);
fatn(Rrup<=80)=0;

%% standard deviation
phi1IM = coef(37);
phi2IM = coef(38);
tau1IM = coef(39);
tau2IM = coef(40);

phi1PG=0.734;
phi2PG=0.492;
tau1PG=0.409;
tau2PG=0.322;


tauIM  = tau2IM + (tau1IM-tau2IM)*(5.5-M);
tauPG  = tau2PG + (tau1PG-tau2PG)*(5.5-M);
phiIM  = phi2IM + (phi1IM-phi2IM)*(5.5-M);
phiPG  = phi2PG + (phi1PG-phi2PG)*(5.5-M);
rho    = rho2   + (rho1-rho2)    *(5.5-M);

tauIM(M<=4.5)=tau1IM;
tauPG(M<=4.5)=tau1PG;
phiIM(M<=4.5)=phi1IM;
phiPG(M<=4.5)=phi1PG;
rho  (M<=4.5)=rho1;

tauIM(M>=5.5)=tau2IM;
tauPG(M>=5.5)=tau2PG;
phiIM(M>=5.5)=phi2IM;
phiPG(M>=5.5)=phi2PG;
rho  (M>=5.5)=rho2;

if VS30<k1
    alpha=k2*A1100.*((A1100+c*(VS30/k1).^n).^(-1)-(A1100+c).^(-1));
else
    alpha=zeros(size(A1100));
end

tau=sqrt(tauIM.^2+alpha.^2.*tauPG.^2+2*alpha.*rho.*tauIM.*tauPG);
%fi=sqrt(fi_ln_CAV^2+fi_lnAF_CAV^2+alpha^2*fi_ln_PGA^2+2*alpha*rou*fi_ln_CAV*fi_ln_PGA);
phi=sqrt(phiIM.^2+alpha.^2.*phiPG.^2+2*alpha.*rho.*phiIM.*phiPG);

%% final result
lny   = fmag + fdis+fflt+fhng+fsite+fsed+fhyp+fdip+fatn;
sigma = sqrt(tau.^2+phi.^2);

% unit convertion
lny  = lny+log(100);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

end


%**************************************************************
% CB14
%**************************************************************
% W (km) is the down-dip width of the fault rupture plane.
% M = Magnitude
% Rrup (km) is closest distance to the coseismic fault rupture plane (a.k.a. rupture distance).
% delta or ? (°) is the average dip angle of the fault rupture plane measured from horizontal.
% FRV is an indicator variable representing reverse and reverse-oblique faulting, where FRV = 1for 30°<?<150°andFRV =0 otherwise.
% FNM is an indicator variable representing normal and normal-oblique faulting, where FNM 1?4 1 for 150° < ? < 30° and FNM 1?4 0 otherwise.
% Rx (km) is closest distance to the surface projection of the top edge of the coseismic fault rupture plane measured perpendicular to its average strike (Ancheta et al. 2013).
% SJ is an indicator variable representing regional site effects, where SJ 1?4 1 for sites located in Japan and SJ 1?4 0 otherwise.

function [A1100]= CB14_A1100(M,Rrup,Rjb,Rx,Zhyp,Ztor,delta,W,SOF,Vs30,Z25in,region,A1100)

switch SOF
    case 'strike-slip',     Frv = 0; Fnm=0;
    case 'normal',          Frv = 0; Fnm=1;
    case 'normal-oblique',  Frv = 0; Fnm=1;
    case 'reverse',         Frv = 1; Fnm=0;
    case 'reverse-oblique', Frv = 1; Fnm=0;
    case 'unspecified',     Frv = 0; Fnm=0; % assumption        
end


coef = getcoefs(0);
switch region
    case 0, SJ=0; delta_c20 = 0;
    case 1, SJ=0; delta_c20 = 0;
    case 2, SJ=1; delta_c20 = coef(22);
    case 3, SJ=0; delta_c20 = coef(23);
    case 4, SJ=0; delta_c20 = coef(22);
    case 5, SJ=0; delta_c20 = 0;
end



c0 = coef(1);
c1 = coef(2);
c2 = coef(3);
c3 = coef(4);
c4 = coef(5);
c5 = coef(6);
c6 = coef(7);
c7 = coef(8);
c8 = coef(9);
c9 = coef(10);
c10 = coef(11);
c11 = coef(12);
c12 = coef(13);
c13 = coef(14);
c14 = coef(15);
c15 = coef(16);
c16 = coef(17);
c17 = coef(18);
c18 = coef(19);
c19 = coef(20);
c20 = coef(21);
h1 = coef(25);
h2 = coef(26);
h3 = coef(27);
h4 = coef(28);
h5 = coef(29);
h6 = coef(30);
a1 = coef(24);
a2 = a1;


% Magnitude Term
ind1 = (M<=4.5);            fmag1 = c0 + c1*M;
ind2 = and(M>4.5,M <= 5.5); fmag2 = c0 + c1*M + c2*(M-4.5);
ind3 = and(M>5.5,M <= 6.5); fmag3 = c0 + c1*M + c2*(M-4.5) + c3*(M-5.5);
ind4 = M>6.5;               fmag4 = c0 + c1*M + c2*(M-4.5) + c3*(M-5.5) + c4*(M-6.5);
fmag = zeros(size(M));
fmag(ind1)=fmag1(ind1);
fmag(ind2)=fmag2(ind2);
fmag(ind3)=fmag3(ind3);
fmag(ind4)=fmag4(ind4);
% Geometric Attenuation Term
fdis = (c5 + c6*M).*log(sqrt(Rrup.^2+c7^2));
fflt_F = c8*Frv + c9*Fnm;
ind1 = (M<4.5);
ind2 = and(M >4.5,M <= 5.5); val2 = M - 4.5;
ind3 = (M>4.5);
fflt_M = nan(size(M));
fflt_M(ind1) = 0;
fflt_M(ind2) = val2(ind2);
fflt_M(ind3) = 1;
fflt = fflt_F .* fflt_M;
% Hanging Wall Term
R1 = W*cosd(delta);
R2 = 62*M-350;
f1_Rx=h1+h2*Rx./R1+h3*(Rx./R1).^2;
f2_Rx=max(h4+h5*(Rx-R1)./(R2-R1)+h6*((Rx-R1)./(R2-R1)).^2,0);
ind2 = and(Rx>=0,Rx<R1);
ind3 = (Rx>=R1);
fhng_Rx = zeros(size(M));
fhng_Rx(ind2)=f1_Rx(ind2);
fhng_Rx(ind3)=f2_Rx(ind3);
fhng_rup = (Rrup-Rjb)./Rrup;
fhng_rup(Rrup==0)=1;
ind2=and(M>5.5,M<=6.5); val2 = (M-5.5).*(1+a2*(M-6.5));
ind3=(M>6.5);           val3 = 1+a2*(M-6.5);
fhng_M=zeros(size(M));
fhng_M(ind2)=val2(ind2);
fhng_M(ind3)=val3(ind3);
fhng_Z=1-0.06*Ztor;
fhng_Z(Ztor>16.66)=0;
fhng_delta=(90-delta)/45;
fhng=c10*(fhng_Rx.*fhng_rup.*fhng_M.*fhng_Z)*fhng_delta;


%% Shallow Site Response Term
k1 = coef(31);
k2 = coef(32);
n  = coef(35);
fsite_G=(c11+k2*n)*log(Vs30/k1);
fsite_J=(c13+k2*n)*log(Vs30/k1);
fsite = fsite_G+SJ*fsite_J;

%% Basin Response Term
if isnan(Z25in)
    if region ~= 2  % if in California or other locations
        if A1100==999
            Z25in = exp(7.089 - 1.144 * log(Vs30));
        else
            Z25in = exp(7.089 - 1.144 * log(1100));
        end
    elseif region == 2  % if in Japan
        if A1100==999
            Z25in = exp(5.359 - 1.102 * log(Vs30));
        else
            Z25in = exp(5.359 - 1.102 * log(1100));
        end
    end
else
    % Assign Z2.5 from user input into Z25 and calc Z25A for Vs30=1100m/s
    if region ~= 2  % if in California or other locations
        if A1100(1)==999
            Z25in = Z25in;
        else
            Z25in = exp(7.089 - 1.144 * log(1100));
        end
    elseif region == 2  % if in Japan
        if A1100(1)==999
            Z25in = Z25in;
        else
            Z25in = exp(5.359 - 1.102 * log(1100));
        end
    end
end

if isnan(Z25in)
    fsed=0;
elseif Z25in<=1
    fsed=(c14+c15*SJ)*(Z25in-1);
elseif Z25in>1 &&Z25in<=3
    fsed=0;
elseif Z25in>3
    k3 = coef(33);
    fsed=c16*k3*exp(-0.75)*(1-exp(-0.25*(Z25in-3)));
end

%% Hypocentral Depth Term
fhyph = zeros(size(M));
ind2 = and(Zhyp > 7,Zhyp <= 20); fhyph(ind2)=Zhyp(ind2)-7;
ind3 = (Zhyp > 20);              fhyph(ind3)=13;

ind1 = (M<=5.5);
ind2 = and(M > 5.5,M<=6.5);
ind3 = (M>6.5);
fhypm = zeros(size(M));
fhypm(ind1) = c17;
fhypm(ind2) = c17+(c18-c17)*(M(ind2)-5.5);
fhypm(ind3) = c18;
fhyp = fhyph.*fhypm;

%% Fault Dip Term
fdip = c19*(5.5-M)*delta;
fdip(M<=4.5)=c19*delta;
fdip(M> 5.5)=0;

%% Anelastic Attenuation Term
fatn=(c20+delta_c20)*(Rrup-80);
fatn(Rrup<=80)=0;

%%
A1100 = exp(fmag + fdis + fflt + fhng + fsite + fsed + fhyp + fdip + fatn);


end

function [coefs,rho1,rho2] = getcoefs(T)

data=[-10.272	-4.75	-4.416
    2.318	1.397	0.984
    0.88	0.282	0.537
    -2.672	-1.062	-1.499
    -0.837	-0.17	-0.496
    -4.441	-1.624	-2.773
    0.416	0.134	0.248
    4.869	6.325	6.768
    0.187	0.054	0
    -0.196	-0.1	-0.212
    1.165	0.469	0.72
    1.596	1.015	1.09
    2.829	1.208	2.186
    2.76	1.777	1.42
    0.1081	0.1248	-0.0064
    -0.315	-0.191	-0.202
    1.612	1.087	0.393
    0.1311	0.0432	0.0977
    0.0453	0.0127	0.0333
    0.01242	0.00429	0.00757
    -0.0103	-0.0043	-0.0055
    -0.0051	-0.0024	-0.0035
    0.0064	0.0027	0.0036
    0.167	0.167	0.167
    0.241	0.241	0.241
    1.474	1.474	1.474
    -0.715	-0.715	-0.715
    1	1	1
    -0.337	-0.337	-0.337
    -0.27	-0.27	-0.27
    400	400	865
    -1.982	-1.311	-1.186
    1	1	1.839
    1.88	1.88	1.88
    1.18	1.18	1.18
    0.616	0.3	0.3
    1.174	0.514	0.734
    0.809	0.394	0.492
    0.614	0.276	0.409
    0.435	0.257	0.322
    1.325	0.583	0.84
    0.919	0.47	0.588
    0.913	0.927	0.871
    0.936	0.948	0.903
    -11232	-5382	-7621
    22505	10806	15284
    22650	10950	15429
    22463	10764	15242
    ];

switch T
    case -5 , coefs=data(:,1); rho1=0.948; rho2=0.911; %AI
    case -4 , coefs=data(:,2); rho1=0.842; rho2=0.780; %CAV
    case  0 , coefs=data(:,3); rho1=1.000; rho2=1.000; % PGARotD50
end
end
