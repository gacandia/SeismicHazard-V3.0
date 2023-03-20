function [handles]=GMMValidation_I2014(handles,filename)

switch filename
    case 'I2014_1.png'
        
        Rrup = logsp(0.1,150,30);
        on   = ones(1,30);
        lny  = nan(3,30);
        lny(1,:)  = I2014(0,7*on,Rrup,450,'strike-slip');
        lny(2,:)  = I2008(0,7*on,Rrup,760,'strike-slip');
        lny(3,:)  = I2014(0,7*on,Rrup,900,'strike-slip');
        plot(handles.ax1,Rrup,exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0.1 300];
        handles.ax1.YLim   = [0.001 2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance,Rrup (km)')
        ylabel(handles.ax1,'Peak Horizontal Acceleration (g)')
end