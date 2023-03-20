function [handles]=GMMValidation_CB2008(handles,filename)

switch filename
    
    case 'CB2008_1.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=CB2008(T(i),5,0,0,0,90,760,2,'strike-slip','measured');
            lny(2,i)=CB2008(T(i),6,0,0,0,90,760,2,'strike-slip','measured');
            lny(3,i)=CB2008(T(i),7,0,0,0,90,760,2,'strike-slip','measured');
            lny(4,i)=CB2008(T(i),8,0,0,0,90,760,2,'strike-slip','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1.001];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CB2008_2.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=CB2008(T(i),5,10,0,0,90,760,2,'strike-slip','measured');
            lny(2,i)=CB2008(T(i),6,10,0,0,90,760,2,'strike-slip','measured');
            lny(3,i)=CB2008(T(i),7,10,0,0,90,760,2,'strike-slip','measured');
            lny(4,i)=CB2008(T(i),8,10,0,0,90,760,2,'strike-slip','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1.001];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CB2008_3.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=CB2008(T(i),5,50,0,0,90,760,2,'strike-slip','measured');
            lny(2,i)=CB2008(T(i),6,50,0,0,90,760,2,'strike-slip','measured');
            lny(3,i)=CB2008(T(i),7,50,0,0,90,760,2,'strike-slip','measured');
            lny(4,i)=CB2008(T(i),8,50,0,0,90,760,2,'strike-slip','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1.001];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'CB2008_4.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=CB2008(T(i),5,200,0,0,90,760,2,'strike-slip','measured');
            lny(2,i)=CB2008(T(i),6,200,0,0,90,760,2,'strike-slip','measured');
            lny(3,i)=CB2008(T(i),7,200,0,0,90,760,2,'strike-slip','measured');
            lny(4,i)=CB2008(T(i),8,200,0,0,90,760,2,'strike-slip','measured');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[1e-5 1.001];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end