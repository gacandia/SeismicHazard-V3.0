function[lny,sigma,tau,phi]=Arteta2023SC(To,M,Rrup,Rvolc,Zhyp,Tn,P,adjfun)

% Arteta, C. A., Pajaro, C. A., Mercado, V., Montejo, J., Arcila, M., &
% Abrahamson, N. A. (2023). Ground‐Motion Model (GMM) for Crustal
% Earthquakes in Northern South America (NoSAm Crustal GMM).
% Bulletin of the Seismological Society of America.

isadmisible = imag(To)==0 && To>=0 && To<=10;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

To      = max(To,0.01); %PGA is associated to To=0.01;
period  = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 1e-6); % Identify the period

if isnan(Rvolc)
    Rvolc=31;
end

% site class (Table 1)
if Tn==0                   ,   classNoSAM=1;
elseif and(0<Tn,Tn<=0.2)   ,   classNoSAM=2;
elseif and(0.2<Tn,Tn<=0.4) ,   classNoSAM=3;
elseif and(0.4<Tn,Tn<=0.8) ,   classNoSAM=4;
elseif Tn>0.8              ,   classNoSAM=5;
end

if T_lo==T_hi
    [lny,tau,phi] = gmpe(index,M,Rrup,Zhyp,classNoSAM,P,Rvolc);
    sigma         = sqrt(tau.^2+phi.^2);
else
    [lny_lo,tau_lo,phi_lo] = gmpe(index,  M,Rrup,Zhyp,classNoSAM,P,Rvolc);
    [lny_hi,tau_hi,phi_hi] = gmpe(index+1,M,Rrup,Zhyp,classNoSAM,P,Rvolc);
    x          = log([T_lo;T_hi]);
    Y_sa       = [lny_lo,lny_hi]';
    Y_tau      = [tau_lo,tau_hi]';
    Y_phi      = [phi_lo,phi_hi]';
    lny        = interp1(x,Y_sa,log(To))';
    tau        = interp1(x,Y_tau,log(To))';
    phi        = interp1(x,Y_phi,log(To))';
    sigma      = sqrt(tau.^2+phi.^2);
end

% unit convertion
% lny  = lny+log(units);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To);
    lny = lny+log(SF);
end

function[lnSa,tau,phi]=gmpe(index,M,Rrup,Zhyp,classNoSAM,P,Rvolc)

