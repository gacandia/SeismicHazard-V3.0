function [handles]=GMMValidation_CB11(handles,filename)

switch filename
    case 'CB11_1.png'
        Rrup = logsp(1,100,25)';
        on   = ones(size(Rrup));
        Ztor = 0*on;
        dip  = 90;
        Rjb  = Rrup;
        Z25  = 2;
        lny  = zeros(25,4);
        Database = 'PEER-NGA-NoPSV';
        lny(:,1) = CB11(-4,5*on,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        lny(:,2) = CB11(-4,6*on,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        lny(:,3) = CB11(-4,7*on,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        lny(:,4) = CB11(-4,8*on,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        plot(handles.ax1,Rrup,exp(lny-log(980.66)),'r--','tag','curves','linewidth',1)
        handles.ax1.XLim=[1  100];
        handles.ax1.YLim=[1e-2 1e1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        
    case 'CB11_2.png'
        NM   = 40;
        M    = linspace(4.5,8.5,NM)';
        on   = ones(size(M));
        Ztor = 0*on;
        dip  = 90;
        Z25  = 2;
        lny  = zeros(NM,4);
        Database = 'PEER-NGA-NoPSV';
        Rrup=0*on;  Rjb=Rrup;lny(:,1) = CB11(-4,M,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        Rrup=10*on; Rjb=Rrup;lny(:,2) = CB11(-4,M,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        Rrup=50*on; Rjb=Rrup;lny(:,3) = CB11(-4,M,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        Rrup=200*on;Rjb=Rrup;lny(:,4) = CB11(-4,M,Rrup,Rjb,Ztor,dip,760,Z25,'strike-slip',Database);
        plot(handles.ax1,M,exp(lny-log(980.66)),'r--','tag','curves','linewidth',1)
        handles.ax1.XLim=[4.5  8.5];
        handles.ax1.YLim=[1e-3 1e1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'M')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        
    case 'CB11_3.png'
        Rrup   = logsp(1,100,500)';
        on     = ones(size(Rrup));
        lny    = nan(500,4);
        Z25=2;  Vs30=760;
        M=7.5*on;
        Database = 'PEER-NGA-NoPSV';
        Ztor = 0*on;   dip=90;   Rjb=Rrup;            lny(:,1) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Ztor = 0*on;   dip=45;   Rjb=Rrup;            lny(:,2) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Ztor = 1*on;   dip=45;   Rjb=sqrt(Rrup.^2-1); lny(:,3) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'reverse'    ,Database);
        Ztor = 0*on;   dip=45;   Rjb=Rrup;            lny(:,4) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'normal'     ,Database);
        plot(handles.ax1,Rrup,exp(lny-log(980.66)),'r--','tag','curves','linewidth',1)
        
        handles.ax1.XLim=[1  100];
        handles.ax1.YLim=[0 2.5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        
    case 'CB11_4.png'
        Rrup  = logsp(1,100,500)';
        on    = ones(size(Rrup));
        lny   = nan(500,4);
        M     = 7.5*on;
        Z25   = 2;
        Vs30  = 760;
        Database = 'PEER-NGA-NoPSV';
        
        Rjb1 =Rrup*cosd(45); Rjb1(Rrup>10) = Rrup(Rrup>10)-10;
        Rjb2 =0*Rrup;        Rjb2(Rrup>10) = Rrup(Rrup>10)-10;
        Rjb3 =0*Rrup;        Rjb3(Rrup>10) = Rrup(Rrup>10)-10;
        Rjb4 =0*Rrup;        Rjb4(Rrup>10) = Rrup(Rrup>10)-10;
        
        Ztor = 0*on; dip=90;   Rjb=Rjb1;  lny(:,1) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Ztor = 0*on; dip=45;   Rjb=Rjb2;  lny(:,2) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Ztor = 1*on; dip=45;   Rjb=Rjb3;  lny(:,3) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'reverse'    ,Database);
        Ztor = 0*on; dip=45;   Rjb=Rjb4;  lny(:,4) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'normal'     ,Database);
        
        handles.ax1.XLim=[1  100];
        handles.ax1.YLim=[0 2.5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        plot(handles.ax1,Rrup,exp(lny)/980.66,'r--','tag','curves','linewidth',1)
        
    case 'CB11_5.png'
        Rrup   = logsp(1,100,25)';
        on     = ones(size(Rrup));
        lny    = zeros(25,4);
        Ztor   = 0*on;
        M      = 7.5*on;
        dip    = 90;
        Rjb    = Rrup;
        Z25    = 2;
        Database = 'PEER-NGA-NoPSV';
        
        lny(:,1) = CB11(-4,M,Rrup,Rjb,Ztor,dip,1070,Z25,'strike-slip',Database);
        lny(:,2) = CB11(-4,M,Rrup,Rjb,Ztor,dip,525 ,Z25,'strike-slip',Database);
        lny(:,3) = CB11(-4,M,Rrup,Rjb,Ztor,dip,255 ,Z25,'strike-slip',Database);
        lny(:,4) = CB11(-4,M,Rrup,Rjb,Ztor,dip,150 ,Z25,'strike-slip',Database);
        
        handles.ax1.XLim=[1  100];
        handles.ax1.YLim=[0 2.5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        plot(handles.ax1,Rrup,exp(lny)/980.66,'r--','tag','curves','linewidth',1)
        
    case 'CB11_6.png'
        Rrup   = logsp(1,100,25)';
        on     = ones(size(Rrup));
        lny    = zeros(25,4);
        Ztor   = 0*on;
        M      = 7.5*on;
        dip    = 90;
        Rjb    = Rrup;
        Vs30   = 760;
        Database = 'PEER-NGA-NoPSV';
        
        Z25=0;  lny(:,1) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Z25=2;  lny(:,2) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Z25=5;  lny(:,3) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        Z25=10; lny(:,4) = CB11(-4,M,Rrup,Rjb,Ztor,dip,Vs30,Z25,'strike-slip',Database);
        
        
        handles.ax1.XLim=[1  100];
        handles.ax1.YLim=[0 2.5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (g*sec)')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        plot(handles.ax1,Rrup,exp(lny)/980.66,'r--','tag','curves','linewidth',1)
        

end