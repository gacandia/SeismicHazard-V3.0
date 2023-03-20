function[lny,sigma,tau,phi]=ASK2014(To,M,Rrup,Rjb,Rx,Ry0,Ztor,dip,width,VS30,Z10,SOF,event,Vs30type,region,adjfun)
% Syntax : AkkarBoomer2007 stiff SOF damping

% Norman A. Abrahamson, Walter J. Silva, and Ronnie Kamai (2014) Summary
% of the ASK14 Ground Motion Relation for Active Crustal Regions.
% Earthquake Spectra: August 2014, Vol. 30, No. 3, pp. 1025-1055.

isadmisible = imag(To)==0 && or(To>=0 && To<=10,To==-1);
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

if To>=0
    To      = max(To,0.001); %PGA is associated to To=0.01;
end
period  = [-1 0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 0.0001); % Identify the period

if T_lo==T_hi
    [lny,sigma,tau] = gmpe(index,M, Rrup, Rjb, Rx, Ry0, Ztor, dip, width, SOF, event, Z10, VS30, Vs30type, region);
    phi              = sqrt(sigma.^2-tau.^2);
else
    [lny_lo,sigma_lo,tau_lo] = gmpe(index,  M, Rrup, Rjb, Rx, Ry0, Ztor, dip, width, SOF, event, Z10, VS30, Vs30type, region);
    [lny_hi,sigma_hi,tau_hi] = gmpe(index+1,M, Rrup, Rjb, Rx, Ry0, Ztor, dip, width, SOF, event, Z10, VS30, Vs30type, region);
    x          = log([T_lo;T_hi]);
    Y_sa       = [lny_lo,lny_hi]';
    Y_sigma    = [sigma_lo,sigma_hi]';
    Y_tau      = [tau_lo,tau_hi]';
    lny        = interp1(x,Y_sa,log(To))';
    sigma      = interp1(x,Y_sigma,log(To))';
    tau        = interp1(x,Y_tau,log(To))';
    phi        = sqrt(sigma.^2-tau.^2);
end

% unit convertion
% lny  = lny+log(units);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

function[lny,sigma,tau]=gmpe(index,M, Rrup, Rjb, Rx, Ry0, Ztor, dip, W, SOF, event, Z10, Vs30, Vs30type, reg)

switch SOF
    case 'strike-slip',     frv = 0; fnm=0;
    case 'normal',          frv = 0; fnm=1;
    case 'normal-oblique',  frv = 0; fnm=1;
    case 'reverse',         frv = 1; fnm=0;
    case 'reverse-oblique', frv = 1; fnm=0;
    case 'unspecified',     frv = 0; fnm=0;
end

switch reg
    case 'global',     region=0;
    case 'california', region=1;
    case 'japan',      region=2;
    case 'china',      region=3;
    case 'italy',      region=4;
    case 'turkey',     region=5;
end

switch Vs30type
    case 'measured', FVS30=1;
    case 'inferred', FVS30=0;
end

switch event
    case 'mainshock' , fas=1;
    case 'aftershock', fas=0;
end

% if Ztor == 999
%     if frv == 1
%         Ztor = max(2.704 - 1.226 .* max(M-5.849,0),0).^2;
%     else
%         Ztor = max(2.673 - 1.136 .* max(M-4.970,0),0).^2;
%     end
% end

% if W == 999
%     W = min(18./sin(deg2rad(dip)),10.^(-1.75+0.45.*M));
% end

if isnan(Z10)
    if region == 2 % japanese
        Z10 = exp(-5.23 ./ 2 .* log((Vs30.^2 + 412 ^ 2) ./ (1360 ^ 2 + 412 ^ 2))) ./ 1000;
    else %'non-japanese
        Z10 = exp((-7.67 ./ 4) .* log((Vs30.^4 + 610 ^ 4) ./ (1360 ^ 4 + 610 ^ 4))) ./ 1000;
    end
end

[lny,sigma,tau] = ASK_2014_sub_1(index,M, Rrup, Rjb, Rx, Ry0, Ztor, dip, W, frv, fnm, fas, Z10, Vs30, FVS30, region);

