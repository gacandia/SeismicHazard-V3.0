function [handles]=GMMValidation_CY2008(handles,filename)

switch filename
    case 'CY2008_1.png'
        T = [0.001 0.01	0.02	0.03	0.04	0.05	0.075   0.1	0.15	0.2	0.25	0.3	0.4	0.5	0.75 1.0 1.5 2.0 3.0 4.0 5.0 7.5 10.0];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=CY2008(T(i),6.8,5,0,5,0,60,1100,5.744229155/1000,'reverse','mainshock','inferred');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CY2008_2.png'
        T = [0.001 0.01	0.02	0.03	0.04	0.05	0.075   0.1	0.15	0.2	0.25	0.3	0.4	0.5	0.75 1.0 1.5 2.0 3.0 4.0 5.0 7.5 10.0];
        lny = zeros(4,length(T));
        Z10=exp(28.5-3.82/8*log(520^8+378.8^8))/1000;
        for i=1:length(T)
            lny(1,i)=CY2008(T(i),5.5,1,0,1,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(2,i)=CY2008(T(i),6.5,1,0,1,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(3,i)=CY2008(T(i),7.5,1,0,1,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(4,i)=CY2008(T(i),8.5,1,0,1,0,90,520,Z10,'strike-slip','mainshock','inferred');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CY2008_3.png'
        T = [0.001 0.01	0.02	0.03	0.04	0.05	0.075   0.1	0.15	0.2	0.25	0.3	0.4	0.5	0.75 1.0 1.5 2.0 3.0 4.0 5.0 7.5 10.0];
        lny = zeros(4,length(T));
        Z10=exp(28.5-3.82/8*log(520^8+378.8^8))/1000;
        for i=1:length(T)
            lny(1,i)=CY2008(T(i),5.5,10,0,10,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(2,i)=CY2008(T(i),6.5,10,0,10,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(3,i)=CY2008(T(i),7.5,10,0,10,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(4,i)=CY2008(T(i),8.5,10,0,10,0,90,520,Z10,'strike-slip','mainshock','inferred');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CY2008_4.png'
        T = [0.001 0.01	0.02	0.03	0.04	0.05	0.075   0.1	0.15	0.2	0.25	0.3	0.4	0.5	0.75 1.0 1.5 2.0 3.0 4.0 5.0 7.5 10.0];
        lny = zeros(4,length(T));
        Z10=exp(28.5-3.82/8*log(520^8+378.8^8))/1000;
        for i=1:length(T)
            lny(1,i)=CY2008(T(i),5.5,30,0,30,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(2,i)=CY2008(T(i),6.5,30,0,30,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(3,i)=CY2008(T(i),7.5,30,0,30,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(4,i)=CY2008(T(i),8.5,30,0,30,0,90,520,Z10,'strike-slip','mainshock','inferred');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CY2008_5.png'
        T = [0.001 0.01	0.02	0.03	0.04	0.05	0.075   0.1	0.15	0.2	0.25	0.3	0.4	0.5	0.75 1.0 1.5 2.0 3.0 4.0 5.0 7.5 10.0];
        lny = zeros(4,length(T));
        Z10=exp(28.5-3.82/8*log(520^8+378.8^8))/1000;
        for i=1:length(T)
            lny(1,i)=CY2008(T(i),5.5,70,0,70,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(2,i)=CY2008(T(i),6.5,70,0,70,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(3,i)=CY2008(T(i),7.5,70,0,70,0,90,520,Z10,'strike-slip','mainshock','inferred');
            lny(4,i)=CY2008(T(i),8.5,70,0,70,0,90,520,Z10,'strike-slip','mainshock','inferred');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
end