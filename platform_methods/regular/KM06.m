function[lny,sigma,tau,phi]=KM06(To,M,Rrup,SOF,adjfun)

% Syntax : KM06 SOF                                                         
isadmisible = imag(To)==0 && To==-4;
if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end

% model coefficients, 
c1      =3.495;     %No puede ser negativo ya que sino parten muy abajo las curvas
c2      =2.764;
c3      =-8.539;    %Esta negativo, para que se parezca lo más posible al gráfico del paper
c4      =-1.008;    %Debe ser negativo para que la pendiente de la recta sea negativa
h       =6.155;
f1      =-0.464;    %Lo puse negativo debido a que en la funcion de BTA03 es negativo y ademas adquiere similitud al gráfico del paper si es negativo
f2      =0.165;


switch SOF % SGS site category 
    case 'strike-slip',     FN = 0; FR = 0; 
    case 'normal',          FN = 1; FR = 0;
    case 'normal-oblique',  FN = 1; FR = 0;
    case 'reverse',         FN = 0; FR = 1; 
    case 'reverse-oblique', FN = 0; FR = 1;
    case 'unspecified',     FN = 0; FR = 0; % assumption
end

lny   = c1 + c2*(M-6) + c3*log(M/6) + c4*log(sqrt(Rrup.^2+h.^2)) + f1*FN + f2*FR;
sigma = 0.708*ones(size(M));
tau   = nan(size(M));
phi   = nan(size(M));

% unit convertion
lny  = lny+log(100);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end





