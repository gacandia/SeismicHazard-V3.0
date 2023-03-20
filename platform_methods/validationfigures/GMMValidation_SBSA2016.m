function [handles]=GMMValidation_SBSA2016(handles,filename)

switch filename
    case 'SBSA2016_1.png'
        T   = logsp(0.01,10,30);
        lny1 = nan(6,length(T));
        lny2 = nan(6,length(T));
        for i=1:length(T)
            lny1(1,i)=SBSA2016(T(i),3,20,760,'strike-slip','global');
            lny1(2,i)=SBSA2016(T(i),4,20,760,'strike-slip','global');
            lny1(3,i)=SBSA2016(T(i),5,20,760,'strike-slip','global');
            lny1(4,i)=SBSA2016(T(i),6,20,760,'strike-slip','global');
            lny1(5,i)=SBSA2016(T(i),7,20,760,'strike-slip','global');
            lny1(6,i)=SBSA2016(T(i),8,20,760,'strike-slip','global');
            
            lny2(1,i)=SBSA2016(T(i),3,20,200,'strike-slip','global');
            lny2(2,i)=SBSA2016(T(i),4,20,200,'strike-slip','global');
            lny2(3,i)=SBSA2016(T(i),5,20,200,'strike-slip','global');
            lny2(4,i)=SBSA2016(T(i),6,20,200,'strike-slip','global');
            lny2(5,i)=SBSA2016(T(i),7,20,200,'strike-slip','global');
            lny2(6,i)=SBSA2016(T(i),8,20,200,'strike-slip','global');
        end
        
        plot(handles.ax1,T,exp(lny1),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-7 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'5%-damped PSA(g)')
        
    case 'SBSA2016_2.png'
        nR  = 30;
        Rjb = logsp(0.8,200,nR)';
        on  = ones(nR,1);
        lny = nan(nR,5);
        lny(:,1)=SBSA2016(-1,4*on,Rjb,760,'strike-slip','global');
        lny(:,2)=SBSA2016(-1,5*on,Rjb,760,'strike-slip','global');
        lny(:,3)=SBSA2016(-1,6*on,Rjb,760,'strike-slip','global');
        lny(:,4)=SBSA2016(-1,7*on,Rjb,760,'strike-slip','global');
        lny(:,5)=SBSA2016(-1,8*on,Rjb,760,'strike-slip','global');
        
        plot(handles.ax1,Rjb,exp(lny),'b-');
        
        lny = nan(nR,5);
        Z10 = 0.0408;
        lny(:,1)=BSSA2014(-1,4*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,2)=BSSA2014(-1,5*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,3)=BSSA2014(-1,6*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,4)=BSSA2014(-1,7*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,5)=BSSA2014(-1,8*on,Rjb,760,Z10,'strike-slip','global');
        plot(handles.ax1,Rjb,exp(lny),'r-');
        
        handles.ax1.XLim=[0.8 225];
        handles.ax1.YLim=[0.001 100];
        handles.ax1.XTick=[1 2 10 20 100 200];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rjb(km)')
        ylabel(handles.ax1,'PGV(cm/s)')
        
    case 'SBSA2016_3.png'
        nR  = 30;
        Rjb = logsp(0.8,200,nR)';
        on  = ones(nR,1);
        lny = nan(nR,5);
        
        lny(:,1)=SBSA2016(1,4*on,Rjb,760,'strike-slip','global');
        lny(:,2)=SBSA2016(1,5*on,Rjb,760,'strike-slip','global');
        lny(:,3)=SBSA2016(1,6*on,Rjb,760,'strike-slip','global');
        lny(:,4)=SBSA2016(1,7*on,Rjb,760,'strike-slip','global');
        lny(:,5)=SBSA2016(1,8*on,Rjb,760,'strike-slip','global');
        
        plot(handles.ax1,Rjb,exp(lny),'b-');
        
        lny = nan(nR,5);
        Z10 = 0.0408;
        lny(:,1)=BSSA2014(1,4*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,2)=BSSA2014(1,5*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,3)=BSSA2014(1,6*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,4)=BSSA2014(1,7*on,Rjb,760,Z10,'strike-slip','global');
        lny(:,5)=BSSA2014(1,8*on,Rjb,760,Z10,'strike-slip','global');
        plot(handles.ax1,Rjb,exp(lny),'r-');
        
        handles.ax1.XLim=[0.8 225];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XTick=[1 2 10 20 100 200];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rjb(km)')
        ylabel(handles.ax1,'5%-damped PSA(g)')
end