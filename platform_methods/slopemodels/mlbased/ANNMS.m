function [vout] = ANNMS(ky, T, Sa,PGV,M,MDCOL,varargin)

transformer_ann  = MDCOL{1};%py.joblib.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\ann_transform_x.joblib");
mdl              = MDCOL{2};%mdl.load_state_dict(py.torch.load("D:\SeismicHazardPlatform - BETA\SeismicHazardPlatform - BETA\platform_methods\slopemodels\face\ann.pth",py.torch.device('cpu')));

%% make sure all the above lines are running outside the matlab function.(including mdl.eval())

lnky = log(ky);
lnPGV = log(PGV);
lnSa = log(Sa);
no_data = max([length(ky),length(T),length(M),length(PGV),length(Sa)]);
expand_vector = ones(no_data,1);
X = [expand_vector*lnky, expand_vector*T,expand_vector.*M,expand_vector.*lnPGV,expand_vector.*lnSa];

if no_data == 1
    X = py.numpy.reshape(X,[int64(1),int64(-1)]);
end


X_test_transform = transformer_ann.transform(X);
lnEDP = mdl(py.torch.from_numpy(X_test_transform.astype('float32')));

sig = 0.3;
lnEDP = double(lnEDP.detach().numpy());

if nargin==5
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