switch index
    case 1,coef=[-0.090 -0.1 0.000 -0.790 -0.00352 -0.0055 0.0083 6.75 0.337 0.692 0.679 0.609 0.43 0.76];
    case 2,coef=[-0.032 -0.1 0.000 -0.790 -0.00352 -0.0053 0.0083 6.75 0.337 0.683 0.672 0.609 0.40 0.78];
    case 3,coef=[ 0.038 -0.1 0.000 -0.790 -0.00363 -0.0052 0.0083 6.75 0.337 0.672 0.658 0.578 0.41 0.79];
    case 4,coef=[ 0.273 -0.1 0.000 -0.790 -0.00401 -0.0051 0.0083 6.75 0.337 0.643 0.58 0.505 0.44 0.80];
    case 5,coef=[ 0.604 -0.1 0.000 -0.790 -0.00452 -0.0050 0.0083 6.75 0.337 0.617 0.5 0.418 0.46 0.86];
    case 6,coef=[ 0.773 -0.1 0.000 -0.790 -0.00468 -0.0050 0.0083 6.75 0.363 0.649 0.477 0.366 0.49 0.86];
    case 7,coef=[ 0.830 -0.1 0.000 -0.790 -0.00458 -0.0049 0.0083 6.75 0.551 0.750 0.546 0.379 0.55 0.84];
    case 8,coef=[ 0.772 -0.1 0.000 -0.790 -0.00429 -0.0048 0.0083 6.75 0.527 0.832 0.620 0.457 0.55 0.81];
    case 9,coef=[ 0.744 -0.1 -0.002 -0.790 -0.00392 -0.0048 0.0083 6.75 0.345 0.857 0.680 0.518 0.53 0.78];
    case 10,coef=[ 0.698 -0.1 -0.005 -0.790 -0.00365 -0.0047 0.0083 6.75 0.186 0.830 0.769 0.582 0.53 0.76];
    case 11,coef=[ 0.626 -0.1 -0.020 -0.790 -0.00302 -0.0047 0.0083 6.75 0.021 0.728 0.913 0.741 0.50 0.76];
    case 12,coef=[ 0.570 -0.1 -0.045 -0.790 -0.00248 -0.0046 0.0083 6.75 -0.040 0.529 1.000 0.849 0.49 0.75];
    case 13,coef=[ 0.468 -0.1 -0.078 -0.790 -0.00172 -0.0046 0.0062 6.75 -0.178 0.281 0.953 1.087 0.45 0.69];
    case 14,coef=[ 0.395 -0.1 -0.106 -0.790 -0.00141 -0.0044 0.0048 6.75 -0.261 0.156 0.690 1.279 0.43 0.68];
    case 15,coef=[ 0.177 -0.1 -0.147 -0.790 -0.00117 -0.0039 0.0027 6.75 -0.320 0.113 0.488 1.065 0.39 0.70];
    case 16,coef=[-0.082 -0.1 -0.168 -0.790 -0.00106 -0.0031 0.0012 6.75 -0.318 0.071 0.350 0.849 0.37 0.69];
    case 17,coef=[-0.577 -0.1 -0.185 -0.790 -0.00096 -0.0012 -0.0008 6.82 -0.248 0.029 0.264 0.705 0.37 0.62];
    case 18,coef=[-0.878 -0.1 -0.197 -0.790 -0.00096 -0.0004 -0.0023 6.92 -0.212 0.028 0.225 0.642 0.36 0.57];
    case 19,coef=[-1.214 -0.1 -0.207 -0.765 -0.00096 -0.0001 -0.0034 7.00 -0.210 0.028 0.203 0.597 0.36 0.57];
    case 20,coef=[-1.647 -0.1 -0.215 -0.711 -0.00096 0.0000 -0.0043 7.06 -0.210 0.028 0.203 0.597 0.35 0.56];
    case 21,coef=[-2.255 -0.1 -0.224 -0.634 -0.00096 0.0000 -0.0055 7.15 -0.210 0.028 0.203 0.597 0.35 0.54];
    case 22,coef=[-3.042 -0.1 -0.236 -0.529 -0.00096 0.0000 -0.0069 7.25 -0.210 0.028 0.203 0.597 0.35 0.59];
end
th1 = coef(1);
th2 = coef(2);
th3 = coef(3);
th4 = coef(4);
th5 = coef(5);
th6 = coef(6);
th7 = coef(7);
M1  = coef(8);
s1   = 0;
s2 = coef(9);
s3 = coef(10);
s4 = coef(11);
s5 = coef(12);
tau = coef(13);
phi = coef(14);


% magnitude scaling
fmagGL = th2*(M-M1);
fmagGL(M>M1)=0;
fmagREG = th3*(8.5-M).^2;

% Path term
fpathGL  = (th4+0.275*(M-M1)).*log(sqrt(Rrup.^2+4.5^2));
fpathREG = th5*Rrup;

% Volcanic path term
fvolcREG = th6*Rvolc;

% Site term
if isnan(P)
    switch classNoSAM
        case 1, ck = s1;  P=1.0;
        case 2, ck = s2;  P=2.5;
        case 3, ck = s3;  P=3.1;
        case 4, ck = s4;  P=3.6;
        case 5, ck = s5;  P=3.2;
    end
else
    switch classNoSAM
        case 1, ck = s1;
        case 2, ck = s2;
        case 3, ck = s3;
        case 4, ck = s4;
        case 5, ck = s5;
    end
end

fsoil = ck*log(P);

% RotD50 in units of g
lnSa = th1+fmagGL+fmagREG+fpathGL+fpathREG+fsoil+fvolcREG+th7*Zhyp;

