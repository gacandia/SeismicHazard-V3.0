function [handles]=GMMValidation_GKAS2017(handles,filename)

switch filename
    case 'GKAS2017_1.png'
        %% FIGRUE 13a IN THE ARTICLE HAS AN ERROR.
%                 T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
%                 lny = nan(4,length(T));
%                 Rx  = 30;
%                 Rjb = Rx;
%                 Ry0 = 0;  %?
%                 W   = 10; %?
%                 dip = 90;
%                 for i=1:length(T)
%                     Ztor=8;Rrup=sqrt(Rx^2+Ztor^2); lny(1,i)=GKAS2017(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
%                     Ztor=4;Rrup=sqrt(Rx^2+Ztor^2); lny(2,i)=GKAS2017(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
%                     Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(3,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
%                     Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(4,i)=GKAS2017(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
%                 end
%         
%                 plot(handles.ax1,T,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'GKAS2017_2.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        Rx  = 30;
        Rjb = 30;
        Ry0 = 0;  %?
        W   = 10; %?
        dip = 90;
        for i=1:length(T)
            Ztor=8;Rrup=sqrt(Rx^2+Ztor^2); lny(1,i)=GKAS2017(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=4;Rrup=sqrt(Rx^2+Ztor^2); lny(2,i)=GKAS2017(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(3,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(4,i)=GKAS2017(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
        end
        
        plot(handles.ax1,T,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'GKAS2017_3.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        Rx  = 1;
        Rjb = 1;
        Ry0 = 0;  %?
        W   = 10; %?
        dip = 90;
        for i=1:length(T)
            Ztor=8;Rrup=sqrt(Rx^2+Ztor^2); lny(1,i)=GKAS2017(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
            Ztor=4;Rrup=sqrt(Rx^2+Ztor^2); lny(2,i)=GKAS2017(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(3,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(4,i)=GKAS2017(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
        end
        
        plot(handles.ax1,T,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        
    case 'GKAS2017_4.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        Rx  = 1;
        Rjb = 1;
        Ry0 = 0;  %?
        W   = 10; %?
        dip = 90;
        for i=1:length(T)
            Ztor=8;Rrup=sqrt(Rx^2+Ztor^2); lny(1,i)=GKAS2017(T(i),5,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=4;Rrup=sqrt(Rx^2+Ztor^2); lny(2,i)=GKAS2017(T(i),6,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(3,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
            Ztor=0;Rrup=sqrt(Rx^2+Ztor^2); lny(4,i)=GKAS2017(T(i),8,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,270,'strike-slip','global');
        end
        
        plot(handles.ax1,T,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'GKAS2017_5.png'
        M    = (3:0.05:8)';
        nM   = length(M);
        lny  = nan(nM,3);
        
        Ztor = interp1([3;5;6;7;8],[8;8;4;0;0],M);
        Rx   = ones(nM,1)*200;
        Rjb  = ones(nM,1)*200;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,1)=GKAS2017(0.1,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');
        
        
        Rx   = ones(nM,1)*30;
        Rjb  = ones(nM,1)*30;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,2)=GKAS2017(0.1,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');
        
        Rx   = ones(nM,1)*1;
        Rjb  = ones(nM,1)*1;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,3)=GKAS2017(0.1,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');        
         
        plot(handles.ax1,M,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[3 8];
        handles.ax1.YLim=[0.0001 10];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'Spectral Acceleration (g)')
        
    case 'GKAS2017_6.png'
        M    = (3:0.05:8)';
        nM   = length(M);
        lny  = nan(nM,3);
        
        Ztor = interp1([3;5;6;7;8],[8;8;4;0;0],M);
        Rx   = ones(nM,1)*200;
        Rjb  = ones(nM,1)*200;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,1)=GKAS2017(3,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');
        
        
        Rx   = ones(nM,1)*30;
        Rjb  = ones(nM,1)*30;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,2)=GKAS2017(3,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');
        
        Rx   = ones(nM,1)*1;
        Rjb  = ones(nM,1)*1;
        Ry0  = ones(nM,1)*0;
        Rrup = sqrt(Ztor.^2+Rx.^2);
        lny(:,3)=GKAS2017(3,M,Rrup,Rjb,Rx,Ry0,Ztor,90,10,760,'strike-slip','global');        
         
        plot(handles.ax1,M,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[3 8];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'Spectral Acceleration (g)')        
        
        
    case 'GKAS2017_7.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(5,length(T));
        Rx   = 30;
        Rrup = Rx;
        Rjb  = Rx;
        Ry0  = 0;  %?
        W    = 10; %?
        dip  = 90;
        Ztor = 0;
        for i=1:length(T)
            lny(1,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,200,'strike-slip','global');
            lny(2,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,400,'strike-slip','global');
            lny(3,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,760,'strike-slip','global');
            lny(4,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,1000,'strike-slip','global');
            lny(5,i)=GKAS2017(T(i),7,Rrup,Rjb,Rx,Ry0,Ztor,dip,W,1500,'strike-slip','global');
        end
        
        plot(handles.ax1,T,exp(lny),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Spectral Acceleration (g)')        
end