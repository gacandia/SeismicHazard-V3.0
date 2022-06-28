function plotSBT(ax,SBT,z)

COL = [255 0 0        % 1
    191 143 0         % 2
    0 153 153         % 3
    123 123 123       % 4
    180 198 231       % 5
    84 130 53         % 6
    198 224 180       % 7
    255 255 0         % 8
    191 143 0]/255;   % 9


z1 = z-mean(diff(z))/2;
z2 = z+mean(diff(z))/2;
x0 = zeros(size(z));

Nregions = size(COL,1);

for i=1:Nregions
    ind  =find(SBT==i);
    if ~isempty(ind)
        Z    = [z1(ind) z2(ind) z2(ind) z1(ind) z1(ind)]';
        X    = [x0(ind) x0(ind) SBT(ind) SBT(ind) x0(ind)]';
        
        % draw patches
        P=patch(ax,'XData',X,'YData',Z);
        P.EdgeColor='none';
        P.FaceColor=COL(i,:);
    end
end

ax.Layer = 'top';