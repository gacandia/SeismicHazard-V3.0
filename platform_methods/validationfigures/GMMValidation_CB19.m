function [handles]=GMMValidation_CB19(handles,filename)

switch filename
    
    case 'CB19_1.png'
        Rx    = logsp(1.2,300,55)';
        on    = ones(size(Rx));
        Zbot  = 15;
        W     = 999;
        Zhyp  = 999;
        Z25   = 999;
        mechanism = 'strike-slip'; Vs30=760;reg='california';
        % strike-slip
        lnAI1   = nan(length(Rx),6);
        dip   = 90; M=3.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,1) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=4.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,2) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=5.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,3) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=6.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,4) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=7.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,5) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=8.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,6) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        plot(handles.ax1,Rx,exp(lnAI1)/100 ,'b-','linewidth',1,'tag','curves')
        
        handles.ax1.XLim=[1e0  1e3];
        handles.ax1.YLim=[1e-8 1e2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'AI (m/s)')
        
    case 'CB19_2.png'
        M     = linspace(3,8,55)';
        on    = ones(size(M));
        Zbot  = 15;
        W     = 999;
        Zhyp  = 999;
        Z25   = 999;
        
        % strike-slip
        lnAI1   = nan(length(M),5);
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 0*on;   Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,1) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 10*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,2) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 40*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,3) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 150*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,4) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 300*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,5) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        plot(handles.ax1,M,exp(lnAI1)/100,'b-','linewidth',1)
        
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 0*on;   Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,1) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 10*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,2) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 40*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,3) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 150*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,4) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 300*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,5) = CB19(-5,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        plot(handles.ax1,M,exp(lnAI2)/100,'r--','linewidth',1,'tag','curves')
        
        handles.ax1.XLim=[3  8];
        handles.ax1.YLim=[1e-8 1e2];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'AI (m/s)')
        
    case 'CB19_3.png'
        Rx    = logsp(1.2,300,55)';
        on    = ones(size(Rx));
        Zbot  = 15;
        W     = 999;
        Zhyp  = 999;
        Z25   = 999;
        mechanism = 'strike-slip'; Vs30=760;reg='california';
        % strike-slip
        lnAI1   = nan(length(Rx),6);
        dip   = 90; M=3.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,1) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=4.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,2) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=5.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,3) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=6.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,4) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=7.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,5) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        dip   = 90; M=8.5*on; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,6) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot, dip,W,Vs30,Z25,mechanism,reg);
        plot(handles.ax1,Rx,exp(lnAI1)/100 ,'b-','linewidth',1,'tag','curves')
        
        handles.ax1.XLim=[1e0  1e3];
        handles.ax1.YLim=[1e-3 1e2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'CAV (m/s)')
        
    case 'CB19_4.png'
        M     = linspace(3,8,55)';
        on    = ones(size(M));
        Zbot  = 15;
        W     = 999;
        Zhyp  = 999;
        Z25   = 999;
        
        % strike-slip
        lnAI1   = nan(length(M),5);
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 0*on;   Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,1) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 10*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,2) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 40*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,3) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 150*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,4) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        dip   = 90; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 300*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI1(:,5) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'strike-slip','california');
        plot(handles.ax1,M,exp(lnAI1)/100,'b-','linewidth',1,'tag','curves')
        
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 0*on;   Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,1) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 10*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,2) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 40*on;  Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,3) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 150*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,4) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        dip   = 45; Ztor = max(2.673 - 1.136*max(M-4.970,0),0).^2; Rx = 300*on; Rjb = Rx; Rrup = sqrt(Rx.^2+Ztor.^2); lnAI2(:,5) = CB19(-4,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,W,760,Z25,'reverse','california');
        plot(handles.ax1,M,exp(lnAI2)/100,'r--','linewidth',1,'tag','curves')
        
        handles.ax1.XLim=[3  8];
        handles.ax1.YLim=[1e-3 1e2];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'CAV (m/s)')
end