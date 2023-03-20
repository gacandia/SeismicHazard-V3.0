function [handles]=GMMValidation_BA2008(handles,filename)

switch filename
    case 'BA2008_1.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BA2008(T(i),8,0,760,'strike-slip');
            lny(2,i)=BA2008(T(i),7,0,760,'strike-slip');
            lny(3,i)=BA2008(T(i),6,0,760,'strike-slip');
            lny(4,i)=BA2008(T(i),5,0,760,'strike-slip');
        end
        plot(handles.ax1,T,exp(lny)*980.66,'-','linewidth',1)        
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.01 2000];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BA2008_2.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BA2008(T(i),8,30,760,'strike-slip');
            lny(2,i)=BA2008(T(i),7,30,760,'strike-slip');
            lny(3,i)=BA2008(T(i),6,30,760,'strike-slip');
            lny(4,i)=BA2008(T(i),5,30,760,'strike-slip');
        end
        plot(handles.ax1,T,exp(lny)*980.66,'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.01 2000];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BA2008_3.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BA2008(T(i),8,200,760,'strike-slip');
            lny(2,i)=BA2008(T(i),7,200,760,'strike-slip');
            lny(3,i)=BA2008(T(i),6,200,760,'strike-slip');
            lny(4,i)=BA2008(T(i),5,200,760,'strike-slip');
        end
        plot(handles.ax1,T,exp(lny)*980.66,'-','linewidth',1)       
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.01 2000];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end