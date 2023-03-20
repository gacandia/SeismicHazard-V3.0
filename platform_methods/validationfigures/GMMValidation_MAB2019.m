function [handles]=GMMValidation_MAB2019(handles,filename)

switch filename
    case 'MAB2019_1.png'
        M     = 8.5;
        VS30  = 450;
        PGA   = logsp(1e-2,1e0,20);
        SA1   = 0.6*PGA;
        lny   = zeros(5,20);
        for i=1:20
            lny(1,i)=MAB2019(-5,M,[],'interface','global',VS30,[],PGA(i),SA1(i));
            lny(2,i)=MAB2019(-5,M,[],'interface','japan',VS30,[],PGA(i),SA1(i));
            lny(3,i)=MAB2019(-5,M,[],'interface','taiwan',VS30,[],PGA(i),SA1(i));
            lny(4,i)=MAB2019(-5,M,[],'interface','south-america',VS30,[],PGA(i),SA1(i));
            lny(5,i)=MAB2019(-5,M,[],'interface','new-zeeland',VS30,[],PGA(i),SA1(i));
        end
        
        plot(handles.ax1,PGA,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e-2 1e0];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'PGA(g)')
        
    case 'MAB2019_2.png'
        M     = 8.0;
        VS30  = 450;
        PGA   = logsp(1e-2,1e0,20);
        SA1   = 0.6*PGA;
        lny   = zeros(5,20);
        for i=1:20
            lny(1,i)=MAB2019(-5,M,[],'intraslab','global',VS30,[],PGA(i),SA1(i));
            lny(2,i)=MAB2019(-5,M,[],'intraslab','japan',VS30,[],PGA(i),SA1(i));
            lny(3,i)=MAB2019(-5,M,[],'intraslab','taiwan',VS30,[],PGA(i),SA1(i));
            lny(4,i)=MAB2019(-5,M,[],'intraslab','south-america',VS30,[],PGA(i),SA1(i));
            lny(5,i)=MAB2019(-5,M,[],'intraslab','new-zeeland',VS30,[],PGA(i),SA1(i));
        end
        
        plot(handles.ax1,PGA,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e-2 1e0];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'PGA(g)')
        
    case 'MAB2019_3.png'
        Rrup  = logsp(1e1,1e3,20)';
        M     = 7.0*ones(20,1);
        Zhyp  = 20*ones(20,1);
        VS30  = 300;
        lny   = nan(20,4);
        lny(:,1)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2012,M,Rrup,[],Zhyp,VS30,'interface','forearc','central');
        lny(:,2)=MAB2019(-5,M,Rrup,'interface','global',VS30,@AtkinsonBoore2003,M,Rrup,Zhyp,VS30,'interface','general');
        lny(:,3)=MAB2019(-5,M,Rrup,'interface','global',VS30,@Zhao2006,M,Rrup,Zhyp,VS30,'interface');
        lny(:,4)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2018,M,Rrup,Zhyp,VS30,'interface');
        
        plot(handles.ax1,Rrup,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e1 1e3];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        
    case 'MAB2019_4.png'
        Rrup  = logsp(1e1,300,20)';
        M     = 8.5*ones(20,1);
        Zhyp  = 20*ones(20,1);
        VS30  = 760;
        lny   = nan(20,4);
        lny(:,1)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2012,M,Rrup,[],Zhyp,VS30,'interface','forearc','central');
        lny(:,2)=MAB2019(-5,M,Rrup,'interface','global',VS30,@AtkinsonBoore2003,M,Rrup,Zhyp,VS30,'interface','general');
        lny(:,3)=MAB2019(-5,M,Rrup,'interface','global',VS30,@Zhao2006,M,Rrup,Zhyp,VS30,'interface');
        lny(:,4)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2018,M,Rrup,Zhyp,VS30,'interface');
        
        plot(handles.ax1,Rrup,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e1 1e3];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rupture Distance (km)')
        
    case 'MAB2019_5.png'
        M     = linspace(5,9,20)';
        Rrup  = 50*ones(20,1);
        Zhyp  = 20*ones(20,1);
        VS30  = 300;
        lny   = nan(20,4);
        lny(:,1)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2012,M,Rrup,[],Zhyp,VS30,'interface','forearc','central');
        lny(:,2)=MAB2019(-5,M,Rrup,'interface','global',VS30,@AtkinsonBoore2003,M,Rrup,Zhyp,VS30,'interface','general');
        lny(:,3)=MAB2019(-5,M,Rrup,'interface','global',VS30,@Zhao2006,M,Rrup,Zhyp,VS30,'interface');
        lny(:,4)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2018,M,Rrup,Zhyp,VS30,'interface');
        
        plot(handles.ax1,M,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [4 9];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')
        
    case 'MAB2019_6.png'
        M     = linspace(5,9,20)';
        Rrup  = 50*ones(20,1);
        Zhyp  = 20*ones(20,1);
        VS30  = 760;
        lny   = nan(20,4);
        lny(:,1)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2012,M,Rrup,[],Zhyp,VS30,'interface','forearc','central');
        lny(:,2)=MAB2019(-5,M,Rrup,'interface','global',VS30,@AtkinsonBoore2003,M,Rrup,Zhyp,VS30,'interface','general');
        lny(:,3)=MAB2019(-5,M,Rrup,'interface','global',VS30,@Zhao2006,M,Rrup,Zhyp,VS30,'interface');
        lny(:,4)=MAB2019(-5,M,Rrup,'interface','global',VS30,@BCHydro2018,M,Rrup,Zhyp,VS30,'interface');
        
        plot(handles.ax1,M,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [4 9];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')        
        
end