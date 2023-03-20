function [handles]=GMMValidation_CY2014(handles,filename)

%T   = [0.001 0.01 0.02 0.03 0.04 0.05 0.075 0.1 0.12 0.15 0.17 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];

switch filename
    case 'CY2014_1.png', To=0.01;
    case 'CY2014_2.png', To=0.2;
    case 'CY2014_3.png', To=1;
    case 'CY2014_4.png', To=3;
    case 'CY2014_5.png', To=0.01;
    case 'CY2014_6.png', To=0.2;
    case 'CY2014_7.png', To=1;
    case 'CY2014_8.png', To=3;
end

switch filename
    case {'CY2014_1.png','CY2014_2.png','CY2014_3.png','CY2014_4.png'}
        n        = 40;
        on       = ones(n,1);
        Rx       = logsp(1,300,n)';
        Rjb      = Rx;
        M1       = 3.5*on; Ztor1 = max(2.673-1.136*max(M1-4.97,0),0).^2; Rrup1 = sqrt(Ztor1.^2+Rx.^2);
        M2       = 4.5*on; Ztor2 = max(2.673-1.136*max(M2-4.97,0),0).^2; Rrup2 = sqrt(Ztor2.^2+Rx.^2);
        M3       = 5.5*on; Ztor3 = max(2.673-1.136*max(M3-4.97,0),0).^2; Rrup3 = sqrt(Ztor3.^2+Rx.^2);
        M4       = 6.5*on; Ztor4 = max(2.673-1.136*max(M4-4.97,0),0).^2; Rrup4 = sqrt(Ztor4.^2+Rx.^2);
        M5       = 7.5*on; Ztor5 = max(2.673-1.136*max(M5-4.97,0),0).^2; Rrup5 = sqrt(Ztor5.^2+Rx.^2);
        M6       = 8.5*on; Ztor6 = max(2.673-1.136*max(M6-4.97,0),0).^2; Rrup6 = sqrt(Ztor6.^2+Rx.^2);
        dip      = 90;
        Vs30     = 760;
        Z10      = NaN;
        SOF      = 'strike-slip';
        Vs30type = 'measured';
        region   = 'global';
        
        lny      = nan(n,6);
        lny(:,1) = CY2014(To,M1,Rrup1,Rjb,Rx,Ztor1,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,2) = CY2014(To,M2,Rrup2,Rjb,Rx,Ztor2,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,3) = CY2014(To,M3,Rrup3,Rjb,Rx,Ztor3,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,4) = CY2014(To,M4,Rrup4,Rjb,Rx,Ztor4,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,5) = CY2014(To,M5,Rrup5,Rjb,Rx,Ztor5,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,6) = CY2014(To,M6,Rrup6,Rjb,Rx,Ztor6,dip,Vs30,Z10,SOF,Vs30type,region);
        handles.ax1.ColorOrder=[0.63922 0.078431 0.18039;1 0 1;0 1 1;0 0 1;0 1 0;1 0 0];
        
        plot(Rx,exp(lny),'linewidth',1)
        handles.ax1.XLim   = [1 300];
        handles.ax1.YLim   = [1e-4 5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'PSA(g)')
        
    case {'CY2014_5.png','CY2014_6.png','CY2014_7.png','CY2014_8.png'}

        dip      = 45;
        Vs30     = 760;
        W        = 20;
        Z10      = exp(-7.15./4.*log((Vs30.^4+570.94.^4)./(1360.^4+570.94.^4)))/1000; % must be input in km
        SOF      = 'reverse';
        Vs30type = 'measured';
        region   = 'global';        
        n        = 40;
        on       = ones(n,1);
        Rx       = logsp(0.1,300,n)';
        lny      = nan(n,3);
        M         = 5.5*on; 
        Ztor      = (max(2.704-1.226.*max(M-5.849,0),0)).^2;
        [Rrup,Rjb]= getRrupRjb(Ztor,dip,W,Rx);
        
        lny(:,1) = CY2014(To,M,Rrup,Rjb,Rx,Ztor,dip,Vs30,Z10,SOF,Vs30type,region);
        
        M        = 6.5*on; 
        Ztor     = (max(2.704-1.226.*max(M-5.849,0),0)).^2;
        [Rrup,Rjb]= getRrupRjb(Ztor,dip,W,Rx);
        lny(:,2) = CY2014(To,M,Rrup,Rjb,Rx,Ztor,dip,Vs30,Z10,SOF,Vs30type,region);
        
        M        = 7.5*on; 
        Ztor     = (max(2.704-1.226.*max(M-5.849,0),0)).^2;
        [Rrup,Rjb]= getRrupRjb(Ztor,dip,W,Rx);
        lny(:,3) = CY2014(To,M,Rrup,Rjb,Rx,Ztor,dip,Vs30,Z10,SOF,Vs30type,region);
        
        handles.ax1.ColorOrder=[0 0 1;0 1 0;1 0 0];
        plot(Rx,exp(lny),'linewidth',2)
        
        handles.ax1.XLim   = [0.1 300];
        handles.ax1.YLim   = [1e-4 5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rx (km)')
        ylabel(handles.ax1,'PSA(g)')
end

function[Rrup,Rjb]=getRrupRjb(Ztor,dip,W,x)

xsource = linspace(0,W*cosd(dip),1000);
ysource = linspace(-Ztor(1),-Ztor(1)-W*sind(dip),1000);
Rrup   = zeros(size(x));
Rjb    = zeros(size(x));

for i=1:numel(Rrup)
   dist = sqrt((x(i)-xsource).^2+ysource.^2);
   Rrup(i)=min(dist);
   
   dist = sqrt((x(i)-xsource).^2);
   Rjb(i)=min(dist);   
end

