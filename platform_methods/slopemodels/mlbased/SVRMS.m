function [vout] = SVRMS(ky, T, Sa,PGV,M,MDCOL,varargin)

transformer_nystroem = MDCOL{1};%py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\nystroem_transform.joblib");
scaler_x             = MDCOL{2};%py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\nystroem_transform_x.joblib");
mdl                  = MDCOL{3};%py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\svr_nystroem_model.joblib");

lnky = log(ky);
lnPGV = log(PGV);
lnSa = log(Sa);
no_data = max([length(ky),length(T),length(M),length(PGV),length(Sa)]);
expand_vector = ones(no_data,1);
X = [expand_vector*lnky, expand_vector*T,expand_vector.*M,expand_vector.*lnPGV,expand_vector.*lnSa];


if no_data == 1
    X = py.numpy.reshape(X,[int64(1),int64(-1)]);
end
X_test_transform = scaler_x.transform(transformer_nystroem.transform(X));
lnEDP  = mdl.predict(X_test_transform);

sig = 0.3;
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

