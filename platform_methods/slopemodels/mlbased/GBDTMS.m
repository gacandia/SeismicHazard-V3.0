function [vout] = GBDTMS(ky,T,Sa13,PGV,M,mdl,varargin)

lnky = log(ky);
lnPGV = log(PGV);
lnSa = log(Sa13);
no_data = max([length(ky),length(T),length(M),length(PGV),length(Sa13)]);
expand_vector = ones(no_data,1);
X = [expand_vector*lnky, expand_vector*T,expand_vector.*M,expand_vector.*lnPGV,expand_vector.*lnSa];


if no_data == 1
    X = py.numpy.reshape(X,[int64(1),int64(-1)]);
end
X = py.numpy.array(X);
X = py.pandas.DataFrame(X);
X.columns = py.list({"KY","T","M","PGV","Sa1.3"});

dtest = py.xgboost.DMatrix(X);
lnEDP = mdl.predict(dtest);
sig   = 0.3;
lnEDP = double(lnEDP)';

if nargin==6
    vout=[lnEDP,sig*ones(length(lnEDP),1)];
    return
end


y = varargin{1};
dist  = varargin{2};
if strcmp(dist,'pdf')
    vout = lognpdf(y,lnEDP,sig);
elseif strcmp(dist,'cdf')
    vout = logncdf(y,lnEDP,sig);
elseif strcmp(dist,'ccdf')
    vout = 1 - logncdf(y,lnEDP,sig);
    
end


end

