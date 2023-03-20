function [handles]=GMMValidation_GA2011(handles,filename)

switch filename
    case 'GA2011_1.png'
        T   = logsp(0.01,10,50);
        lnY = nan(4,length(T));
        Vs30=760;
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,5,5,Vs30,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,6,5,Vs30,'strike-slip');
            lnY(3,i)=GA2011(T(i)+3j,7,5,Vs30,'strike-slip');
            lnY(4,i)=GA2011(T(i)+3j,8,5,Vs30,'strike-slip');
        end
        plot(handles.ax1,T,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 1.4];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (sec)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_2.png'
        T   = logsp(0.01,10,50);
        lnY = nan(4,length(T));
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,5,30,760,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,6,30,760,'strike-slip');
            lnY(3,i)=GA2011(T(i)+3j,7,30,760,'strike-slip');
            lnY(4,i)=GA2011(T(i)+3j,8,30,760,'strike-slip');
        end
        plot(handles.ax1,T,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 1.4];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (sec)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_3.png'
        T   = logsp(0.01,10,50);
        lnY = nan(4,length(T));
        
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,5,5,270,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,6,5,270,'strike-slip');
            lnY(3,i)=GA2011(T(i)+3j,7,5,270,'strike-slip');
            lnY(4,i)=GA2011(T(i)+3j,8,5,270,'strike-slip');
        end
        plot(handles.ax1,T,exp(lnY),'-','linewidth',2);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 2.5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (sec)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_4.png'
        T   = logsp(0.01,10,50);
        lnY = nan(4,length(T));
        Vs30=660;
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,5,30,Vs30,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,6,30,Vs30,'strike-slip');
            lnY(3,i)=GA2011(T(i)+3j,7,30,Vs30,'strike-slip');
            lnY(4,i)=GA2011(T(i)+3j,8,30,Vs30,'strike-slip');
        end
        plot(handles.ax1,T,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 2.5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (sec)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_5.png'
        Vs30 = logsp(100,1000,50);
        lnY  = nan(2,length(Vs30));
        for i=1:length(Vs30)
            lnY(1,i)=GA2011(0.05+3j,7,5 ,Vs30(i),'strike-slip',0.1);
            lnY(2,i)=GA2011(0.05+3j,7,30,Vs30(i),'strike-slip',0.1);
        end
        plot(handles.ax1,Vs30,exp(lnY),'-','linewidth',1);
        handles.ax1.XLim   = [100 1000];
        handles.ax1.YLim   = [0 2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Vs30 (m/s)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_6.png'
        Vs30 = logsp(100,1000,50);
        lnY  = nan(2,length(Vs30));
        for i=1:length(Vs30)
            lnY(1,i)=GA2011(1+3j,7,5 ,Vs30(i),'strike-slip',0.1);
            lnY(2,i)=GA2011(1+3j,7,30,Vs30(i),'strike-slip',0.1);
        end
        plot(handles.ax1,Vs30,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [100 1000];
        handles.ax1.YLim   = [0 2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Vs30 (m/s)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_7.png'
        Rrup = logsp(1,100,50);
        lnY  = nan(4,length(Rrup));
        for i=1:length(Rrup)
            lnY(1,i)=GA2011(0.05+3j,5,Rrup(i),760,'strike-slip',0.1);
            lnY(2,i)=GA2011(0.05+3j,6,Rrup(i),760,'strike-slip',0.1);
            lnY(3,i)=GA2011(0.05+3j,7,Rrup(i),760,'strike-slip',0.1);
            lnY(4,i)=GA2011(0.05+3j,8,Rrup(i),760,'strike-slip',0.1);
        end
        plot(handles.ax1,Rrup,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [1 100];
        handles.ax1.YLim   = [0 1.6];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_8.png'
        Rrup = logsp(1,100,50);
        lnY  = nan(4,length(Rrup));
        for i=1:length(Rrup)
            lnY(1,i)=GA2011(1+3j,5,Rrup(i),760,'strike-slip',0.1);
            lnY(2,i)=GA2011(1+3j,6,Rrup(i),760,'strike-slip',0.1);
            lnY(3,i)=GA2011(1+3j,7,Rrup(i),760,'strike-slip',0.1);
            lnY(4,i)=GA2011(1+3j,8,Rrup(i),760,'strike-slip',0.1);
        end
        plot(handles.ax1,Rrup,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [1 100];
        handles.ax1.YLim   = [0 1.6];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_9.png'
        T = logsp(0.01,10,50);
        lnY  = nan(3,length(10));
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,7,5,440,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,7,5,440,'reverse');
            lnY(3,i)=GA2011(T(i)+3j,7,5,440,'normal');
        end
        plot(handles.ax1,T,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 2.5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'V/H')
        
    case 'GA2011_10.png'
        T = logsp(0.01,10,50);
        lnY  = nan(3,length(10));
        for i=1:length(T)
            lnY(1,i)=GA2011(T(i)+3j,7,5,760,'strike-slip');
            lnY(2,i)=GA2011(T(i)+3j,7,5,760,'reverse');
            lnY(3,i)=GA2011(T(i)+3j,7,5,760,'normal');
        end
        plot(handles.ax1,T,exp(lnY),'linewidth',1);
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 2.5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'V/H')
end