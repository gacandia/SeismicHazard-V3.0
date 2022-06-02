function [vout] = PLSR_S(ky, T,  Sa13, M ,mdl,varargin)
% use BMT2019 as template
% X: ky, T, M, Sa
sig = 0.48;

% common pattern for other mechanism
lnky = log(ky);
lnSa = log(Sa13);
[nrow,ncol] = size(lnSa);
if nrow ==1 && ncol==1
    X = [lnky, T,M,lnSa];
    X = py.numpy.reshape(X,[int64(1),int64(4)]);
    lnEDP = mdl.predict(X);
    lnEDP = double(lnEDP);
else
    lnSa = reshape(lnSa,[],1);
    M = reshape(M,[],1);
    no_data = length(lnSa);
    expand_vector = ones(no_data,1);
    X = [expand_vector*lnky, expand_vector*T,expand_vector.*M,lnSa];
    lnEDP = mdl.predict(X);
    lnEDP = double(lnEDP);
    lnEDP = reshape(lnEDP,nrow,ncol);
end



if nargin==5
    vout=[lnEDP,sig*ones(length(lnEDP),1)];
    return
end


y     = varargin{1};
dist  = varargin{2};
if strcmp(dist,'pdf')
    vout = lognpdf(y,lnEDP,sig);
elseif strcmp(dist,'cdf')
    vout = logncdf(y,lnEDP,sig);
elseif strcmp(dist,'ccdf')
    vout = 1 - logncdf(y,lnEDP,sig);
end



end

