function [handles]=GMMValidation_Bindi2011(handles,filename)

switch filename
    case 'Bindi2011_1.png'
        Rjb       = logsp(0.1,200,30);
        on        = logsp(1,1,30);
        [lny,sig] = Bindi2011(0.01,5.7*on,Rjb,'B','strike-slip','geoh');
        
        plot(handles.ax1,Rjb,exp(lny    )*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny+sig)*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny-sig)*9.8066,'-','linewidth',2)
        handles.ax1.XLim   = [0.05 300];
        handles.ax1.YLim   = [0.005 50];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance [km]')
        ylabel(handles.ax1,'PGA, m/s^2')
        
    case 'Bindi2011_2.png'
        Rjb       = logsp(0.1,200,30);
        on        = logsp(1,1,30);
        [lny,sig] = Bindi2011(0.01,6.4*on,Rjb,'B','reverse','geoh');
        
        plot(handles.ax1,Rjb,exp(lny    )*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny+sig)*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny-sig)*9.8066,'-','linewidth',2)
        handles.ax1.XLim   = [0.05 300];
        handles.ax1.YLim   = [0.005 50];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance [km]')
        ylabel(handles.ax1,'PGA, m/s^2')
        
    case 'Bindi2011_3.png'
        Rjb       = logsp(0.1,200,30);
        on        = logsp(1,1,30);
        [lny,sig] = Bindi2011(0.01,6.9*on,Rjb,'C','normal','geoh');
        
        plot(handles.ax1,Rjb,exp(lny    )*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny+sig)*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny-sig)*9.8066,'-','linewidth',2)
        handles.ax1.XLim   = [0.05 300];
        handles.ax1.YLim   = [0.005 50];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance [km]')
        ylabel(handles.ax1,'PGA, m/s^2')
        
    case 'Bindi2011_4.png'
        Rjb       = logsp(0.1,200,30);
        on        = logsp(1,1,30);
        [lny,sig] = Bindi2011(0.01,4.6*on,Rjb,'B','unspecified','geoh');
        
        plot(handles.ax1,Rjb,exp(lny    )*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny+sig)*9.8066,'-','linewidth',2)
        plot(handles.ax1,Rjb,exp(lny-sig)*9.8066,'-','linewidth',2)
        handles.ax1.XLim   = [0.05 300];
        handles.ax1.YLim   = [0.005 50];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance [km]')
        ylabel(handles.ax1,'PGA, m/s^2')        
end