function [handles]=GMMValidation_Parker2020(handles,filename)

%% colors
black  = [0 0 0];
blue   = [0 0 1];
green  = [0 1 0];
red    = [1 0 0];
orange = [0.9294    0.6902    0.1294];
pink   = [1     0     1];
cyan   = [0     1     1];
brown  = [0.6392    0.0784    0.1804];
purple = [0.4902    0.1804    0.5608];

%% response spectra
switch filename
    case 'Parker2020_1.png'
        T  = [0.01,0.02,0.025,0.03,0.04,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,2.5,3,4,5,7.5,10];
        lny = nan(5,length(T));
        M = [5;6;7;8;9];
        Rrup=35*ones(5,1);
        Zhyp=NaN*ones(5,1);
        region='global';
        for i=1:length(T)
            lny(:,i)=Parker2020(T(i),M,Rrup,Zhyp,760,-999,'interface',region,false);
        end
        
        CO=[black;red;blue;green;orange];
        for i=1:5
            plot(handles.ax1,T,exp(lny(i,:)),'o-','color',CO(i,:),'markerfacecolor',CO(i,:));
        end
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [5e-6 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        
    case 'Parker2020_2.png'
        T  = [0.01,0.02,0.025,0.03,0.04,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,2.5,3,4,5,7.5,10];
        lny = nan(5,length(T));
        region='global';
        M = [5;6;7;8;9];
        Rrup=100*ones(5,1);
        Zhyp=NaN*ones(5,1);
        for i=1:length(T)
            lny(:,i)=Parker2020(T(i),M,Rrup,Zhyp,760,NaN,'interface',region,false);
        end
        
        CO=[black;red;blue;green;orange];
        for i=1:5
            plot(handles.ax1,T,exp(lny(i,:)),'o-','color',CO(i,:),'markerfacecolor',CO(i,:),'linewidth',1);
        end
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [4.5e-6 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        
    case 'Parker2020_3.png'
        T  = [0.01,0.02,0.025,0.03,0.04,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,2.5,3,4,5,7.5,10];
        lny = nan(4,length(T));
        region='global';
        for i=1:length(T)
            lny(:,i)=Parker2020(T(i),[5;6;7;8],35,60,760,NaN,'intraslab',region,false);
        end
        CO=[black;red;blue;green];
        for i=1:4
            plot(handles.ax1,T,exp(lny(i,:)),'^-','color',CO(i,:),'markerfacecolor',CO(i,:),'linewidth',1);
        end
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [4.4e-6 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        
    case 'Parker2020_4.png'
        T  = [0.01,0.02,0.025,0.03,0.04,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,2.5,3,4,5,7.5,10];
        lny = nan(4,length(T));
        region='global';
        for i=1:length(T)
            lny(:,i)=Parker2020(T(i),[5;6;7;8],100,60,760,NaN,'intraslab',region,false);
        end
        CO=[black;red;blue;green];
        for i=1:4
            plot(handles.ax1,T,exp(lny(i,:)),'^-','color',CO(i,:),'markerfacecolor',CO(i,:),'linewidth',1);
        end
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [5e-6 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
end

%% distance scaling
switch filename
    case 'Parker2020_5.png'
        lny  = nan(30,9);
        Rrup = logsp(25,1000,30)';
        
        region     ={'global','cascadia','alaska','aleutian','japan_pac','japan_phi','central_america_n','south_america_n','taiwan_e'};
        displayname = region;
        for i=1:9
            lny(:,i)=Parker2020(1,9*ones(30,1),Rrup,NaN(30,1),760,NaN,'interface',region{i},false);
        end
        handles.ax1.ColorOrder=[black;pink;cyan;blue;red;red;orange;green;brown];
        plot(handles.ax1,Rrup,exp(lny),'linewidth',1);
        
        handles.ax1.XLim   = [25 1000];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'1.0-sec PSA(g)')
        
    case 'Parker2020_6.png'
        lny  = nan(30,11);
        Rrup = logsp(25,1000,30)';
        region     ={'global','cascadia','alaska','aleutian','japan_pac','japan_phi','central_america_n','central_america_s','south_america_n','south_america_s','taiwan_e'};
        displayname = region;
        for i=1:11
            lny(:,i)=Parker2020(1,8*ones(30,1),Rrup,55*ones(30,1),760,NaN,'intraslab',region{i},false);
        end
        handles.ax1.ColorOrder=[black;pink;cyan;blue;red;purple;orange;orange;green;green;brown];
        plot(handles.ax1,Rrup,exp(lny),'linewidth',1);
        
        handles.ax1.XLim   = [40 1000];
        handles.ax1.YLim   = [5e-5 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'1.0-sec PSA(g)')
        
    case 'Parker2020_12.png'
        lny  = nan(30,2);
        Rrup = logsp(5,1000,30)';
        lny(:,1)=Parker2020(-1,6.64*ones(30,1),Rrup,nan*ones(30,1),760,NaN,'interface','global',false);
        lny(:,2)=Parker2020(-1,6.50*ones(30,1),Rrup, 71*ones(30,1),760,NaN,'intraslab','global',false);
        
        handles.ax1.ColorOrder=[[0.7 0.7 0.7];black];
        plot(handles.ax1,Rrup,exp(lny),'linewidth',2);
        
        handles.ax1.XLim   = [5 1000];
        handles.ax1.YLim   = [0.001 100];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance(km)')
        ylabel(handles.ax1,'PGV (cm/s)')
end

%% standard deviation
switch filename
    case 'Parker2020_7.png'
        T  = [0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10];
        tau = nan(1,length(T));
        region='global';
        for i=1:length(T)
            [~,~,tau(i)]=Parker2020(T(i),5,35,NaN,1000,NaN,'interface',region,false);
        end
        plot(handles.ax1,T,tau,'linewidth',1);
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.35 0.8];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Between Event Variability')
        
    case 'Parker2020_8.png'
        Np   = 100; 
        phi  = nan(Np,3);
        Rrup = logsp(30,1000,Np)';
        To   = 0.2;
        [~,~,~,phi(:,1)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),200,NaN,'interface','global',false);
        [~,~,~,phi(:,2)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),400,NaN,'interface','global',false);
        [~,~,~,phi(:,3)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),760,NaN,'interface','global',false);
        plot(handles.ax1,Rrup,phi(:,1),'k-','linewidth' ,1);
        plot(handles.ax1,Rrup,phi(:,2),'k--','linewidth',2);
        plot(handles.ax1,Rrup,phi(:,3),'k-','linewidth' ,2);
        
        handles.ax1.XLim   = [30 1000];
        handles.ax1.YLim   = [0.4 0.9];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Rupture Distance(km)')
        ylabel(handles.ax1,'Within Event Variability') 
        
    case 'Parker2020_9.png'
        Np   = 100; 
        phi  = nan(Np,3);
        Rrup = logsp(30,1000,Np)';
        To   = 1.0;
        [~,~,~,phi(:,1)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),200,NaN,'interface','global',false);
        [~,~,~,phi(:,2)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),400,NaN,'interface','global',false);
        [~,~,~,phi(:,3)]=Parker2020(To,NaN*ones(Np,1),Rrup,NaN(Np,1),760,NaN,'interface','global',false);
        plot(handles.ax1,Rrup,phi(:,1),'k-','linewidth' ,1);
        plot(handles.ax1,Rrup,phi(:,2),'k--','linewidth',2);
        plot(handles.ax1,Rrup,phi(:,3),'k-','linewidth' ,2);
        
        handles.ax1.XLim   = [30 1000];
        handles.ax1.YLim   = [0.4 0.8];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Rupture Distance(km)')
        ylabel(handles.ax1,'Within Event Variability') 
        
    case 'Parker2020_10.png'
        Np   = 100; 
        phi  = nan(Np,3);
        Vs30 = logsp(100,2000,Np)';
        To   = 0.2;
        for i=1:Np
            [~,~,~,phi(i,1)]=Parker2020(To,NaN*ones(Np,1),100 ,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
            [~,~,~,phi(i,2)]=Parker2020(To,NaN*ones(Np,1),400 ,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
            [~,~,~,phi(i,3)]=Parker2020(To,NaN*ones(Np,1),1000,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
        end
        plot(handles.ax1,Vs30,phi(:,1),'k-','linewidth' ,1);
        plot(handles.ax1,Vs30,phi(:,2),'k--','linewidth',2);
        plot(handles.ax1,Vs30,phi(:,3),'k-','linewidth' ,2);
        
        handles.ax1.XLim   = [100 2000];
        handles.ax1.YLim   = [0.4 0.9];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Vs30 (m/s)')
        ylabel(handles.ax1,'Within Event Variability') 
        
    case 'Parker2020_11.png'
        Np   = 100; 
        phi  = nan(Np,3);
        Vs30 = logsp(100,2000,Np)';
        To   = 1.0;
        for i=1:Np
            [~,~,~,phi(i,1)]=Parker2020(To,NaN*ones(Np,1),100 ,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
            [~,~,~,phi(i,2)]=Parker2020(To,NaN*ones(Np,1),400 ,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
            [~,~,~,phi(i,3)]=Parker2020(To,NaN*ones(Np,1),1000,NaN(Np,1),Vs30(i),NaN,'interface','global',false);
        end
        plot(handles.ax1,Vs30,phi(:,1),'k-','linewidth' ,1);
        plot(handles.ax1,Vs30,phi(:,2),'k--','linewidth',2);
        plot(handles.ax1,Vs30,phi(:,3),'k-','linewidth' ,2);
        
        handles.ax1.XLim   = [100 2000];
        handles.ax1.YLim   = [0.4 0.8];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Vs30 (m/s)')
        ylabel(handles.ax1,'Within Event Variability')        
end

%% RE-ASSIGNS DISPLAYNAME
ch =findall(handles.ax1,'type','line');
if exist('displayname','var')
    displayname = fliplr(displayname);
    for i=1:numel(ch)
        ch(i).DisplayName=displayname{i};
    end
end