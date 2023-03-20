function[lny,sigma,tau,phi]=GarciaJaimes2017VH(To,M,Rrup,adjfun)
% Syntax : GarciaJaimes2017HV                                               


% García-Soto & Jaimes (2017). Ground-Motion Prediction Model for Vertical
% Response Spectra from Mexican Interplate Earthquakes. Bulletin of the
% Society of America, 107(2), 887-900

isadmisible = imag(To)==3 && real(To)>=0 && real(To)<=5;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end
To      = real(To);
To      = max(To,0.001); %HV(T=0) is associated to HV(To=0.01);
period  = [0.001 0.01 0.02 0.04 0.06 0.08 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3 4 5];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 1e-6); % Identify the period

if T_lo==T_hi
    [lny,sigma] = gmpe(index,M,Rrup);
else
    [lny_lo,sigma_lo] = gmpe(index,  M,Rrup);
    [lny_hi,sigma_hi] = gmpe(index+1,M,Rrup);
    x          = log([T_lo;T_hi]);
    Y_sa       = [lny_lo,lny_hi]';
    Y_sigma    = [sigma_lo,sigma_hi]';
    lny        = interp1(x,Y_sa,log(To))';
    sigma      = interp1(x,Y_sigma,log(To))';
end
tau   = nan(size(M));
phi   = nan(size(M));

% unit convertion
% lny  = lny+log(units);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

function [lny,sigma]=gmpe(index,M,Rrup)

DATA=[
    -0.5926  0.0259 0.0007 0.29 0.933
    -0.5507  0.0220 0.0006 0.29 0.933
    -0.3715  0.0031 0.0004 0.30 0.932
    -0.4388  0.0198 0.0003 0.34 0.924
    -0.6707  0.0498 0.0005 0.32 0.934
    -0.7343  0.0497 0.0006 0.32 0.934
    -0.7710  0.0419 0.0008 0.34 0.920
    -0.8208  0.0533 0.0007 0.38 0.873
    -0.6211  0.0268 0.0010 0.38 0.864
    -0.8204  0.0549 0.0013 0.41 0.839
    -0.6012  0.0167 0.0012 0.43 0.820
    -0.5700  0.0124 0.0012 0.43 0.813
    -0.4281 -0.0092 0.0012 0.44 0.803
    -0.7328  0.0408 0.0014 0.47 0.781
    -0.7192  0.0342 0.0015 0.45 0.789
    -0.7359  0.0339 0.0016 0.44 0.788
    -0.6505  0.0221 0.0015 0.44 0.790
    -0.4953 -0.0006 0.0014 0.44 0.788
    -0.6258  0.0217 0.0014 0.46 0.771
    -0.6869  0.0310 0.0016 0.46 0.769
    -0.6526  0.0270 0.0017 0.47 0.764
    -0.7034  0.0343 0.0018 0.47 0.761
    -0.6612  0.0241 0.0019 0.46 0.760
    -0.5581  0.0063 0.0018 0.46 0.759
    -0.5515  0.0079 0.0017 0.47 0.754
    -0.5851  0.0159 0.0016 0.47 0.749
    -0.5433  0.0093 0.0016 0.47 0.739
    -0.5216  0.0043 0.0016 0.46 0.740
    -0.4988 -0.0006 0.0016 0.46 0.742
    -0.5389  0.0062 0.0016 0.46 0.742
    -0.5678  0.0113 0.0016 0.45 0.747
    -0.5672  0.0124 0.0015 0.45 0.755
    -0.5395  0.0090 0.0015 0.44 0.759
    -0.5501  0.0120 0.0014 0.44 0.763
    -0.5422  0.0115 0.0014 0.44 0.764
    -0.4921  0.0038 0.0014 0.44 0.765
    -0.2404 -0.0215 0.0010 0.44 0.769
    -0.2629 -0.0045 0.0007 0.46 0.785];
C       = DATA(index,:);
lny     = C(1)+ C(2)*M + C(3)*Rrup;
sigma   = C(4)*ones(size(M));

