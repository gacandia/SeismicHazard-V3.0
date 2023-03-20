function [handles]=GMMValidation_Akkar2014(handles,filename)

switch filename
    case 'Akkar2014_0.png'
        Rjb  = logsp(0.1,200,30)';
        on   = ones(30,1);
        Rhyp = [];
        Repi = [];
        lny     = zeros(30,3);
        lny(:,1)= Akkar2014(0.001,4.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(0.001,6.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,3)= Akkar2014(0.001,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',2)
        
        handles.ax1.XLim=[0.1 200];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'RJB(km)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Akkar2014_1.png'
        M    = linspace(4,8,30)';
        Rhyp = [];
        Rjb  = 10*ones(30,1);
        Repi = [];
        lny(:,1) = Akkar2014(0.001,M,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2) = AkkarBoomer2010(0.001,M,Rjb,750,'strike-slip');
        
        plot(handles.ax1,M,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[4 8];
        handles.ax1.YLim=[0.01 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Mw')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Akkar2014_2.png'
        M    = linspace(4,8,30)';
        Rhyp = [];
        Rjb  = 10*ones(30,1);
        Repi = [];
        lny(:,1) = Akkar2014(0.2,M,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2) = AkkarBoomer2010(0.2,M,Rjb,750,'strike-slip');
        
        plot(handles.ax1,M,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[4 8];
        handles.ax1.YLim=[0.01 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Mw')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Akkar2014_3.png'
        M    = linspace(4,8,30)';
        Rhyp = [];
        Rjb  = 10*ones(30,1);
        Repi = [];
        lny(:,1) = Akkar2014(1,M,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2) = AkkarBoomer2010(1,M,Rjb,750,'strike-slip');
        
        plot(handles.ax1,M,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[4 8];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Mw')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Akkar2014_4.png'
        Rjb  = logsp(0.1,200,30)';
        on   = ones(30,1);
        Rhyp = logsp(0.1,200,30)';
        Repi = logsp(0.1,200,30)';
        lny     = zeros(30,3);
        lny(:,1)= Akkar2014(0.001,4.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(0.001,4.5*on,Rhyp,Rjb,Repi,750,'strike-slip','repi');
        lny(:,3)= Akkar2014(0.001,4.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rhyp');
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',1)
        handles.ax1.ColorOrderIndex=1;
        lny(:,1)= Akkar2014(0.001,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(0.001,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','repi');
        lny(:,3)= Akkar2014(0.001,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rhyp');
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',1)        
        
        
        handles.ax1.XLim=[1 200];
        handles.ax1.YLim=[0.0001 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Akkar2014_5.png'
        Rjb  = logsp(0.1,200,30)';
        on   = ones(30,1);
        Rhyp = logsp(0.1,200,30)';
        Repi = logsp(0.1,200,30)';
        lny     = zeros(30,5);
        lny(:,1)= Akkar2014(0.001,6.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(0.001,6.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,3)= Akkar2014(0.001,7.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,4)= Akkar2014(0.001,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,5)= Akkar2014(0.001,8.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[1 200];
        handles.ax1.YLim=[0.001 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PSA(g)')  
        
    case 'Akkar2014_6.png'
        Rjb  = logsp(0.1,200,30)';
        on   = ones(30,1);
        Rhyp = logsp(0.1,200,30)';
        Repi = logsp(0.1,200,30)';
        lny     = zeros(30,5);
        lny(:,1)= Akkar2014(0.2,6.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(0.2,6.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,3)= Akkar2014(0.2,7.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,4)= Akkar2014(0.2,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,5)= Akkar2014(0.2,8.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[1 200];
        handles.ax1.YLim=[0.001 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PSA(g)')        
        
    case 'Akkar2014_7.png'
        Rjb  = logsp(0.1,200,30)';
        on   = ones(30,1);
        Rhyp = logsp(0.1,200,30)';
        Repi = logsp(0.1,200,30)';
        lny     = zeros(30,5);
        lny(:,1)= Akkar2014(1,6.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,2)= Akkar2014(1,6.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,3)= Akkar2014(1,7.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,4)= Akkar2014(1,7.5*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        lny(:,5)= Akkar2014(1,8.0*on,Rhyp,Rjb,Repi,750,'strike-slip','rjb');
        plot(handles.ax1,Rjb,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[1 200];
        handles.ax1.YLim=[0.0001 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PSA(g)')             
        
    case 'Akkar2014_8.png'

        T     = [0.001,0.01,0.02,0.03,0.04,0.05,0.075,0.1,0.15,0.2,0.3,0.4,0.5,0.75,1,1.5,2,3,4];
        lny   = nan(size(T));
        for i=1:length(T)
            lny(i)= Akkar2014(T(i),5,[],30,[],255,'strike-slip','rjb');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01 4];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')         
        
end


