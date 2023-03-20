function[lny,sigma,tau,phi]=Bindi2011(To,M,Rjb,media,SOF,component,adjfun)
% Syntax : Bindi2011 SOF component                                          

% Bindi, D., Pacor, F., Luzi, L., Puglia, R., Massa, M., Ameri, G., & Paolucci, R. (2011).
% Ground motion prediction equations derived from the Italian strong motion database.
% Bulletin of Earthquake Engineering, 9(6), 1899-1920.

isadmisible = imag(To)==0 && or(To>=0 && To<=2,To==-1);
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

if isnumeric(media)
    if         800< media            ,media='A'; % EC8-A
    elseif and(360<=media,media<=800),media='B'; % EC8-B
    elseif and(180<=media,media< 360),media='C'; % EC8-C
    elseif and(0  <=media,media< 180),media='D'; % EC8-D
    end  
end

if To>=0
    To      = max(To,0.01); %PGA is associated to To=0.01;
end

period  = [-1 0.01 0.04 0.07 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.6 0.7 0.8 0.9 1 1.25 1.5 1.75 2];
T_lo    = max(period(period<=To));              % Identify the period that is below for the later interpolation
T_hi    = min(period(period>=To));              % Identify the period that is above for the later interpolation
index   = find(abs((period - T_lo)) < 1e-6);    % Identify the period from the ones evaluated in the paper

if T_lo==T_hi
    [log10y,sigma,phi,tau] = gmpe(index,M,Rjb,media,SOF,component);
else
    [log10y_lo,~,phi_lo,tau_lo] = gmpe(index,M,Rjb,media,SOF,component);
    [log10y_hi,~,phi_hi,tau_hi] = gmpe(index+1,M,Rjb,media,SOF,component);
    x       = log([T_lo;T_hi]);
    Y_sa    = [log10y_lo,log10y_hi]';
    Y_phi   = [phi_lo,phi_hi]';
    Y_tau   = [tau_lo,tau_hi]';
    log10y  = interp1(x,Y_sa,log(To))';
    phi     = interp1(x,Y_phi,log(To))';
    tau     = interp1(x,Y_tau,log(To))';
    sigma   = sqrt(phi.^2-tau.^2);
end

% log base conversio
lny   = log10y * log(10);
sigma = sigma  * log(10);
phi   = phi    * log(10);
tau   = tau    * log(10);

% unit convertion
if To>=0
    lny  = lny-log(980.66);
end

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

function [lny,sigma,phi,tau] = gmpe(index,M,Rjb,media,SOF,SATYPE)
switch lower(SATYPE)
    case 'geoh' ,[e1,c1,c2,h,c3,b1,b2,sA,sB,sC,sD,sE,f1,f2,f3,f4,sigma,phi,tau] = getcoeffs_SAH(index);
    case 'z'    ,[e1,c1,c2,h,c3,b1,b2,sA,sB,sC,sD,sE,f1,f2,f3,f4,sigma,phi,tau] = getcoeffs_SAZ(index);
end
Fd  = (c1 + c2.*(M-5)).*log10(sqrt(Rjb.^2+h^2)/1) - c3.*(sqrt(Rjb.^2+h^2)-1);
Fm  = b1.*(M-6.75) + b2.*(M-6.75).^2; % this is because b3=0. See page 6, Bindi 2011

C1=0;C2=0;C3=0;C4=0;C5=0;
switch media
    case 'A', C1=1;
    case 'B', C2=1;
    case 'C', C3=1;
    case 'D', C4=1;
    case 'E', C5=1;
end
Fs  = sA*C1+sB*C2+sC*C3+sD*C4+sE*C5;

E1=0;E2=0;E3=0;E4=0;
switch SOF
    case {'normal','normal-oblique'},    E1=1;
    case {'reverse','reverse-oblique'},  E2=1;
    case 'strike-slip',                  E3=1;
    case 'unspecified',                  E4=1;
end

Fsof  = f1*E1+f2*E2+f3*E3+f4*E4;
lny   = e1 + Fd + Fm + Fs + Fsof;

