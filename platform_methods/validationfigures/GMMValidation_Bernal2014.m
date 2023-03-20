function [handles]=GMMValidation_Bernal2014(handles,filename)

switch filename
    case 'Bernal2014_1.png'
        Rrup = logsp(5,500,30);
        on   = ones(1,30);
        lny(1,:) = Bernal2014(0.001,4*on,Rrup,10*on,'interface');
        lny(2,:) = Bernal2014(0.001,5*on,Rrup,10*on,'interface');
        lny(3,:) = Bernal2014(0.001,6*on,Rrup,10*on,'interface');
        lny(4,:) = Bernal2014(0.001,7*on,Rrup,10*on,'interface');
        lny(5,:) = Bernal2014(0.001,8*on,Rrup,10*on,'interface');
        plot(handles.ax1,Rrup,exp(lny)*980.66,'linewidth',1)
        handles.ax1.XLim=[5 500];
        handles.ax1.YLim=[1e-1 1e3];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Hgypocentral Distance (km)')
        ylabel(handles.ax1,'PGA (cm/s2)')
        
    case 'Bernal2014_2.png'
        T    = logsp(0.01,5,50);
        lny  = ones(1,length(T));
        for i=1:length(T)
            lny(i) = Bernal2014(T(i),5,35,10,'interface');
        end
        To = linspace(0,5,200);
        plot(handles.ax1,To,interp1(T,exp(lny)*980.66,To,'spline'),'-','linewidth',1)
        handles.ax1.XLim=[0 5];
        handles.ax1.YLim=[0 70];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (cm/s2)')
                
end