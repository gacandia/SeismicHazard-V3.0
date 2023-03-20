function [handles]=GMMValidation_Youngs1997(handles,filename)


switch filename
    case 'Youngs1997_1.png'
        
        Rrup= logsp(10,500,30)';
        on  = ones(1,30)';
        lny(1,:)=Youngs1997(0,7.05*on,Rrup,21*on,'rock','interface');
        lny(2,:)=Youngs1997(0,7.05*on,Rrup,26*on,'soil','interface');
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',2)
        
        handles.ax1.XLim=[10 500];
        handles.ax1.XTick=[10 20 50 100 200 500];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.YTick=[0.001 0.002 0.005 0.01 0.02 0.05 0.1 0.2 0.5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance (km)')
        ylabel(handles.ax1,'PGA(g)')  

    case 'Youngs1997_2.png'
        
        Rrup= logsp(10,500,30)';
        on  = ones(1,30)';
        lny(1,:)=Youngs1997(0,8.05*on,Rrup,22*on,'rock','interface');
        lny(2,:)=Youngs1997(0,8.05*on,Rrup,25*on,'soil','interface');
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',2)
        
        handles.ax1.XLim=[10 500];
        handles.ax1.XTick=[10 20 50 100 200 500];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.YTick=[0.001 0.002 0.005 0.01 0.02 0.05 0.1 0.2 0.5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance (km)')
        ylabel(handles.ax1,'PGA(g)')          
end