function [ln_Sa, sigma,tau]=ASK_2014_sub_1 (index,M, R_RUP, R_JB, Rx, Ry0, Ztor, delta, W, F_RV, F_NM, F_AS, Z10, Vs30, FVS30, region)

if ~isnan(Rx(1)) && ~isnan(W) && ~isnan(delta)
    HW = (Rx>=0);
else
    HW=0;
end
% Coefficients
period = [-1 0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];

Vlin =[330 660 660 680 770 915 960 910 740 590 495 430 360 340 330 330 330 330 330 330 330 330 330 330 ];
b =[-2.02 -1.47 -1.47 -1.459 -1.39 -1.219 -1.152 -1.23 -1.587 -2.012 -2.411 -2.757 -3.278 -3.599 -3.8 -3.5 -2.4 -1 0 0 0 0 0 0 ];
n =[1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 ];
M1 =[6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.75 6.82 6.92 7 7.06 7.145 7.25 ];
c =[2400 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 2.4 ];
c4 =[4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 4.5 ];
a1 =[5.975 0.587 0.587 0.598 0.602 0.707 0.973 1.169 1.442 1.637 1.701 1.712 1.662 1.571 1.299 1.043 0.665 0.329 -0.06 -0.299 -0.562 -0.875 -1.303 -1.928 ];
a2 =[-0.919 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.79 -0.765 -0.711 -0.634 -0.529 ];
a3 =[0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 0.275 ];
a4 =[-0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 ];
a5 =[-0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 -0.41 ];
a6 =[2.3657 2.1541 2.1541 2.1461 2.1566 2.0845 2.0285 2.0408 2.1208 2.2241 2.3124 2.3383 2.4688 2.5586 2.6821 2.763 2.8355 2.8973 2.9061 2.8888 2.8984 2.8955 2.87 2.8431 ];
a7 =[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
a8 =[-0.094 -0.015 -0.015 -0.015 -0.015 -0.015 -0.015 -0.015 -0.022 -0.03 -0.038 -0.045 -0.055 -0.065 -0.095 -0.11 -0.124 -0.138 -0.172 -0.197 -0.218 -0.235 -0.255 -0.285 ];
a10 =[2.36 1.735 1.735 1.718 1.615 1.358 1.258 1.31 1.66 2.22 2.77 3.25 3.99 4.45 4.75 4.3 2.6 0.55 -0.95 -0.95 -0.93 -0.91 -0.87 -0.8 ];
a11 =[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
a12 =[-0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.1 -0.2 -0.2 -0.2 ];
a13 =[0.25 0.6 0.6 0.6 0.6 0.6 0.6 0.6 0.6 0.6 0.6 0.6 0.58 0.56 0.53 0.5 0.42 0.35 0.2 0 0 0 0 0 ];
a14 =[0.22 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.3 -0.24 -0.19 -0.11 -0.04 0.07 0.15 0.27 0.35 0.46 0.54 0.61 0.65 0.72 0.8 ];
a15 =[0.3 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.1 1.03 0.92 0.84 0.68 0.57 0.42 0.31 0.16 0.05 -0.04 -0.11 -0.19 -0.3 ];
a17 =[-0.0005 -0.0072 -0.0072 -0.0073 -0.0075 -0.008 -0.0089 -0.0095 -0.0095 -0.0086 -0.0074 -0.0064 -0.0043 -0.0032 -0.0025 -0.0025 -0.0022 -0.0019 -0.0015 -0.001 -0.001 -0.001 -0.001 -0.001];
a43 =[0.28 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.14 0.17 0.22 0.26 0.34 0.41 0.51 0.55 0.49 0.42 ];
a44 =[0.15 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.05 0.07 0.1 0.14 0.17 0.21 0.25 0.3 0.32 0.32 0.32 0.275 0.22 ];
a45 =[0.09 0 0 0 0 0 0 0 0 0 0 0.03 0.06 0.1 0.14 0.17 0.2 0.22 0.23 0.23 0.22 0.2 0.17 0.14 ];
a46 =[0.07 -0.05 -0.05 -0.05 -0.05 -0.05 -0.05 -0.05 -0.05 -0.03 0 0.03 0.06 0.09 0.13 0.14 0.16 0.16 0.16 0.14 0.13 0.1 0.09 0.08 ];
a25 =[-0.0001 -0.0015 -0.0015 -0.0015 -0.0016 -0.002 -0.0027 -0.0033 -0.0035 -0.0033 -0.0029 -0.0027 -0.0023 -0.002 -0.001 -0.0005 -0.0004 -0.0002 0 0 0 0 0 0 ];
a28 =[0.0005 0.0025 0.0025 0.0024 0.0023 0.0027 0.0032 0.0036 0.0033 0.0027 0.0024 0.002 0.001 0.0008 0.0007 0.0007 0.0006 0.0003 0 0 0 0 0 0 ];
a29 =[-0.0037 -0.0034 -0.0034 -0.0033 -0.0034 -0.0033 -0.0029 -0.0025 -0.0025 -0.0031 -0.0036 -0.0039 -0.0048 -0.005 -0.0041 -0.0032 -0.002 -0.0017 -0.002 -0.002 -0.002 -0.002 -0.002 -0.002 ];
a31 =[-0.1462 -0.1503 -0.1503 -0.1479 -0.1447 -0.1326 -0.1353 -0.1128 0.0383 0.0775 0.0741 0.2548 0.2136 0.1542 0.0787 0.0476 -0.0163 -0.1203 -0.2719 -0.2958 -0.2718 -0.2517 -0.14 -0.0216 ];
a36 =[0.377 0.265 0.265 0.255 0.249 0.202 0.126 0.022 -0.136 -0.078 0.037 -0.091 0.129 0.31 0.505 0.358 0.131 0.123 0.109 0.135 0.189 0.215 0.15 0.092 ];
a37 =[0.212 0.337 0.337 0.328 0.32 0.289 0.275 0.256 0.162 0.224 0.248 0.203 0.232 0.252 0.208 0.208 0.108 0.068 -0.023 0.028 0.031 0.024 -0.07 -0.159 ];
a38 =[0.157 0.188 0.188 0.184 0.18 0.167 0.173 0.189 0.108 0.115 0.122 0.096 0.123 0.134 0.129 0.152 0.118 0.119 0.093 0.084 0.058 0.065 0 -0.05 ];
a39 =[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ];
a40 =[0.095 0.088 0.088 0.088 0.093 0.133 0.186 0.16 0.068 0.048 0.055 0.073 0.143 0.16 0.158 0.145 0.131 0.083 0.07 0.101 0.095 0.133 0.151 0.124 ];
a41 =[-0.038 -0.196 -0.196 -0.194 -0.175 -0.09 0.09 0.006 -0.156 -0.274 -0.248 -0.203 -0.154 -0.159 -0.141 -0.144 -0.126 -0.075 -0.021 0.072 0.205 0.285 0.329 0.301 ];
a42 =[0.065 0.044 0.044 0.061 0.162 0.451 0.506 0.335 -0.084 -0.178 -0.187 -0.159 -0.023 -0.029 0.061 0.062 0.037 -0.143 -0.028 -0.097 0.015 0.104 0.299 0.243 ];
s1 =[0.662 0.754 0.754 0.76 0.781 0.81 0.81 0.81 0.801 0.789 0.77 0.74 0.699 0.676 0.631 0.609 0.578 0.555 0.548 0.527 0.505 0.477 0.457 0.429 ];
s2 =[0.51 0.52 0.52 0.52 0.52 0.53 0.54 0.55 0.56 0.565 0.57 0.58 0.59 0.6 0.615 0.63 0.64 0.65 0.64 0.63 0.63 0.63 0.63 0.63 ];
s3 =[0.38 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 0.47 ];
s4 =[0.38 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 0.36 ];
s1_m =[0.66 0.741 0.741 0.747 0.769 0.798 0.798 0.795 0.773 0.753 0.729 0.693 0.644 0.616 0.566 0.541 0.506 0.48 0.472 0.447 0.425 0.395 0.378 0.359 ];
s2_m =[0.51 0.501 0.501 0.501 0.501 0.512 0.522 0.527 0.519 0.514 0.513 0.519 0.524 0.532 0.548 0.565 0.576 0.587 0.576 0.565 0.568 0.571 0.575 0.585 ];
s5_JP =[0.58 0.54 0.54 0.54 0.55 0.56 0.57 0.57 0.58 0.59 0.61 0.63 0.66 0.69 0.73 0.77 0.8 0.8 0.8 0.76 0.72 0.7 0.67 0.64 ];
s6_JP =[0.53 0.63 0.63 0.63 0.63 0.65 0.69 0.7 0.7 0.7 0.7 0.7 0.7 0.7 0.69 0.68 0.66 0.62 0.55 0.52 0.5 0.5 0.5 0.5 ];

To     = period (index);
Vlin   = Vlin   (index);
b      = b      (index);
n      = n      (index);
M1     = M1     (index);
c      = c      (index);
c4     = c4     (index);
a1     = a1     (index);
a2     = a2     (index);
a3     = a3     (index);
a4     = a4     (index);
a5     = a5     (index);
a6     = a6     (index);
a7     = a7     (index);
a8     = a8     (index);
a10    = a10    (index);
a11    = a11    (index);
a12    = a12    (index);
a13    = a13    (index);
a14    = a14    (index);
a15    = a15    (index);
a17    = a17    (index);
a43    = a43    (index);
a44    = a44    (index);
a45    = a45    (index);
a46    = a46    (index);
a25    = a25    (index);
a28    = a28    (index);
a29    = a29    (index);
a31    = a31    (index);
a36    = a36    (index);
a37    = a37    (index);
a38    = a38    (index);
a39    = a39    (index);
a40    = a40    (index);
a41    = a41    (index);
a42    = a42    (index);
s1     = s1     (index);
s2     = s2     (index);
s3     = s3     (index);
s4     = s4     (index);
s1_m   = s1_m   (index);
s2_m   = s2_m   (index);
s5_JP  = s5_JP  (index);
s6_JP  = s6_JP  (index);

M2 = 5;
CRjb = 999.9;

% Term f1 - Basic form
c4m1 = c4.*ones(length(M),1);
c4m2 =c4-(c4-1).*(5-M);
c4m =ones(length(M),1);
c4m(M>4)=c4m2(M>4);
c4m(M>5)=c4m1(M>5);

R = sqrt(R_RUP.^2+ c4m.^2);

f1a = a1 + a5.*(M - M1) + a8.*(8.5 - M).^2 + (a2 + a3.*(M - M1)).*log(R) + a17.*R_RUP;
f1b = a1 + a4.*(M - M1) + a8.*(8.5 - M).^2 + (a2 + a3.*(M - M1)).*log(R) + a17.*R_RUP;
f1 = a1 + a4.*(M2 - M1) + a8.*(8.5 - M2).^2 + a6.*(M - M2) + a7.*(M - M2).^2 + (a2 + a3.*(M2 - M1)).*log(R) + a17.*R_RUP;
f1(M>=M2)=f1b(M>=M2);
f1(M>M1)=f1a(M>M1);

% term f4 - Hanging wall model
if HW
    R1 = W .* cosd(delta);
    R2 = 3 .* R1;
    Ry1 = Rx .* tand(20);
    h1 = 0.25;
    h2 = 1.5;
    h3 = -0.75;
    
    if delta > 30
        T1 = (90- delta)./45;
    else
        T1 = 60./45;
    end
    
    a2hw = 0.2;
    
    T2a = 1 + a2hw .* (M - 6.5);
    T2b = 1 + a2hw .* (M - 6.5) - (1 - a2hw) .* (M - 6.5).^2;
    T2 = zeros(length(M),1);
    T2(M>5.5)=T2b(M>5.5);
    T2(M>6.5)=T2a(M>6.5);
    
    T3a = h1 + h2.*(Rx./R1) + h3.*(Rx./R1).^2;
    T3b = 1 - (Rx - R1)./(R2 - R1);
    T3 = zeros(length(M),1);
    T3(Rx<R2)=T3b(Rx<R2);
    T3(Rx<=R1)=T3a(Rx<=R1);
    
    T4a = 1 - Ztor.^2./100;
    T4 = zeros(length(M),1);
    T4(Ztor<10)=T4a(Ztor<10);
    
    T5 = R_JB*0;
    
    for i=1:length(M)
        if numel(Ry0)<numel(M) || isnan(Ry0(i)) || Ry0(i) == 0
            if R_JB(i) == 0
                T5(i,1) = 1;
            elseif R_JB(i) <30
                T5(i,1) = 1 - R_JB(i)/30;
            end
        else
            if Ry0(i) - Ry1(i) <= 0
                T5(i,1) = 1;
            elseif Ry0(i) - Ry1(i) < 5
                T5(i,1) = 1- (Ry0(i)-Ry1(i))/5;
            end
        end
    end
    
    f4 = a13 * T1 * T2 .* T3 .* T4 .* T5 .*HW;
else
    f4=0;
end

% Term f6 - Depth to top rupture model
f6a = a15.*Ztor./20;
f6 = a15.*ones(length(M),1);
f6(Ztor<20)=f6a(Ztor<20);

% Term: f7 and f8 - Style of Faulting
f7a = a11.*ones(length(M),1);
f7b = a11.*(M - 4);
f7 = zeros(length(M),1);
f7(M>4)=f7b(M>4);
f7(M>5)=f7a(M>5);

f8a = a12.*ones(length(M),1);
f8b = a12.*(M - 4);
f8 = zeros(length(M),1);
f8(M>4)=f8b(M>4);
f8(M>5)=f8a(M>5);

if To <= 0.5
    V1 = 1500;
elseif To < 3
    V1 = exp(-0.35.*log(To./0.5)+log(1500));
else
    V1 = 800;
end

if Vs30 < V1
    Vs30s = Vs30;
else
    Vs30s = V1;
end

if 1180 >= V1
    Vs30star1180 = V1;
else
    Vs30star1180 = 1180;
end

% term  Regional:
Ftw = (region == 6);
Fcn = (region == 3);
Fjp = (region == 2);

% Japan
if Vs30 < 150
    y1 = a36;
    y2 = a36;
    x1 = 50;
    x2 = 150;
elseif Vs30 < 250
    y1 = a36;
    y2 = a37;
    x1 = 150;
    x2 = 250;
elseif Vs30 < 350
    y1 = a37;
    y2 = a38;
    x1 = 250;
    x2 = 350;
elseif Vs30 < 450
    y1 = a38;
    y2 = a39;
    x1 = 350;
    x2 = 450;
elseif Vs30 < 600
    y1 = a39;
    y2 = a40;
    x1 = 450;
    x2 = 600;
elseif Vs30 < 850
    y1 = a40;
    y2 = a41;
    x1 = 600;
    x2 = 850;
elseif Vs30 < 1150
    y1 = a41;
    y2 = a42;
    x1 = 850;
    x2 = 1150;
else
    y1 = a42;
    y2 = a42;
    x1 = 1150;
    x2 = 3000;
end
f13Vs30 = y1 + (y2 - y1) ./ (x2 - x1) .* (Vs30 - x1);

% Taiwan
f12Vs30 = a31 .* log(Vs30s./Vlin);
f12Vs30_1180 = a31 .* log(Vs30star1180./Vlin);

Regional = Ftw .* (f12Vs30 + a25 .* R_RUP) + Fcn .* (a28 .* R_RUP) + Fjp .* (f13Vs30 + a29 .* R_RUP);
Regional_1180 = Ftw .* (f12Vs30_1180 + a25 .* R_RUP) + Fcn .* (a28 .* R_RUP) + Fjp .* (f13Vs30 + a29 .* R_RUP);

% Term f5 - site response model
%Sa 1180
f5_1180 = (a10 + b .* n) .* log(Vs30star1180 ./ Vlin);

Sa1180 = exp(f1 + f6 + F_RV.*f7 + F_NM .* f8 +  HW .* f4 + f5_1180 + Regional_1180);

if Vs30 >= Vlin
    f5 = (a10+ b.*n).*log(Vs30s./Vlin);
else
    f5 = a10.*log(Vs30s./Vlin) - b.*log(Sa1180 + c) + b.*log(Sa1180 + c.*(Vs30s./Vlin).^n);
end

% Term f10 - soil depth model
if region ~= 2 % california
    Z1ref = 1/1000.* exp(-7.67./4 .* log((Vs30.^4 + 610^4)./(1360^4 + 610^4)));
else  % Japan
    Z1ref =  1/1000.* exp(-5.23/2 .* log((Vs30.^2 + 412^2)./(1360^2 + 412^2)));
end

if Vs30 <= 150
    y1z = a43;
    y2z = a43;
    x1z = 50;
    x2z = 150;
elseif Vs30 <= 250
    y1z = a43;
    y2z = a44;
    x1z = 150;
    x2z = 250;
elseif Vs30 <= 400
    y1z = a44;
    y2z = a45;
    x1z = 250;
    x2z = 400;
elseif Vs30 <= 700
    y1z = a45;
    y2z = a46;
    x1z = 400;
    x2z = 700;
else
    y1z = a46;
    y2z = a46;
    x1z = 700;
    x2z = 1000;
end


if isnan(Z10)
    if region == 2
        Z10 = exp(-5.23 / 2 * log((Vs30 .^ 2 + 412 ^ 2) / (1360 ^ 2 + 412 ^ 2))) / 1000; %km
    else %'non-japanese
        Z10 = exp((-7.67 / 4) * log((Vs30 .^ 4 + 610 ^ 4) / (1360 ^ 4 + 610 ^ 4))) / 1000; %km
    end
end


%'f10 term goes to zero at 1180 m/s (reference)
f10 = (y1z + (Vs30 - x1z) .* (y2z - y1z) ./ (x2z - x1z)) .* log((Z10 + 0.01) ./ (Z1ref + 0.01));

% term f11 - Aftershock scaling
if CRjb <= 5
    f11 = a14;
elseif CRjb < 15
    f11 = a14.*(1-(CRjb-5)./10);
else
    f11 = 0;
end

if F_AS == 0
    f11 = 0;
end

% Sa
ln_Sa = f1+ f6 + F_RV*f7 + F_NM * f8 +  HW .* f4 + F_AS * f11 + f5 + f10 + Regional;

% Standard deviation
if FVS30 == 1 % measured
    s1 = s1_m;
    s2 = s2_m;
end

phi_ALa = s1.*ones(length(M),1);
phi_ALb = s1+(s2-s1)./2.*(M-4);
phi_AL = s2.*ones(length(M),1);
phi_AL(M<=6)= phi_ALb(M<=6);
phi_AL(M<4)= phi_ALa(M<4);

tau_ALa = s3.*ones(length(M),1);
tau_ALb = s3 + (s4-s3)./2.*(M-5);
tau_AL = s4.*ones(length(M),1);
tau_AL(M<=7)= tau_ALb(M<=7);
tau_AL(M<5)= tau_ALa(M<5);

tau_B = tau_AL;

if Fjp == 1
    phi_ALa = s5_JP.*ones(length(M),1);
    phi_ALb = s5_JP + (s6_JP - s5_JP)./50 .* (R_RUP - 30);
    phi_AL = s6_JP.*ones(length(M),1);
    phi_AL(R_RUP<=80)=phi_ALb(R_RUP<=80);
    phi_AL(R_RUP<30)=phi_ALa(R_RUP<30);
end

phi_amp = 0.4;

phi_B = sqrt(phi_AL.^2 - phi_amp.^2);

if Vs30 >= Vlin
    dln = 0;
else
    dln = -b.*Sa1180./(Sa1180 + c) + b.*Sa1180./(Sa1180 + c.*(Vs30./Vlin).^n);
end

phi = sqrt(phi_B.^2 .* (1 + dln).^2 + phi_amp.^2);

tau = tau_B.*(1+ dln);

sigma = sqrt(phi.^2+ tau.^2);


