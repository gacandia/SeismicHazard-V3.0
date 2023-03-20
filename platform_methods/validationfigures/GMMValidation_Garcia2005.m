function [handles]=GMMValidation_Garcia2005(handles,filename)

switch filename
    case 'Garcia2005_1.png'
        T = [0.01 1/25 1/20 1/13.33 1/10 1/5 1/3.33 1/2.5 1/2 1/1.33 1/1 1/0.67 1/0.5 1/0.33 1/0.25 1/0.2];
        lny=zeros(6,length(T));
        for i=1:length(T)
            lny(1,i)=Garcia2005(T(i),6,150,150,40,'horizontal');
            lny(2,i)=Garcia2005(T(i),6,150,150,80,'horizontal');
            lny(3,i)=Garcia2005(T(i),6,150,150,120,'horizontal');
            
            lny(4,i)=Garcia2005(T(i),7.5,150,150,40,'horizontal');
            lny(5,i)=Garcia2005(T(i),7.5,150,150,80,'horizontal');
            lny(6,i)=Garcia2005(T(i),7.5,150,150,120,'horizontal');
        end
        plot(1./T,exp(lny)*980.66,'linewidth',1)
        handles.ax1.XLim=[0.15 30];
        handles.ax1.YLim=[1e-1 1e3];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end