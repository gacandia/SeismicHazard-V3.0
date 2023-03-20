function [handles]=GMMValidation_Arteta2023SC(handles,filename)

switch filename
    case 'Arteta2023SC_1.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        Rvolc = 0;
        for i=1:length(T)
            lny(1,i)=Arteta2023SC(T(i),4.5,20,Rvolc,10,0.1,3.29);
            lny(2,i)=Arteta2023SC(T(i),5.5,20,Rvolc,10,0.1,3.29);
            lny(3,i)=Arteta2023SC(T(i),6.5,20,Rvolc,10,0.1,3.29);
            lny(4,i)=Arteta2023SC(T(i),7.5,20,Rvolc,10,0.1,3.29);
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[1e-2 10];
        handles.ax1.YLim=[1e-5 3e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')
        
    case 'Arteta2023SC_2.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        Rvolc = 0;
        for i=1:length(T)
            lny(1,i)=Arteta2023SC(T(i),6.5,200,Rvolc,10,0.1,3.29);
            lny(2,i)=Arteta2023SC(T(i),6.5,100,Rvolc,10,0.1,3.29);
            lny(3,i)=Arteta2023SC(T(i),6.5, 50,Rvolc,10,0.1,3.29);
            lny(4,i)=Arteta2023SC(T(i),6.5, 25,Rvolc,10,0.1,3.29);
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[1e-2 10];
        handles.ax1.YLim=[1e-5 3e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')
        
    case 'Arteta2023SC_3.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(5,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2023SC(T(i),6,100,0,10,0.0 ,1.00);
            lny(2,i)=Arteta2023SC(T(i),6,100,0,10,0.1 ,3.29);
            lny(3,i)=Arteta2023SC(T(i),6,100,0,10,0.3 ,4.48);
            lny(4,i)=Arteta2023SC(T(i),6,100,0,10,0.5 ,4.24);
            lny(5,i)=Arteta2023SC(T(i),6,100,0,10,1.0 ,3.47);            
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[1e-2 1e1];
        handles.ax1.YLim=[1e-5 3e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')
        
    case 'Arteta2023SC_4.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(3,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2023SC(T(i),6,100,100,10,0.1,3.29);
            lny(2,i)=Arteta2023SC(T(i),6,100,50,10,0.1,3.29);
            lny(3,i)=Arteta2023SC(T(i),6,100,0,10,0.1,3.29);            
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[1e-2 1e1];
        handles.ax1.YLim=[1e-5 3e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')        
        
    case 'Arteta2023SC_5.png'
        nM   = 20;
        M    = linspace(4.5,8,nM);
        Zhyp = 10*ones(1,nM);
        lny = nan(4,nM);
        lny(1,:)=Arteta2023SC(0,M,25*ones(1,nM) ,0,Zhyp,0.1,3.29);
        lny(2,:)=Arteta2023SC(0,M,50*ones(1,nM) ,0,Zhyp,0.1,3.29);
        lny(3,:)=Arteta2023SC(0,M,100*ones(1,nM),0,Zhyp,0.1,3.29);
        lny(4,:)=Arteta2023SC(0,M,200*ones(1,nM),0,Zhyp,0.1,3.29);
        
        plot(handles.ax1,M,exp(lny),'linewidth',2);
        handles.ax1.XLim=[4.5 8];
        handles.ax1.YLim=[1e-5 0.5];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude (Mw)')
        ylabel(handles.ax1,'SA (g)')       
        
    case 'Arteta2023SC_6.png'
        nR   = 20;
        Rrup = linspace(10,400,nR);
        Zhyp = 10*ones(1,nR);
        lny = nan(4,nR);
        lny(1,:)=Arteta2023SC(0,4.5*ones(1,nR),Rrup,0,Zhyp,0.1,3.29);
        lny(2,:)=Arteta2023SC(0,5.5*ones(1,nR),Rrup,0,Zhyp,0.1,3.29);
        lny(3,:)=Arteta2023SC(0,6.5*ones(1,nR),Rrup,0,Zhyp,0.1,3.29);
        lny(4,:)=Arteta2023SC(0,7.5*ones(1,nR),Rrup,0,Zhyp,0.1,3.29);
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',2);
        handles.ax1.XLim=[10 400];
        handles.ax1.YLim=[1e-5 0.5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rup. Distance (km)')
        ylabel(handles.ax1,'SA (g)')  
        
    case 'Arteta2023SC_7.png'
        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        STD = nan(3,length(T));
        Rvolc = 31;
        for i=1:length(T)
            [~,STD(1,i),STD(2,i),STD(3,i)]=Arteta2023SC(T(i),5,20,Rvolc,10,0.1,2.5);
        end
        plot(handles.ax1,T,STD,'linewidth',1);
        handles.ax1.XLim=[1e-2 10];
        handles.ax1.YLim=[0 1.2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'Standard Deviation (in units)')        
        
end