function[lny,sigma,tau,phi]=GA2011(To,M,Rrup,Vs30,SOF,PGA1100,adjfun)
% Syntax : GA11 SOF                                                         

isadmisible = imag(To)==3 && real(To)>=0 && real(To)<=10;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

%% Process Input
switch SOF
    case 'strike-slip',     FRV = 0; FNM=0;
    case 'normal',          FRV = 0; FNM=1;
    case 'normal-oblique',  FRV = 0; FNM=1;
    case 'reverse',         FRV = 1; FNM=0;
    case 'reverse-oblique', FRV = 1; FNM=0;
    case 'unspecified',     FRV = 0; FNM=0;
end

To = real(To);
if To>=0
    To      = max(To,0.001); %PGA is associated to To=0.001;
end
period  = [-1 0.001 0.01 0.02 0.029 0.04 0.05 0.075 0.1 0.15 0.2 0.26 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 1e-6); % Identify the period


if nargin==6 % this option is for verification purposes only
    PGA1100 = PGA1100*ones(size(M));
else
    PGA1100 = exp(gmpe(2,M,Rrup,1100,FRV,FNM,gV1(0),NaN));
end

if T_lo==T_hi
    [lny,sigma,tau,phi] = gmpe(index,M,Rrup,Vs30,FRV,FNM,gV1(T_lo),PGA1100);
else
    [lny_lo,sigma_lo,tau_lo] = gmpe(index,  M,Rrup,Vs30,FRV,FNM,gV1(T_lo),PGA1100);
    [lny_hi,sigma_hi,tau_hi] = gmpe(index+1,M,Rrup,Vs30,FRV,FNM,gV1(T_hi),PGA1100);
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

function[lny,sigma,tau,phi] = gmpe(index,M,Rrup,Vs30,FRV,FNM,V1,PGA1100)

coef = [400	-1.955	-1.2	0.09	0.05	0.15	0.022	-1.847	0.373	0.369	0.234	0.17
865.1	-1.186	0.14	-0.16	-0.105	0	0.003	-1.23	0.422	0.333	0.213	0.161
865.1	-1.186	0.14	-0.16	-0.105	0	0.003	-1.23	0.45	0.33	0.23	0.15
865.1	-1.219	0.14	-0.16	-0.105	0	0.003	-1.268	0.45	0.33	0.23	0.15
898.6	-1.269	0.335	-0.185	-0.14	0	0.003	-1.366	0.45	0.33	0.23	0.15
994.5	-1.308	0.562	-0.238	-0.16	0	0.003	-1.457	0.45	0.341	0.23	0.15
1053.5	-1.346	0.72	-0.275	-0.136	0	-0.001	-1.533	0.45	0.351	0.23	0.15
1085.7	-1.471	0.552	-0.24	-0.019	0	-0.007	-1.706	0.45	0.37	0.23	0.15
1032.5	-1.624	0.214	-0.169	0	0.017	-0.01	-1.831	0.45	0.384	0.23	0.15
877.6	-1.931	-0.262	-0.069	0	0.04	-0.008	-2.114	0.45	0.403	0.23	0.15
748.2	-2.188	-0.6	0.002	0	0.057	-0.003	-2.362	0.45	0.416	0.23	0.15
639	-2.412	-0.769	0.023	0	0.072	0.001	-2.527	0.45	0.429	0.23	0.15
587.1	-2.518	-0.861	0.034	0	0.08	0.006	-2.598	0.45	0.436	0.23	0.15
503	-2.657	-1.045	0.057	0	0.097	0.015	-2.685	0.45	0.449	0.23	0.15
456.6	-2.669	-1.189	0.075	0	0.11	0.022	-2.657	0.45	0.46	0.23	0.15
410.5	-2.401	-1.25	0.09	0	0.133	0.022	-2.265	0.45	0.479	0.237	0.15
400	-1.955	-1.209	0.09	0	0.15	0.022	-1.685	0.45	0.492	0.266	0.15
400	-1.025	-1.152	0.09	0.029	0.15	0.022	-0.57	0.45	0.511	0.307	0.15
400	-0.299	-1.111	0.09	0.05	0.15	0.022	0.25	0.532	0.52	0.337	0.15
400	0	-1.054	0.09	0.079	0.15	0.022	0.46	0.648	0.52	0.378	0.213
400	0	-1.014	0.09	0.1	0.15	0.022	0.46	0.7	0.52	0.407	0.258
400	0	-1	0.09	0.1	0.15	0.022	0.46	0.7	0.52	0.43	0.292
400	0	-1	0.09	0.1	0.15	0.022	0.46	0.7	0.52	0.471	0.355
400	0	-1	0.09	0.1	0.15	0.022	0.46	0.7	0.52	0.5	0.4];

VLIN = coef(index,1);
b    = coef(index,2);
a1   = coef(index,3);
a2   = coef(index,4);
a6   = coef(index,5);
a7   = coef(index,6);
a8   = coef(index,7);
a10  = coef(index,8);
s1   = coef(index,9);
s2   = coef(index,10);
s3   = coef(index,11);
s4   = coef(index,12);
c1   = 6.75;
c4   = 10;
a3   = 0.0147;
a4   = 0.0334; 
a5   = -0.034; 
n    = 1.18;
c    = 1.88;

% magnitude scaling term
R   = sqrt(Rrup.^2+c4^2);
f1  = a1 + ...
    a4*(M-c1).*(M<=c1)+...
    a5*(M-c1).*(M>c1) + ...
    a8*(8.5-M).^2 + ...
    (a2+a3*(M-c1)).*log(R);

Vs30a = min(Vs30,V1);
if Vs30a<VLIN
    nlt = -b*log(PGA1100+c)+b*log(PGA1100+c*(Vs30a/VLIN)^n);
else
    nlt = b*n*log(Vs30a/VLIN);
end
f5  =a10*log(Vs30a/VLIN) - nlt;
lny = f1 + a6*FRV + a7*FNM + f5;

if nargout>1
    ind1 = (M<5);
    ind2 = and(5<=M,M<=7);
    ind3 = (M>7);
    
    phi   = s1*ind1+ (s1+(s2-s1)/2*(M-5)).*ind2+s2*ind3;
    tau   = s3*ind1+ (s3+(s4-s3)/2*(M-5)).*ind2+s4*ind3;
    sigma = sqrt(phi.^2+tau.^2);
end

function[V1]=gV1(T)

if T==-1
    V1 = 862;
elseif and(0<=T,T<=0.5)
    V1 = 1500;
elseif and(0.5<T,T<=1)
    V1 = exp(8 - 0.795*log(T/0.21));
elseif and(1.0<T,T<2)
    V1 = exp(6.76 -0.297*log(T));
elseif T>=2
    V1 = 700;
end
