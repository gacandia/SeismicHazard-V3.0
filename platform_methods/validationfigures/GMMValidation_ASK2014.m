function [handles]=GMMValidation_ASK2014(handles,filename)

switch filename
    case 'ASK2014_1.png'
        T     = logsp(0.01,10,40)';
        lny   = nan(length(T),4);
        width = 10;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Rjb   = 30;
        Rx    = 30;
        Ry0   = 0;
        for i=1:length(T)
            Ztor=8.9;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,1)=ASK2014(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=6.5;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,2)=ASK2014(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=3.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,3)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=0.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,4)=ASK2014(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        end
        
        plot(T,exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_2.png'
        T     = logsp(0.01,10,40)';
        lny   = nan(length(T),4);
        width = 10;
        Z10   = NaN;
        VS30  = 270;
        VS30Type = 'measured';
        Rjb   = 30;
        Rx    = 30;
        Ry0   = 0;
        for i=1:length(T)
            Ztor=8.9;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,1)=ASK2014(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=6.5;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,2)=ASK2014(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=3.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,3)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=0.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,4)=ASK2014(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        end
        
        plot(T,exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_3.png'
        T     = logsp(0.01,10,40)';
        lny   = nan(length(T),4);
        width = 10;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Rjb   = 1;
        Rx    = 1;
        Ry0   = 0;
        for i=1:length(T)
            Ztor=8.9;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,1)=ASK2014(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=6.5;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,2)=ASK2014(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=3.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,3)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=0.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,4)=ASK2014(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        end
        
        plot(T,exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_4.png'
        T     = logsp(0.01,10,40)';
        lny   = nan(length(T),4);
        width = 10;
        Z10   = NaN;
        VS30  = 270;
        VS30Type = 'measured';
        Rjb   = 1;
        Rx    = 1;
        Ry0   = 0;
        for i=1:length(T)
            Ztor=8.9;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,1)=ASK2014(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=6.5;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,2)=ASK2014(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=3.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,3)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
            Ztor=0.0;Rrup=sqrt(Rjb^2+Ztor^2);lny(i,4)=ASK2014(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor, 90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        end
        
        plot(T,exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_5.png'
        width = 12;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Ry0      =-ones(30,1)*999;
        on       = ones(30,1);
        
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup3=sqrt(Rjb.^2+Ztor.^2); lny3=ASK2014(0.01,3*on,Rrup3,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup4=sqrt(Rjb.^2+Ztor.^2); lny4=ASK2014(0.01,4*on,Rrup4,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup5=sqrt(Rjb.^2+Ztor.^2); lny5=ASK2014(0.01,5*on,Rrup5,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=6.5*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup6=sqrt(Rjb.^2+Ztor.^2); lny6=ASK2014(0.01,6*on,Rrup6,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=3.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup7=sqrt(Rjb.^2+Ztor.^2); lny7=ASK2014(0.01,7*on,Rrup7,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=1.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup8=sqrt(Rjb.^2+Ztor.^2); lny8=ASK2014(0.01,8*on,Rrup8,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        
        
        plot(Rrup3,exp(lny3),'linewidth',2)
        plot(Rrup4,exp(lny4),'linewidth',2)
        plot(Rrup5,exp(lny5),'linewidth',2)
        plot(Rrup6,exp(lny6),'linewidth',2)
        plot(Rrup7,exp(lny7),'linewidth',2)
        plot(Rrup8,exp(lny8),'linewidth',2)
        
        handles.ax1.XLim   = [1 300];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_6.png'
        width = 12;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Ry0      = ones(30,1)*999;
        on       = ones(30,1);
        
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup3=sqrt(Rjb.^2+Ztor.^2); lny3=ASK2014(0.2,3*on,Rrup3,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup4=sqrt(Rjb.^2+Ztor.^2); lny4=ASK2014(0.2,4*on,Rrup4,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup5=sqrt(Rjb.^2+Ztor.^2); lny5=ASK2014(0.2,5*on,Rrup5,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=6.5*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup6=sqrt(Rjb.^2+Ztor.^2); lny6=ASK2014(0.2,6*on,Rrup6,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=3.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup7=sqrt(Rjb.^2+Ztor.^2); lny7=ASK2014(0.2,7*on,Rrup7,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=1.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup8=sqrt(Rjb.^2+Ztor.^2); lny8=ASK2014(0.2,8*on,Rrup8,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        
        
        plot(Rrup3,exp(lny3),'linewidth',2)
        plot(Rrup4,exp(lny4),'linewidth',2)
        plot(Rrup5,exp(lny5),'linewidth',2)
        plot(Rrup6,exp(lny6),'linewidth',2)
        plot(Rrup7,exp(lny7),'linewidth',2)
        plot(Rrup8,exp(lny8),'linewidth',2)
        
        handles.ax1.XLim   = [1 300];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_7.png'
        width = 12;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Ry0      = ones(30,1)*999;
        on       = ones(30,1);
        
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup3=sqrt(Rjb.^2+Ztor.^2); lny3=ASK2014(1,3*on,Rrup3,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup4=sqrt(Rjb.^2+Ztor.^2); lny4=ASK2014(1,4*on,Rrup4,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup5=sqrt(Rjb.^2+Ztor.^2); lny5=ASK2014(1,5*on,Rrup5,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=6.5*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup6=sqrt(Rjb.^2+Ztor.^2); lny6=ASK2014(1,6*on,Rrup6,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=3.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup7=sqrt(Rjb.^2+Ztor.^2); lny7=ASK2014(1,7*on,Rrup7,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=1.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup8=sqrt(Rjb.^2+Ztor.^2); lny8=ASK2014(1,8*on,Rrup8,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        
        
        plot(Rrup3,exp(lny3),'linewidth',2)
        plot(Rrup4,exp(lny4),'linewidth',2)
        plot(Rrup5,exp(lny5),'linewidth',2)
        plot(Rrup6,exp(lny6),'linewidth',2)
        plot(Rrup7,exp(lny7),'linewidth',2)
        plot(Rrup8,exp(lny8),'linewidth',2)
        
        handles.ax1.XLim   = [1 300];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_8.png'
        width = 12;
        Z10   = NaN;
        VS30  = 760;
        VS30Type = 'measured';
        Ry0      = ones(30,1)*999;
        on       = ones(30,1);
        
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup3=sqrt(Rjb.^2+Ztor.^2); lny3=ASK2014(3,3*on,Rrup3,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup4=sqrt(Rjb.^2+Ztor.^2); lny4=ASK2014(3,4*on,Rrup4,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=8.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup5=sqrt(Rjb.^2+Ztor.^2); lny5=ASK2014(3,5*on,Rrup5,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=6.5*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup6=sqrt(Rjb.^2+Ztor.^2); lny6=ASK2014(3,6*on,Rrup6,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=3.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup7=sqrt(Rjb.^2+Ztor.^2); lny7=ASK2014(3,7*on,Rrup7,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        Ztor=1.0*ones(30,1); Rx = logsp(0.01,300,30)'; Rjb=Rx;  Rrup8=sqrt(Rjb.^2+Ztor.^2); lny8=ASK2014(3,8*on,Rrup8,Rjb,Rx,Ry0,Ztor,90,width,VS30,Z10,'strike-slip','mainshock',VS30Type,'global');
        
        
        plot(Rrup3,exp(lny3),'linewidth',2)
        plot(Rrup4,exp(lny4),'linewidth',2)
        plot(Rrup5,exp(lny5),'linewidth',2)
        plot(Rrup6,exp(lny6),'linewidth',2)
        plot(Rrup7,exp(lny7),'linewidth',2)
        plot(Rrup8,exp(lny8),'linewidth',2)
        
        handles.ax1.XLim   = [1 300];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_9.png'
        width = 12;
        VS30  = 270;
        VS30Type = 'measured';
        Ry0      = NaN;
        T        = logsp(0.01,10,40);
        lny      = nan(5,length(T));
        Rrup     = 30;
        Ztor     = 3;
        Rx       = sqrt(Rrup^2-Ztor^2);
        Rjb      = Rx;
        for i=1:length(T)
            lny(1,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,VS30,0.1,'strike-slip','mainshock',VS30Type,'global');
            lny(2,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,VS30,0.3,'strike-slip','mainshock',VS30Type,'global');
            lny(3,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,VS30,0.5,'strike-slip','mainshock',VS30Type,'global');
            lny(4,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,VS30,1.1,'strike-slip','mainshock',VS30Type,'global');
            lny(5,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,1000,NaN,'strike-slip','mainshock',VS30Type,'global');
        end
        plot(T,exp(lny(1:4,:)),'linewidth',2)
        plot(T,exp(lny(5,:)),'k','linewidth',2)
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'ASK2014_10.png'
        width    = 120;
        VS30Type = 'measured';
        Ry0      = 0;
        T        = logsp(0.01,10,40);
        lny      = nan(5,length(T));
        Rrup     = 30;
        Ztor     = 3;
        Rx       = sqrt(Rrup^2-Ztor^2);
        Rjb      = Rx;
        region = 'california';
        for i=1:length(T)
            lny(1,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,200 ,NaN,'strike-slip','mainshock',VS30Type,region);
            lny(2,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,400 ,NaN,'strike-slip','mainshock',VS30Type,region);
            lny(3,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,760 ,NaN,'strike-slip','mainshock',VS30Type,region);
            lny(4,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,1000,NaN,'strike-slip','mainshock',VS30Type,region);
            lny(5,i)=ASK2014(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,90,width,1500,NaN,'strike-slip','mainshock',VS30Type,region);
        end
        plot(T,exp(lny),'linewidth',2)
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
end