function [e1,c1,c2,h,c3,b1,b2,sA,sB,sC,sD,sE,f1,f2,f3,f4,sigma,phi,tau] = getcoeffs_SAH(index)
COEFF=[2.305 -1.517 0.326 7.879 0 0.236 -6.86E-03 0 0.205 0.269 0.321 0.428 -3.08E-02 7.54E-02 -4.46E-02 0 0.194 0.27 0.332
3.672 -1.94 0.413 10.322 1.34E-04 -0.262 -0.0707 0 0.162 0.24 0.105 0.57 -5.03E-02 1.05E-01 -5.44E-02 0 0.172 0.29 0.337
3.725 -1.976 0.422 9.445 2.70E-04 -3.15E-01 -7.87E-02 0 0.161 0.24 0.06 0.614 -4.42E-02 1.06E-01 -6.15E-02 0 0.154 0.307 0.343
3.906 -2.05 0.446 9.81 7.58E-04 -3.75E-01 -7.73E-02 0 0.154 0.235 0.057 0.536 -4.54E-02 1.03E-01 -5.76E-02 0 0.152 0.324 0.358
3.796 -1.794 0.415 9.5 2.55E-03 -2.90E-01 -6.51E-02 0 0.178 0.247 0.037 0.599 -6.56E-02 1.11E-01 -4.51E-02 0 0.154 0.328 0.363
3.799 -1.521 0.32 9.163 3.72E-03 -9.87E-02 -5.74E-02 0 0.174 0.24 0.148 0.74 -7.55E-02 1.23E-01 -4.77E-02 0 0.179 0.318 0.365
3.75 -1.379 0.28 8.502 3.84E-03 9.40E-03 -5.17E-02 0 0.156 0.234 0.115 0.556 -7.33E-02 1.06E-01 -3.28E-02 0 0.209 0.32 0.382
3.699 -1.34 0.254 7.912 3.26E-03 8.60E-02 -4.57E-02 0 0.182 0.245 0.154 0.414 -5.68E-02 1.10E-01 -5.34E-02 0 0.212 0.308 0.374
3.753 -1.414 0.255 8.215 2.19E-03 1.24E-01 -4.35E-02 0 0.201 0.244 0.213 0.301 -5.64E-02 8.77E-02 -3.13E-02 0 0.218 0.29 0.363
3.6 -1.32 0.253 7.507 2.32E-03 1.54E-01 -4.37E-02 0 0.22 0.257 0.243 0.235 -5.23E-02 9.05E-02 -3.82E-02 0 0.221 0.283 0.359
3.549 -1.262 0.233 6.76 2.19E-03 2.25E-01 -4.06E-02 0 0.229 0.255 0.226 0.202 -5.65E-02 9.27E-02 -3.63E-02 0 0.21 0.279 0.349
3.55 -1.261 0.223 6.775 1.76E-03 2.92E-01 -3.06E-02 0 0.226 0.271 0.237 0.181 -5.97E-02 8.86E-02 -2.89E-02 0 0.204 0.284 0.35
3.526 -1.181 0.184 5.992 1.86E-03 3.84E-01 -2.50E-02 0 0.218 0.28 0.263 0.168 -5.99E-02 8.50E-02 -2.52E-02 0 0.203 0.283 0.349
3.561 -1.23 0.178 6.382 1.14E-03 4.36E-01 -2.27E-02 0 0.219 0.296 0.355 0.142 -5.59E-02 7.90E-02 -2.31E-02 0 0.203 0.283 0.348
3.485 -1.172 0.154 5.574 9.42E-04 5.29E-01 -1.85E-02 0 0.21 0.303 0.496 0.134 -4.61E-02 8.96E-02 -4.35E-02 0 0.212 0.283 0.354
3.325 -1.115 0.163 4.998 9.09E-04 5.45E-01 -2.15E-02 0 0.21 0.304 0.621 0.15 -4.57E-02 7.95E-02 -3.38E-02 0 0.213 0.284 0.355
3.318 -1.137 0.154 5.231 4.83E-04 5.63E-01 -2.63E-02 0 0.212 0.315 0.68 0.154 -3.51E-02 7.15E-02 -3.64E-02 0 0.214 0.286 0.357
3.264 -1.114 0.14 5.002 2.54E-04 5.99E-01 -2.70E-02 0 0.221 0.332 0.707 0.152 -2.98E-02 6.60E-02 -3.62E-02 0 0.222 0.283 0.36
2.896 -0.986 0.173 4.34 7.83E-04 5.79E-01 -3.36E-02 0 0.244 0.365 0.717 0.183 -2.07E-02 6.14E-02 -4.07E-02 0 0.227 0.29 0.368
2.675 -0.96 0.192 4.117 8.02E-04 5.75E-01 -3.53E-02 0 0.251 0.375 0.667 0.203 -1.40E-02 5.05E-02 -3.65E-02 0 0.218 0.303 0.373
2.584 -1.006 0.205 4.505 4.27E-04 5.74E-01 -3.71E-02 0 0.252 0.357 0.593 0.22 1.54E-03 3.70E-02 -3.85E-02 0 0.219 0.305 0.376
2.537 -1.009 0.193 4.373 1.64E-04 5.97E-01 -3.67E-02 0 0.245 0.352 0.54 0.226 5.12E-03 3.50E-02 -4.01E-02 0 0.211 0.308 0.373];

