function [handles]=GMMValidation_AG2020(handles,filename)

switch filename
    case 'AG2020_1.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lnyAG = nan(9,length(T));
        M    = 7;
        Rrup = 100;
        Rhyp = 100;
        Ztor = 50;
        Zhyp = 40;
        Vs30 = 400;
        Z25  = NaN;
        mechanism='intraslab';
        for i=1:length(T)
            lnyAG(1,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'ak');
            lnyAG(2,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cas');
            lnyAG(3,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cam');
            lnyAG(4,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'jp');
            lnyAG(5,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'nz');
            lnyAG(6,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'sam');
            lnyAG(7,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'tw');
            lnyAG(8,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'global');
            lnyAG(9,i)=BCHydro2012(T(i),M,Rrup,Rhyp,Zhyp,Vs30,mechanism,'forearc','central');
        end
        
        plot(handles.ax1,T,exp(lnyAG),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AG2020_2.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lnyAG = nan(9,length(T));
        M    = 8;
        Rrup = 100;
        Rhyp = 100;
        Ztor = 50;
        Zhyp = 40;
        Vs30 = 400;
        Z25  = NaN;
        mechanism='intraslab';
        for i=1:length(T)
            lnyAG(1,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'ak');
            lnyAG(2,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cas');
            lnyAG(3,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cam');
            lnyAG(4,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'jp');
            lnyAG(5,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'nz');
            lnyAG(6,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'sam');
            lnyAG(7,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'tw');
            lnyAG(8,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'global');
            lnyAG(9,i)=BCHydro2012(T(i),M,Rrup,Rhyp,Zhyp,Vs30,mechanism,'forearc','central');
        end
        
        plot(handles.ax1,T,exp(lnyAG),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AG2020_3.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lnyAG = nan(9,length(T));
        M    = 8;
        Rrup = 100;
        Rhyp = 100;
        Ztor = 50;
        Zhyp = 40;
        Vs30 = 400;
        Z25  = NaN;
        mechanism='interface';
        for i=1:length(T)
            lnyAG(1,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'ak');
            lnyAG(2,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cas');
            lnyAG(3,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cam');
            lnyAG(4,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'jp');
            lnyAG(5,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'nz');
            lnyAG(6,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'sam');
            lnyAG(7,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'tw');
            lnyAG(8,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'global');
            lnyAG(9,i)=BCHydro2012(T(i),M,Rrup,Rhyp,Zhyp,Vs30,mechanism,'forearc','central');
        end
        
        plot(handles.ax1,T,exp(lnyAG),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AG2020_4.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lnyAG = nan(9,length(T));
        M    = 9;
        Rrup = 100;
        Rhyp = 100;
        Ztor = 50;
        Zhyp = 40;
        Vs30 = 400;
        Z25  = NaN;
        mechanism='interface';
        for i=1:length(T)
            lnyAG(1,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'ak');
            lnyAG(2,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cas');
            lnyAG(3,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'cam');
            lnyAG(4,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'jp');
            lnyAG(5,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'nz');
            lnyAG(6,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'sam');
            lnyAG(7,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'tw');
            lnyAG(8,i)=AG2020(T(i),M,Rrup,Ztor,Vs30,Z25,mechanism,'global');
            lnyAG(9,i)=BCHydro2012(T(i),M,Rrup,Rhyp,Zhyp,Vs30,mechanism,'forearc','central');
        end
        
        plot(handles.ax1,T,exp(lnyAG),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AG2020_5.png'
        T   = 0.2;
        
        M    = (5:0.1:9)';
        Rrup = 100*ones(size(M));
        Rhyp = 100*ones(size(M));
        Ztor = 50*ones(size(M));
        Zhyp = 40*ones(size(M));
        Vs30 = 400;
        Z25  = NaN;
        lnyAG  = nan(numel(M),2);
        lnyBC  = nan(numel(M),2);
        
        sil = ones(size(M));
        sil(M>8.0)=NaN;
        lnyAG(:,1)=AG2020(T,M.*sil,Rrup,Ztor,Vs30,Z25,'intraslab','global');
        lnyAG(:,2)=AG2020(T,M,Rrup,Ztor,Vs30,Z25,'interface','global');
        
        
        lnyBC(:,1)=BCHydro2012(T,M.*sil,Rrup,Rhyp,Zhyp,Vs30,'intraslab','forearc','central');
        lnyBC(:,2)=BCHydro2012(T,M,Rrup,Rhyp,Zhyp,Vs30,'interface','forearc','central');
        
        plot(handles.ax1,M,exp(lnyAG),'r','linewidth',1);
        plot(handles.ax1,M,exp(lnyBC),'k--','linewidth',1);
        
        handles.ax1.XLim=[5 9];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        
    case 'AG2020_6.png'
        T   = 0.2;
        Rrup = (30:10:500)';
        Rhyp = Rrup;
        Ztor = 50*ones(size(Rrup));
        Zhyp = 40*ones(size(Rrup));
        M    = 7*ones(size(Rrup));
        Vs30 = 400;
        Z25  = NaN;
        
        
        sil = ones(size(Rrup));
        sil(Rrup<50)=NaN;
        
        lnyAG  = nan(numel(Rrup),2);
        lnyAG(:,1) = AG2020(T,M,Rrup,Ztor,Vs30,Z25,'interface','global');
        lnyAG(:,2) = AG2020(T,M,Rrup,Ztor,Vs30,Z25,'intraslab','global').*sil;
        
        lnyBC  = nan(numel(Rrup),2);
        lnyBC(:,1)= BCHydro2012(T,M,Rrup,Rhyp,Zhyp,Vs30,'interface','forearc','central');
        lnyBC(:,2)= BCHydro2012(T,M,Rrup,Rhyp,Zhyp,Vs30,'intraslab','forearc','central').*sil;
        
        plot(handles.ax1,Rrup,exp(lnyBC(:,1))  ,'k-','linewidth',1.5);
        plot(handles.ax1,Rrup,exp(lnyAG(:,1))  ,'b-','linewidth',1.5);
        plot(handles.ax1,Rrup,exp(lnyBC(:,2))  ,'k:','linewidth',1.5);
        plot(handles.ax1,Rrup,exp(lnyAG(:,2))  ,'b:','linewidth',1.5);
        
        handles.ax1.XLim=[10 1000];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';        
end