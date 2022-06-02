function [vout] = PCRMF(ky, T, Sa,PGV,M,MDCOL,varargin)

scaler  = MDCOL{1}; %py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\pcr_transform_x.joblib");
pca     = MDCOL{2}; %py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\pca_transform.joblib");
mdl     = MDCOL{3}; %py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\pcr_model.joblib");
lnky    = log(ky);
lnPGV   = log(PGV);
lnSa    = log(Sa);
no_data = max([length(ky),length(T),length(M),length(PGV),length(Sa)]);
expand_vector = ones(no_data,1);
X = [expand_vector*lnky, expand_vector*T,expand_vector.*M,expand_vector.*lnPGV,expand_vector.*lnSa];

if no_data == 1
    X = py.numpy.reshape(X,[int64(1),int64(-1)]);
end

X_reduced = pca.transform(scaler.transform(X));
X_reduced = double(X_reduced);
[nr,~]    = size(X_reduced);
if nr ==1
    X_reduced = py.numpy.reshape(X_reduced(:,1:end-1),[int64(1),int64(-1)]);
else
    X_reduced= X_reduced(:,1:4);
end

lnEDP = mdl.predict(X_reduced);
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