e1      = COEFF(index,1);
c1      = COEFF(index,2);
c2      = COEFF(index,3);
h       = COEFF(index,4);
c3      = COEFF(index,5);
b1      = COEFF(index,6);
b2      = COEFF(index,7);
sA      = COEFF(index,8);
sB      = COEFF(index,9);
sC      = COEFF(index,10);
sD      = COEFF(index,11);
sE      = COEFF(index,12);
f1      = COEFF(index,13);
f2      = COEFF(index,14);
f3      = COEFF(index,15);
f4      = COEFF(index,16);
tau     = COEFF(index,17);
phi     = COEFF(index,18);
sigma   = COEFF(index,19);

function [e1,c1,c2,h,c3,b1,b2,sA,sB,sC,sD,sE,f1,f2,f3,f4,sigma,phi,tau] = getcoeffs_SAZ(index)
COEFF=[2.099 -1.552 0.371 9.629 0 0.228 7.56E-03 0 0.156 0.211 0.316 0.233 -4.40E-02 8.49E-02 -4.09E-02 0 0.19 0.242 0.308
3.511 -1.741 0.324 9.052 1.28E-03 9.04E-03 -0.027 0 0.167 0.204 0.19 0.35 -7.09E-02 7.79E-02 -6.96E-03 0 0.16 0.27 0.314
3.823 -1.892 0.301 7.754 7.85E-04 1.38E-02 -2.99E-02 0 0.179 0.228 0.133 0.428 -5.88E-02 7.27E-02 -1.39E-02 0 0.14 0.299 0.33
3.936 -1.818 0.305 8.385 2.29E-03 -2.60E-03 -2.67E-02 0 0.168 0.231 0.162 0.318 -9.70E-02 9.50E-02 2.03E-03 0 0.152 0.304 0.34
3.801 -1.579 0.275 8.946 3.68E-03 4.34E-02 -2.60E-02 0 0.19 0.181 0.178 0.342 -9.09E-02 8.36E-02 7.30E-03 0 0.157 0.296 0.335
3.684 -1.348 0.21 8.742 4.39E-03 1.54E-01 -3.05E-02 0 0.204 0.191 0.288 0.407 -7.52E-02 9.17E-02 -1.65E-02 0 0.177 0.284 0.335
3.703 -1.493 0.258 10.14 3.18E-03 5.99E-02 -4.45E-02 0 0.205 0.191 0.278 0.319 -7.93E-02 9.97E-02 -2.05E-02 0 0.182 0.277 0.332
3.624 -1.439 0.248 9.825 2.77E-03 1.26E-01 -3.54E-02 0 0.193 0.172 0.344 0.245 -7.35E-02 9.65E-02 -2.30E-02 0 0.193 0.269 0.331
3.519 -1.352 0.239 8.936 2.74E-03 1.87E-01 -3.31E-02 0 0.17 0.179 0.356 0.163 -7.86E-02 7.02E-02 8.41E-03 0 0.198 0.265 0.331
3.317 -1.185 0.211 7.7 3.18E-03 2.34E-01 -3.53E-02 0 0.157 0.191 0.372 0.167 -7.90E-02 7.76E-02 1.41E-03 0 0.194 0.258 0.323
3.161 -1.199 0.264 7.697 2.88E-03 1.65E-01 -4.28E-02 0 0.149 0.182 0.457 0.132 -7.57E-02 9.12E-02 -1.55E-02 0 0.205 0.262 0.333
3.28 -1.287 0.246 8.131 1.78E-03 2.12E-01 -4.26E-02 0 0.147 0.2 0.459 0.105 -7.78E-02 8.31E-02 -5.32E-03 0 0.217 0.266 0.343
3.358 -1.311 0.221 8.182 1.24E-03 2.93E-01 -3.31E-02 0 0.148 0.194 0.486 0.098 -6.91E-02 8.29E-02 -1.38E-02 0 0.214 0.262 0.338
3.347 -1.302 0.223 8.409 1.08E-03 3.80E-01 -1.65E-02 0 0.15 0.197 0.512 0.082 -5.75E-02 8.08E-02 -2.34E-02 0 0.23 0.259 0.347
3.072 -1.168 0.222 6.96 1.18E-03 3.95E-01 -2.58E-02 0 0.157 0.213 0.518 0.099 -3.73E-02 8.56E-02 -4.83E-02 0 0.239 0.27 0.361
2.941 -1.124 0.222 6.679 1.14E-03 4.14E-01 -3.01E-02 0 0.17 0.219 0.513 0.108 -2.51E-02 6.94E-02 -4.44E-02 0 0.241 0.271 0.363
2.795 -1.031 0.218 5.763 1.51E-03 4.30E-01 -3.48E-02 0 0.182 0.217 0.494 0.096 -1.72E-02 6.90E-02 -5.18E-02 0 0.248 0.269 0.366
2.709 -0.952 0.202 4.806 1.63E-03 5.07E-01 -2.44E-02 0 0.177 0.229 0.456 0.092 -1.06E-02 6.80E-02 -5.73E-02 0 0.248 0.269 0.365
2.536 -0.854 0.194 4.433 1.91E-03 6.04E-01 -1.30E-02 0 0.179 0.253 0.407 0.115 -4.80E-03 6.95E-02 -6.47E-02 0 0.245 0.277 0.37
2.523 -0.808 0.147 4.439 2.18E-03 7.43E-01 -2.08E-03 0 0.148 0.262 0.392 0.13 5.87E-03 5.30E-02 -5.89E-02 0 0.247 0.291 0.382
2.292 -0.684 0.142 2.995 2.63E-03 7.95E-01 7.00E-03 0 0.134 0.259 0.346 0.117 1.26E-03 4.98E-02 -5.11E-02 0 0.243 0.298 0.384
2.126 -0.645 0.15 2.219 2.83E-03 7.54E-01 -4.88E-03 0 0.148 0.256 0.297 0.117 4.10E-03 4.90E-02 -5.31E-02 0 0.237 0.302 0.384
];
e1      = COEFF(index,1);
c1      = COEFF(index,2);
c2      = COEFF(index,3);
h       = COEFF(index,4);
c3      = COEFF(index,5);
b1      = COEFF(index,6);
b2      = COEFF(index,7);
sA      = COEFF(index,8);
sB      = COEFF(index,9);
sC      = COEFF(index,10);
sD      = COEFF(index,11);
sE      = COEFF(index,12);
f1      = COEFF(index,13);
f2      = COEFF(index,14);
f3      = COEFF(index,15);
f4      = COEFF(index,16);
tau  = COEFF(index,17);
phi  = COEFF(index,18);
sigma   = COEFF(index,19);
