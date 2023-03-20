function [handles]=GMMValidation_ML2021(handles,filename)

switch filename
    case 'ML2021_1.png'
        Rrup  = logsp(1e1,200,30)';
        M     = 7*ones(30,1);
        Ztor  = 30*ones(30,1);
        VS30  = 400;
        lny   = zeros(30,2);
        
        lny(:,1)=ML2021(-4,M,[],'interface',VS30,@Kuehn2020,M,Rrup,Ztor,VS30,'interface','global',0,0,0.55,2,0);
        lny(:,2)=ML2021(-4,M,[],'interface',VS30,@Parker2020,M,Rrup,Ztor,VS30,2,'interface','global','no');
        
        plot(handles.ax1,Rrup,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e1 200];
        handles.ax1.YLim   = [1e-3 1e3];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'CAV (m/s)')
        
    case 'ML2021_2.png'
        Rrup  = logsp(1e1,200,30)';
        M     = 8.5*ones(30,1);
        Ztor  = 30*ones(30,1);
        VS30  = 400;
        lny   = zeros(30,2);
        
        lny(:,1)=ML2021(-4,M,[],'interface',VS30,@Kuehn2020,M,Rrup,Ztor,VS30,'interface','global',0,0,0.55,2,0);
        lny(:,2)=ML2021(-4,M,[],'interface',VS30,@Parker2020,M,Rrup,Ztor,VS30,2,'interface','global','no');
        
        plot(handles.ax1,Rrup,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e1 200];
        handles.ax1.YLim   = [1e-3 1e3];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'CAV (m/s)')

    case 'ML2021_3.png'
        Rrup  = (10:10:200)'; nR=numel(Rrup);
        M     = 7*ones(nR,1);
        Ztor  = 30*ones(nR,1);
        VS30  = 400;
        lny   = zeros(nR,2);
        
        lny(:,1)=Kuehn2020(0,M,Rrup,Ztor,VS30,'interface','global',0,0,0.55,2,0);
        lny(:,2)=Parker2020(0,M,Rrup,Ztor,VS30,2,'interface','global','no');
        
        plot(handles.ax1,Rrup,exp(lny(:,1)),'linewidth',1,'color','r'),
        plot(handles.ax1,Rrup,exp(lny(:,2)),'linewidth',1,'color',[0 0.5 0]),
        handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e1 200];
        handles.ax1.YLim   = [1e-6 1e1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        ylabel(handles.ax1,'PGA (g)')        
        
end