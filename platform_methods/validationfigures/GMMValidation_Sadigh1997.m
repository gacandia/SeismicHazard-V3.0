function [handles]=GMMValidation_Sadigh1997(handles,filename)

switch filename
    
    case 'Sadigh1997_1.png'
        T=[0.01 0.02 0.075 0.10 0.20 0.30 0.40 0.50 0.75 1.00 1.50 2.00 3.00 4.00];
        lny=zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Sadigh1997(T(i),5.5,1,'rock','strike-slip');
            lny(2,i)=Sadigh1997(T(i),6.5,1,'rock','strike-slip');
            lny(3,i)=Sadigh1997(T(i),7.5,1,'rock','strike-slip');
            lny(4,i)=Sadigh1997(T(i),8.5,1,'rock','strike-slip');
        end
        To = [0.01,logsp(0.02,4,100)];
        plot(To,exp(interp1(log(T'),lny',log(To),'pchip')'),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
  
    case 'Sadigh1997_2.png'
 
        T=[0.01 0.02 0.075 0.10 0.20 0.30 0.40 0.50 0.75 1.00 1.50 2.00 3.00 4.00];
        lny=zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Sadigh1997(T(i),5.5,10,'rock','strike-slip');
            lny(2,i)=Sadigh1997(T(i),6.5,10,'rock','strike-slip');
            lny(3,i)=Sadigh1997(T(i),7.5,10,'rock','strike-slip');
            lny(4,i)=Sadigh1997(T(i),8.5,10,'rock','strike-slip');
        end
        To = [0.01,logsp(0.02,4,100)];
        plot(To,exp(interp1(log(T'),lny',log(To),'spline')'),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'Sadigh1997_3.png'
        T=[0.01 0.02 0.075 0.10 0.20 0.30 0.40 0.50 0.75 1.00 1.50 2.00 3.00 4.00];
        lny=zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Sadigh1997(T(i),5.5,30,'rock','strike-slip');
            lny(2,i)=Sadigh1997(T(i),6.5,30,'rock','strike-slip');
            lny(3,i)=Sadigh1997(T(i),7.5,30,'rock','strike-slip');
            lny(4,i)=Sadigh1997(T(i),8.5,30,'rock','strike-slip');
        end
        To = [0.01,logsp(0.02,4,100)];
        plot(To,exp(interp1(log(T'),lny',log(To),'spline','extrap')'),'-','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'Sadigh1997_4.png'
        T=[0.01 0.02 0.075 0.10 0.20 0.30 0.40 0.50 0.75 1.00 1.50 2.00 3.00 4.00];
        lny=zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Sadigh1997(T(i),5.5,70,'rock','strike-slip');
            lny(2,i)=Sadigh1997(T(i),6.5,70,'rock','strike-slip');
            lny(3,i)=Sadigh1997(T(i),7.5,70,'rock','strike-slip');
            lny(4,i)=Sadigh1997(T(i),8.5,70,'rock','strike-slip');
        end
        To = [0.01,logsp(0.02,6,100)];
        plot(To,exp(interp1(log(T'),lny',log(To),'pchip')'),'-','linewidth',1)
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.0007 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
end