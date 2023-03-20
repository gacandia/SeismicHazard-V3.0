function [handles]=GMMValidation_I2008(handles,filename)

switch filename

    case 'I2008_1.png'
        T = [0.01 0.02 0.03 0.04 0.05 0.06 0.08 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.6 0.7 0.8 0.9 1 1.5 2 3 4 5 6 7 8 9 10];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=I2008(T(i),7,6,500,'reverse');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
         
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';    
    
    case 'I2008_2.png'
        T = [0.01 0.02 0.03 0.04 0.05 0.06 0.08 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.6 0.7 0.8 0.9 1 1.5 2 3 4 5 6 7 8 9 10];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=I2008(T(i),6,6,500,'strike-slip');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)        
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end