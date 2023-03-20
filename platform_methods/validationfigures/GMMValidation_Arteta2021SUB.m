function [handles]=GMMValidation_Arteta2021SUB(handles,filename)

switch filename
    case 'Arteta2021SUB_1.png'
        M    = (5:0.1:9)';
        nM   = numel(M);
        Rrup = 100*ones(nM,1);
        Rhyp = 100*ones(nM,1);

        lny = nan(nM,2);

        lny(:,1)=Arteta2021SUB(0,M,Rrup,Rhyp,0.1,2.5,'interface','');
        lny(:,2)=Arteta2021SUB(2,M,Rrup,Rhyp,0.1,2.5,'interface','');

        plot(handles.ax1,M,exp(lny),'linewidth',1);
        handles.ax1.XLim=[5 9];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude (Mw)')
        ylabel(handles.ax1,'Spectral Acceleration(g)')

    case 'Arteta2021SUB_2.png'
        M    = (5:0.1:8)';
        nM   = numel(M);
        Rrup = 80*ones(nM,1);
        Rhyp = 80*ones(nM,1);

        lny = nan(nM,2);

        lny(:,1)=Arteta2021SUB(0,M,Rrup,Rhyp,0.1,2.5,'intraslab','forearc');
        lny(:,2)=Arteta2021SUB(2,M,Rrup,Rhyp,0.1,2.5,'intraslab','forearc');

        plot(handles.ax1,M,exp(lny),'linewidth',1);
        handles.ax1.XLim=[5 8];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude (Mw)')
        ylabel(handles.ax1,'Spectral Acceleration(g)')


    case 'Arteta2021SUB_3.png'
        Rrup = logsp(20,500,40)';
        Rhyp = Rrup;
        nR   = numel(Rrup);
        M    = 6*ones(nR,1);

        lny = nan(nR,2);

        lny(:,1)=Arteta2021SUB(0,M,Rrup,Rhyp,0.1,2.5,'interface',[]);
        lny(:,2)=Arteta2021SUB(2,M,Rrup,Rhyp,0.1,2.5,'interface',[]);

        plot(handles.ax1,Rrup,exp(lny),'linewidth',1);
        handles.ax1.XLim=[10 1000];
        handles.ax1.YLim=[0.0001 0.1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance, Rrup [km]')
        ylabel(handles.ax1,'Spectral Acceleration(g)')


    case 'Arteta2021SUB_4.png'
        Rrup = logsp(80,580,40)';
        Rhyp = Rrup;
        nR   = numel(Rrup);
        M    = 6*ones(nR,1);

        lny = nan(nR,2);

        lny(:,1)=Arteta2021SUB(0,M,Rrup,Rhyp,0.1,2.5,'intraslab','forearc');
        lny(:,2)=Arteta2021SUB(2,M,Rrup,Rhyp,0.1,2.5,'intraslab','forearc');

        plot(handles.ax1,Rrup,exp(lny),'linewidth',1);
        handles.ax1.XLim=[10 1000];
        handles.ax1.YLim=[0.0001 0.1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rupture Distance, Rrup [km]')
        ylabel(handles.ax1,'Spectral Acceleration(g)')

    case 'Arteta2021SUB_5.png'

        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(5,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2021SUB(T(i),6.5,100,100,0.0,1.0,'interface','');
            lny(2,i)=Arteta2021SUB(T(i),6.5,100,100,0.1,2.5,'interface','');
            lny(3,i)=Arteta2021SUB(T(i),6.5,100,100,0.3,3.1,'interface','');
            lny(4,i)=Arteta2021SUB(T(i),6.5,100,100,0.5,3.6,'interface','');
            lny(5,i)=Arteta2021SUB(T(i),6.5,100,100,1.0,3.2,'interface','');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-4 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')

    case 'Arteta2021SUB_6.png'

        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(5,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2021SUB(T(i),6.5,100,100,0.0,1.00,'intraslab','forearc');
            lny(2,i)=Arteta2021SUB(T(i),6.5,100,100,0.1,2.5,'intraslab','forearc');
            lny(3,i)=Arteta2021SUB(T(i),6.5,100,100,0.3,3.1,'intraslab','forearc');
            lny(4,i)=Arteta2021SUB(T(i),6.5,100,100,0.5,3.6,'intraslab','forearc');
            lny(5,i)=Arteta2021SUB(T(i),6.5,100,100,1.0,3.2,'intraslab','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-4 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')

    case 'Arteta2021SUB_7.png'

        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(5,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2021SUB(T(i),5,25,25,0.1,2.5,'interface','');
            lny(2,i)=Arteta2021SUB(T(i),6,25,25,0.1,2.5,'interface','');
            lny(3,i)=Arteta2021SUB(T(i),7,25,25,0.1,2.5,'interface','');
            lny(4,i)=Arteta2021SUB(T(i),8,25,25,0.1,2.5,'interface','');
            lny(5,i)=Arteta2021SUB(T(i),9,25,25,0.1,2.5,'interface','');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')

    case 'Arteta2021SUB_8.png'

        T   = [0.01 0.02 0.03 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.75 1 1.5 2 3 4 5 6 7.5 10];
        lny = nan(4,length(T));
        for i=1:length(T)
            lny(1,i)=Arteta2021SUB(T(i),6,80 ,80 ,0.1,2.5,'intraslab','forearc');
            lny(2,i)=Arteta2021SUB(T(i),6,80 ,80 ,0.1,2.5,'intraslab','backarc');
            lny(3,i)=Arteta2021SUB(T(i),6,160,160,0.1,2.5,'intraslab','forearc');
            lny(4,i)=Arteta2021SUB(T(i),6,160,160,0.1,2.5,'intraslab','backarc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SA (g)')


end