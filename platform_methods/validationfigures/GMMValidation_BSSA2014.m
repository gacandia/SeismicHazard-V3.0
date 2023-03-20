function [handles]=GMMValidation_BSSA2014(handles,filename)

switch filename
    case 'BSSA2014_1.png'
        T = [0.001 0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 7.5 10];
        lny1=nan(6,length(T));
        lny2=nan(6,length(T));
        region = 'california';
        for i=1:length(T)
            lny1(1,i)=BSSA2014(T(i),3,20,760,NaN,'strike-slip',region);
            lny1(2,i)=BSSA2014(T(i),4,20,760,NaN,'strike-slip',region);
            lny1(3,i)=BSSA2014(T(i),5,20,760,NaN,'strike-slip',region);
            lny1(4,i)=BSSA2014(T(i),6,20,760,NaN,'strike-slip',region);
            lny1(5,i)=BSSA2014(T(i),7,20,760,NaN,'strike-slip',region);
            lny1(6,i)=BSSA2014(T(i),8,20,760,NaN,'strike-slip',region);
            lny2(1,i)=BSSA2014(T(i),3,20,200,NaN,'strike-slip',region);
            lny2(2,i)=BSSA2014(T(i),4,20,200,NaN,'strike-slip',region);
            lny2(3,i)=BSSA2014(T(i),5,20,200,NaN,'strike-slip',region);
            lny2(4,i)=BSSA2014(T(i),6,20,200,NaN,'strike-slip',region);
            lny2(5,i)=BSSA2014(T(i),7,20,200,NaN,'strike-slip',region);
            lny2(6,i)=BSSA2014(T(i),8,20,200,NaN,'strike-slip',region);            
        end
        plot(handles.ax1,T,exp(lny1),'b-','linewidth',1)
        plot(handles.ax1,T,exp(lny2),'r-','linewidth',1)
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-7 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Y(g)')
        
    case 'BSSA2014_2.png'
        
        region = 'california';
        on  = ones(1,30);
        Rjb1 = logsp(0.8,200,30);
        lny1 = nan(5,30);
        lny1(1,:)=BSSA2014(-1,4*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(2,:)=BSSA2014(-1,5*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(3,:)=BSSA2014(-1,6*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(4,:)=BSSA2014(-1,7*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(5,:)=BSSA2014(-1,8*on,Rjb1,760,NaN,'strike-slip',region);
        
        plot(handles.ax1,Rjb1,exp(lny1),'r','linewidth',1);
        handles.ax1.XLim=[0.8 220];
        handles.ax1.XTick=[1 2 10 20 100 200];
        handles.ax1.YLim=[0.002 200];
        handles.ax1.YTick=[0.01 0.1 1 10 100];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PGV(cm/s)')   
        
    case 'BSSA2014_3.png'
        
        region = 'california';
        on  = ones(1,30);
        Rjb1 = logsp(0.8,200,30);
        lny1 = nan(5,30);
        lny1(1,:)=BSSA2014(1,4*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(2,:)=BSSA2014(1,5*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(3,:)=BSSA2014(1,6*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(4,:)=BSSA2014(1,7*on,Rjb1,760,NaN,'strike-slip',region);
        lny1(5,:)=BSSA2014(1,8*on,Rjb1,760,NaN,'strike-slip',region);
        
        plot(handles.ax1,Rjb1,exp(lny1),'r','linewidth',1);
        handles.ax1.XLim=[0.8 220];
        handles.ax1.XTick=[1 2 10 20 100 200];
        handles.ax1.YLim=[2e-5 2];
        handles.ax1.YTick=[0.01 0.1 1 10 100];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'5% damped PSA(G)')         
end
    