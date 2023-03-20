function[lny,sigma,tau,phi]=Arteta2021SUB(To,M,Rrup,Rhyp,Tn,P,mechanism,arc,adjfun)

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

To      = max(To,0.01); % PGA is associated to To=0.01;
period  = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 1e-6); % Identify the period

% site class (Table 1)
if Tn==0                   ,   classNoSAM=1;
elseif and(0<Tn,Tn<=0.2)   ,   classNoSAM=2;
elseif and(0.2<Tn,Tn<=0.4) ,   classNoSAM=3;
elseif and(0.4<Tn,Tn<=0.8) ,   classNoSAM=4;
elseif Tn>0.8              ,   classNoSAM=5;
end

if P==0
    P=1;
end

switch mechanism
    case 'interface'
        FFABA  = 0;
        F      = 0;
        R      = Rrup;
        C1     = interpC1(To);
    case 'intraslab'
        FFABA = strcmp(arc,'backarc');
        F     = 1;
        R     = Rhyp;
        C1    = 6.5;
end

if T_lo==T_hi
    [lny,tau,phi] = gmpe(index,M,R,F,FFABA,classNoSAM,P,C1);
    sigma         = sqrt(tau.^2+phi.^2);
else
    [lny_lo,tau_lo,phi_lo] = gmpe(index,  M,R,F,FFABA,classNoSAM,P,C1);
    [lny_hi,tau_hi,phi_hi] = gmpe(index+1,M,R,F,FFABA,classNoSAM,P,C1);
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

function[lnSa,tau,phi]=gmpe(index,M,R,F,FFABA,sitecategory,P,C1)

if F==0
    switch index
        case 1 ,coef=[ 4.329 0.73 -0.021 -1.450 -0.006 0  0.740  0.966 0.959 0.986 0.452 0.726 0.817];
        case 2 ,coef=[ 4.347 0.73 -0.021 -1.450 -0.006 0  0.828  0.990 0.994 0.971 0.448 0.739 0.832];
        case 3 ,coef=[ 4.360 0.73 -0.021 -1.450 -0.006 0  0.896  0.964 0.989 0.959 0.439 0.777 0.841];
        case 4 ,coef=[ 4.473 0.73 -0.021 -1.450 -0.006 0  1.011  0.941 0.955 0.885 0.439 0.798 0.854];
        case 5 ,coef=[ 4.679 0.73 -0.021 -1.450 -0.007 0  1.196  0.948 0.899 0.783 0.446 0.836 0.892];
        case 6 ,coef=[ 4.893 0.73 -0.021 -1.450 -0.008 0  1.237  1.022 0.850 0.692 0.444 0.753 0.965];
        case 7 ,coef=[ 5.070 0.73 -0.023 -1.425 -0.008 0  1.180  1.182 0.772 0.582 0.459 0.708 0.982];
        case 8 ,coef=[ 4.950 0.73 -0.025 -1.335 -0.008 0  1.016  1.210 0.706 0.514 0.519 0.730 0.962];
        case 9 ,coef=[ 4.900 0.73 -0.029 -1.275 -0.008 0  0.850  1.221 0.693 0.509 0.559 0.830 0.916];
        case 10,coef=[ 4.850 0.73 -0.038 -1.231 -0.008 0  0.650  1.119 0.732 0.531 0.535 0.806 0.944];
        case 11,coef=[ 4.650 0.73 -0.057 -1.165 -0.008 0  0.227  0.628 0.934 0.601 0.508 0.704 0.850];
        case 12,coef=[ 4.334 0.73 -0.072 -1.115 -0.007 0  0.094  0.434 0.949 0.687 0.509 0.715 0.867];
        case 13,coef=[ 3.564 0.73 -0.099 -1.020 -0.007 0 -0.047  0.233 0.784 0.865 0.536 0.627 0.821];
        case 14,coef=[ 2.957 0.73 -0.118 -0.950 -0.006 0 -0.146  0.143 0.632 0.881 0.598 0.658 0.822];
        case 15,coef=[ 1.986 0.73 -0.145 -0.860 -0.006 0 -0.287  0.026 0.384 0.692 0.631 0.675 0.804];
        case 16,coef=[ 1.323 0.73 -0.164 -0.820 -0.005 0 -0.386 -0.011 0.225 0.386 0.592 0.716 0.807];
        case 17,coef=[ 0.518 0.73 -0.191 -0.793 -0.005 0 -0.438 -0.041 0.090 0.130 0.570 0.696 0.759];
        case 18,coef=[-0.022 0.73 -0.210 -0.793 -0.004 0 -0.438 -0.041 0.042 0.052 0.525 0.748 0.731];
        case 19,coef=[-0.437 0.73 -0.220 -0.793 -0.003 0 -0.438 -0.041 0.022 0.012 0.494 0.747 0.775];
        case 20,coef=[-0.784 0.73 -0.224 -0.793 -0.003 0 -0.438 -0.041 0.022 0.012 0.455 0.791 0.807];
        case 21,coef=[-1.281 0.73 -0.224 -0.793 -0.002 0 -0.438 -0.041 0.022 0.012 0.440 0.746 0.831];
        case 22,coef=[-1.883 0.73 -0.224 -0.793 -0.001 0 -0.438 -0.041 0.022 0.012 0.468 0.724 0.791];
    end
