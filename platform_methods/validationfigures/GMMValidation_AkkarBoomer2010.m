function [handles]=GMMValidation_AkkarBoomer2010(handles,filename)


switch filename
    case 'AkkarBoomer2010_1.png'
        T  = round([0.01 0.05:0.05:3]*100)/100;
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=AkkarBoomer2010(T(i),5.0,10,'rock','strike-slip');
            lny(2,i)=AkkarBoomer2010(T(i),6.3,10,'rock','strike-slip');
            lny(3,i)=AkkarBoomer2010(T(i),7.6,10,'rock','strike-slip');
        end
        plot(handles.ax1,T,exp(lny)*980.66,'linewidth',1);        
        
        handles.ax1.XLim   = [0 3];
        handles.ax1.YLim   = [0 625];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        
    case 'AkkarBoomer2010_2.png'
        T  = round([0.01 0.05:0.05:3]*100)/100;
        lny = zeros(3,length(T));
        sig = zeros(3,length(T));
        for i=1:length(T)
            [lny(1,i),sig(1,i)] = AkkarBoomer2010(T(i),5.0,10,'rock','strike-slip');
            [lny(2,i),sig(2,i)] = AkkarBoomer2010(T(i),6.3,10,'rock','strike-slip');
            [lny(3,i),sig(3,i)] = AkkarBoomer2010(T(i),7.6,10,'rock','strike-slip');
        end
        plot(handles.ax1,T,exp(lny+sig)*980.66,'linewidth',1);           
        
        handles.ax1.XLim   = [0 3];
        handles.ax1.YLim   = [0 1250];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        
    case 'AkkarBoomer2010_3.png'
        handles.e1.String = [];  % Rjb
        handles.e2.String = [];  % Rjb
        Rjb  = logsp(1,100,50)';
        on    = ones(size(Rjb));
        lnPGV = nan(50,6);
        media = 'rock';  SOF  = 'strike-slip'; M=5*on;   lnPGV(:,1) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'stiff'; SOF  = 'strike-slip'; M=5*on;   lnPGV(:,2) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'soft';  SOF  = 'strike-slip'; M=5*on;   lnPGV(:,3) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock';  SOF  = 'strike-slip'; M=7.6*on; lnPGV(:,4) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'stiff'; SOF  = 'strike-slip'; M=7.6*on; lnPGV(:,5) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'soft';  SOF  = 'strike-slip'; M=7.6*on; lnPGV(:,6) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        
        plot(handles.ax1,Rjb,exp(lnPGV(:,1)) ,'b-','linewidth',1   ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,2)) ,'b-','linewidth',0.5 ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,3)) ,'b--','linewidth',1  ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,4)) ,'r-','linewidth',1   ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,5)) ,'r-','linewidth',0.5 ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,6)) ,'r--','linewidth',1  ,'tag','curves')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        
        handles.ax1.XLim   = [1 100];
        handles.ax1.YLim   = [0.1 112];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'Peak Ground Velocity (cm/s)')
        
        
    case 'AkkarBoomer2010_4.png'
        handles.e1.String = [];  % Rjb
        handles.e2.String = [];  % Rjb
        Rjb  = logsp(1,100,50)';
        on    = ones(size(Rjb));
        lnPGV = nan(50,6);
        media = 'rock'; SOF  = 'strike-slip'; M=5*on;   lnPGV(:,1) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock'; SOF  = 'normal';      M=5*on;   lnPGV(:,2) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock'; SOF  = 'reverse';     M=5*on;   lnPGV(:,3) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock'; SOF  = 'strike-slip'; M=7.6*on; lnPGV(:,4) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock'; SOF  = 'normal';      M=7.6*on; lnPGV(:,5) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        media = 'rock'; SOF  = 'reverse';     M=7.6*on; lnPGV(:,6) = AkkarBoomer2010(-1,M,Rjb,media,SOF);
        
        plot(handles.ax1,Rjb,exp(lnPGV(:,1)) ,'b-','linewidth',1   ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,2)) ,'b-','linewidth',0.5 ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,3)) ,'b--','linewidth',1  ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,4)) ,'r-','linewidth',1   ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,5)) ,'r-','linewidth',0.5 ,'tag','curves')
        plot(handles.ax1,Rjb,exp(lnPGV(:,6)) ,'r--','linewidth',1  ,'tag','curves')
        handles.rad1.Value=0;
        handles.rad2.Value=1;
        
        handles.ax1.XLim   = [1 100];
        handles.ax1.YLim   = [0.1 112];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'Peak Ground Velocity (cm/s)')
end
