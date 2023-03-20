function [rho] = spa_none(~, h, varargin)
rho=h*0;
for i=1:numel(h)
    if h(i)==0
        rho(i)=1;
    end
end

