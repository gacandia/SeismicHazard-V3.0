function [handles]=GMMValidation_CB2014(handles,filename)


switch filename
    case 'CB2014_1.png'
        Z25  = 0.6068;
        Vs30 = 760;
        W    = 10;
        dip  = 90;
        Zhyp = NaN;
        on   = ones(40,1);
        
        M=3.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny1  = CB2014(0,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R1 = Rrup;
        M=4.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny2  = CB2014(0,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R2 = Rrup;
        M=5.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny3  = CB2014(0,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R3 = Rrup;
        M=6.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny4  = CB2014(0,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R4 = Rrup;
        M=7.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny5  = CB2014(0,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R5 = Rrup;
        
        plot(handles.ax1,R1,exp(lny1),'linewidth',2)
        plot(handles.ax1,R2,exp(lny2),'linewidth',2)
        plot(handles.ax1,R3,exp(lny3),'linewidth',2)
        plot(handles.ax1,R4,exp(lny4),'linewidth',2)
        plot(handles.ax1,R5,exp(lny5),'linewidth',2)
        
        handles.ax1.XLim=[1 1000];
        handles.ax1.YLim=[1e-5 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'PGA (g)')
        
    case 'CB2014_2.png'
        Z25  = 0.6068;
        Vs30 = 760;
        W    = 12;
        dip  = 90;
        Zhyp =NaN;
        on   = ones(40,1);
        
        M=3.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny1  = CB2014(1,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R1 = Rrup;
        M=4.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny2  = CB2014(1,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R2 = Rrup;
        M=5.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny3  = CB2014(1,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R3 = Rrup;
        M=6.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny4  = CB2014(1,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R4 = Rrup;
        M=7.5;Ztor=max(2.673-1.136*max(M-4.970,0),0.001).^2; Rrup = logsp(Ztor,300,40)'; Rx = sqrt(Rrup.^2-Ztor.^2); Rjb = sqrt(Rrup.^2-Ztor.^2); lny5  = CB2014(1,M*on,Rrup,Rjb,Rx,Zhyp,Ztor*on,dip,W,Vs30,Z25,'strike-slip','include','california'); R5 = Rrup;
        
        plot(handles.ax1,R1,exp(lny1),'linewidth',2)
        plot(handles.ax1,R2,exp(lny2),'linewidth',2)
        plot(handles.ax1,R3,exp(lny3),'linewidth',2)
        plot(handles.ax1,R4,exp(lny4),'linewidth',2)
        plot(handles.ax1,R5,exp(lny5),'linewidth',2)        
        handles.ax1.XLim=[1 1000];
        handles.ax1.YLim=[1e-5 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'PSA at 1.0s (g)')
        
    case 'CB2014_3.png'
        handles.ax1.XLim=[1 1000];
        handles.ax1.YLim=[1e-4 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'PGA (g)')
        
    case 'CB2014_4.png'
        handles.ax1.XLim=[1 100];
        handles.ax1.YLim=[1e-4 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'PGA (g)')
        
    case 'CB2014_5.png'
        handles.ax1.XLim=[3 8];
        handles.ax1.YLim=[1e-4 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Moment Magnitude')
        ylabel(handles.ax1,'PGA (g)')
        
    case 'CB2014_6.png'
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-4 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Spectral Pertiod (s)')
        ylabel(handles.ax1,'PSA (g)')
end