function [rho] = corr_MacedoLiu2021(T1, T2,mech)



T1(and(T1>=0,T1<0.01))=0.01;
T2(and(T2>=0,T2<0.01))=0.01;

T_min = min(T1, T2); 
T_max = max(T1, T2); 
rho    = zeros(size(T_min));
for i=1:numel(T_min)
    rho(i)=corrModel(T_min(i), T_max(i));
end
rho(T_min<0.01) = nan;
rho(T_max>10)   = nan;

function rho=corrModel(T_min,T_max)

C1 = (1-cos(pi/2 - log(T_max/max(T_min, 0.104)) * 0.277 ));
if T_max < 0.2
    C2 = 1 + 622*(1 - 1./(1+exp(100*T_max-5)))*(T_max-T_min)/(T_max-994);
else
    C2=0;
end
if T_max < 0.1
    C3 = C2;
else
    C3 = C1;
end
C4 = C1 + 0.387 * (sqrt(C3) - C3) * (1 + cos(pi*(T_min)/(0.109)));

if T_max <= 0.109
    rho = C2;
elseif T_min > 0.109
    rho = C1;
elseif T_max < 0.2
    rho = min(C2, C4);
else
    rho = C4;
end

