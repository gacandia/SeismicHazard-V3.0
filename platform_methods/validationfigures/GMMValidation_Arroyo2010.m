function [handles]=GMMValidation_Arroyo2010(handles,filename)

switch filename
    case 'Arroyo2010_1.png'
        Mw    = linspace(5,8.4,30);
        Rrup  = 23*ones(1,30);
        lny   = Arroyo2010(0.01,Mw,Rrup);
        
        plot(handles.ax1,Mw,exp(lny)*980.66,'-','linewidth',2)

        handles.ax1.XLim   = [5 8.4];
        handles.ax1.YLim   = [0 600];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'M_w')
        ylabel(handles.ax1,'PGA [cm/s^2]')

    case 'Arroyo2010_2.png'
        Mw    = linspace(5,8.4,30);
        Rrup  = 21*ones(1,30);
        lny   = Arroyo2010(0.1,Mw,Rrup);
        
        plot(handles.ax1,Mw,exp(lny)*980.66,'-','linewidth',2)

        handles.ax1.XLim   = [5 8.4];
        handles.ax1.YLim   = [0 1000];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'M_w')
        ylabel(handles.ax1,'PGA [cm/s^2]')        
end