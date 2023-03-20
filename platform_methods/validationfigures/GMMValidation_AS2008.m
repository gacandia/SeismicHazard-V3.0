function [handles]=GMMValidation_AS2008(handles,filename)

switch filename
    case 'AS2008_1.png'
        T = [0.01, 0.02, 0.03, 0.04, 0.05,   0.075,  0.1, 0.15,  0.2, 0.25,  0.3,  0.4,  0.5, 0.75,    1,  1.5,    2,    3,    4,    5,  7.5,   10];
        Z10 = Z10_default_AS08_NGA(270);
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=AS2008(T(i),5,30,30,30, 7,90,10,270,Z10,'strike-slip','mainshock','measured');
            lny(2,i)=AS2008(T(i),6,30,30,30, 3,90,10,270,Z10,'strike-slip','mainshock','measured');
            lny(3,i)=AS2008(T(i),7,30,30,30, 0,90,10,270,Z10,'strike-slip','mainshock','measured');
            lny(4,i)=AS2008(T(i),8,30,30,30, 0,90,10,270,Z10,'strike-slip','mainshock','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AS2008_2.png'
        T = [0.01, 0.02, 0.03, 0.04, 0.05,   0.075,  0.1, 0.15,  0.2, 0.25,  0.3,  0.4,  0.5, 0.75,    1,  1.5,    2,    3,    4,    5,  7.5,   10];
        Z10 = Z10_default_AS08_NGA(550);
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=AS2008(T(i),5,30,30,30, 7,90,10,550,Z10,'strike-slip','mainshock','measured');
            lny(2,i)=AS2008(T(i),6,30,30,30, 3,90,10,550,Z10,'strike-slip','mainshock','measured');
            lny(3,i)=AS2008(T(i),7,30,30,30, 0,90,10,550,Z10,'strike-slip','mainshock','measured');
            lny(4,i)=AS2008(T(i),8,30,30,30, 0,90,10,550,Z10,'strike-slip','mainshock','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AS2008_3.png'
        T = [0.01, 0.02, 0.03, 0.04, 0.05,   0.075,  0.1, 0.15,  0.2, 0.25,  0.3,  0.4,  0.5, 0.75,    1,  1.5,    2,    3,    4,    5,  7.5,   10];
        Z10 = Z10_default_AS08_NGA(760);
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=AS2008(T(i),5,30,30,30, 7,90,10,760,Z10,'strike-slip','mainshock','measured');
            lny(2,i)=AS2008(T(i),6,30,30,30, 3,90,10,760,Z10,'strike-slip','mainshock','measured');
            lny(3,i)=AS2008(T(i),7,30,30,30, 0,90,10,760,Z10,'strike-slip','mainshock','measured');
            lny(4,i)=AS2008(T(i),8,30,30,30, 0,90,10,760,Z10,'strike-slip','mainshock','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AS2008_4.png'
        T   = [0.01, 0.02, 0.03, 0.04, 0.05,   0.075,  0.1, 0.15,  0.2, 0.25,  0.3,  0.4,  0.5, 0.75,    1,  1.5,    2,    3,    4,    5,  7.5,   10];
        Z10 = Z10_default_AS08_NGA(270);
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=AS2008(T(i),5,1,1,1, 7,90,15,270,Z10,'strike-slip','mainshock','measured');
            lny(2,i)=AS2008(T(i),6,1,1,1, 3,90,15,270,Z10,'strike-slip','mainshock','measured');
            lny(3,i)=AS2008(T(i),7,1,1,1, 0,90,15,270,Z10,'strike-slip','mainshock','measured');
            lny(4,i)=AS2008(T(i),8,1,1,1, 0,90,15,270,Z10,'strike-slip','mainshock','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-4 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AS2008_5.png'
        T   = [0.01, 0.02, 0.03, 0.04, 0.05,   0.075,  0.1, 0.15,  0.2, 0.25,  0.3,  0.4,  0.5, 0.75,    1,  1.5,    2,    3,    4,    5,  7.5,   10];
        Z10 = Z10_default_AS08_NGA(550);
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=AS2008(T(i),5,1,1,1, 7,90,15,550,Z10,'strike-slip','mainshock','measured');
            lny(2,i)=AS2008(T(i),6,1,1,1, 3,90,15,550,Z10,'strike-slip','mainshock','measured');
            lny(3,i)=AS2008(T(i),7,1,1,1, 0,90,15,550,Z10,'strike-slip','mainshock','measured');
            lny(4,i)=AS2008(T(i),8,1,1,1, 0,90,15,550,Z10,'strike-slip','mainshock','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-4 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end

function Z10=Z10_default_AS08_NGA(Vs30)

if Vs30<180
    Z10=exp(6.745);
elseif Vs30<=500
    Z10=exp(6.745-1.35*log(Vs30/180));
else
    Z10=exp(5.394-4.48*log(Vs30/500));
end