else
    
    switch index
        case 1 ,coef=[ 4.639 1.07 -0.027 -1.450 -0.005 -0.653 0.745 0.892 0.933 0.886 0.364 0.707 0.834];
        case 2 ,coef=[ 4.714 1.07 -0.027 -1.450 -0.005 -0.653 0.723 0.879 0.932 0.862 0.356 0.699 0.848];
        case 3 ,coef=[ 4.752 1.07 -0.027 -1.450 -0.005 -0.653 0.725 0.863 0.936 0.810 0.359 0.704 0.856];
        case 4 ,coef=[ 4.951 1.07 -0.027 -1.450 -0.005 -0.653 0.752 0.806 0.889 0.747 0.340 0.725 0.873];
        case 5 ,coef=[ 5.126 1.07 -0.027 -1.420 -0.006 -0.717 0.823 0.795 0.825 0.653 0.318 0.791 0.902];
        case 6 ,coef=[ 5.153 1.07 -0.027 -1.364 -0.006 -0.807 0.929 0.820 0.785 0.561 0.308 0.855 0.977];
        case 7 ,coef=[ 4.975 1.07 -0.027 -1.298 -0.006 -0.862 0.953 0.917 0.785 0.505 0.351 0.853 0.995];
        case 8 ,coef=[ 4.650 1.07 -0.027 -1.258 -0.006 -0.857 0.849 1.018 0.950 0.553 0.358 0.793 0.983];
        case 9 ,coef=[ 4.300 1.07 -0.027 -1.227 -0.005 -0.824 0.691 1.101 1.066 0.659 0.345 0.782 0.942];
        case 10,coef=[ 4.000 1.07 -0.027 -1.201 -0.004 -0.766 0.556 1.113 1.153 0.744 0.358 0.731 0.972];
        case 11,coef=[ 3.500 1.07 -0.030 -1.161 -0.003 -0.628 0.499 1.003 1.281 0.904 0.382 0.600 0.889];
        case 12,coef=[ 3.118 1.07 -0.037 -1.130 -0.003 -0.521 0.442 0.829 1.283 1.082 0.416 0.656 0.913];
        case 13,coef=[ 2.400 1.07 -0.056 -1.074 -0.003 -0.329 0.391 0.535 1.146 1.403 0.452 0.748 0.880];
        case 14,coef=[ 1.821 1.07 -0.072 -1.000 -0.003 -0.192 0.355 0.409 0.980 1.350 0.466 0.694 0.850];
        case 15,coef=[ 0.953 1.07 -0.085 -0.958 -0.002 -0.089 0.304 0.317 0.756 1.092 0.453 0.581 0.839];
        case 16,coef=[ 0.340 1.07 -0.095 -0.938 -0.002 -0.036 0.278 0.282 0.666 0.909 0.422 0.552 0.841];
        case 17,coef=[-0.458 1.07 -0.104 -0.933 -0.002 -0.018 0.267 0.257 0.597 0.751 0.398 0.573 0.809];
        case 18,coef=[-1.033 1.07 -0.107 -0.933 -0.002 -0.018 0.267 0.247 0.577 0.724 0.405 0.549 0.757];
        case 19,coef=[-1.468 1.07 -0.109 -0.933 -0.002 -0.018 0.267 0.247 0.567 0.724 0.415 0.578 0.781];
        case 20,coef=[-1.825 1.07 -0.109 -0.933 -0.002 -0.018 0.267 0.247 0.567 0.724 0.427 0.627 0.813];
        case 21,coef=[-2.265 1.07 -0.109 -0.933 -0.002 -0.018 0.267 0.247 0.567 0.724 0.446 0.680 0.825];
        case 22,coef=[-2.755 1.07 -0.109 -0.933 -0.002 -0.018 0.267 0.247 0.567 0.724 0.486 0.691 0.761];
    end
end

th1   = coef(1);
th2   = coef(2);
th3   = coef(3);
th4   = coef(4);
th5   = coef(5);
th6   = coef(6);
s1   = 0;
s2   = coef(7);
s3   = coef(8);
s4   = coef(9);
s5   = coef(10);
tau  = coef(11);
phi1 = coef(12);
phi2 = coef(13);

% magnitude scaling
fmagGL = th2*(M-C1);
fmagGL(M>C1)=0;
fmagREG = th3*(10-M).^2;

% Path term
fpathGL  = (th4+0.1*(M-7)).*log(R+10*exp(0.4*(M-6)));
fpathREG = th5*R;

% Site term
if isnan(P)
    switch sitecategory
        case 1, ck = s1;  P=1.00;
        case 2, ck = s2;  P=3.29;
        case 3, ck = s3;  P=4.48;
        case 4, ck = s4;  P=4.24;
        case 5, ck = s5;  P=3.47;
    end
else
    switch sitecategory
        case 1, ck = s1;
        case 2, ck = s2;
        case 3, ck = s3;
        case 4, ck = s4;
        case 5, ck = s5;
    end
end

fsoil = ck*log(P);

% RotD50 in units of g
lnSa = th1+fmagGL+fmagREG+fpathGL+fpathREG+fsoil+th6*FFABA;

% Within event standard deviation
phi  = phi1+(phi2-phi1)/50*(R-150);
phi(R<=150)=phi1;
phi(R> 200)=phi2;

function[C1]=interpC1(T)

TAG  = [0.01;0.02;0.03;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
C1AG = [8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.2;8.15;8.1;8.05;8;7.95;7.9;7.85;7.8;7.8;7.8;7.8];
C1   = interp1(log(TAG),C1AG,log(T));




