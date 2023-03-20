function [displayname]=GMMValidation_Kuehn2020(handles,filename)

black  = [0 0 0];
blue   = [0 0 1];
green  = [0 0.5 0];
brown  = [0.6392    0.0784    0.1804];
purple = [0.4902    0.1804    0.5608];
cyan   = [0.3020    0.7490    0.9294];
red    = [1 0 0];
orange = [0.9294    0.6902    0.1294];
region={'global','alaska','aleutian','cascadia','central_america_n','central_america_s','japan_pac','japan_phi','south_america_n','south_america_s','taiwan_e','new_zealand_n'};

delete(findall(handles.ax1,'type','line'));

%% DISTANCE SCALING
switch filename
    case 'Kuehn2020_1.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        
        for i=1:12
            lny(:,i)  = Kuehn2020(0,6*O,Rrup,50*O,400,0,0,'intraslab',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_2.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        
        for i=1:12
            lny(:,i)  = Kuehn2020(0,7*O,Rrup,50*O,400,0,0,'intraslab',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_3.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(0,8*O,Rrup,50*O,400,0,0,'intraslab',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_4.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(0,7*O,Rrup,10*O,400,0,0,'interface',region{i},0,0,0);
        end
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_5.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(0,8*O,Rrup,10*O,400,0,0,'interface',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_6.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(0,9*O,Rrup,10*O,400,0,0,'interface',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PGA(g)')
        
    case 'Kuehn2020_7.png'
        lny  = nan(30,12);
        Rrup = logsp(10,1000,30)';
        O    = ones(30,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(1,9*O,Rrup,10*O,400,0,0,'interface',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,Rrup,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [10 1000];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Distance(km)')
        ylabel(handles.ax1,'PSA(g)')
end

%% RESPONSE SPECTRA
switch filename
    case 'Kuehn2020_8.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),6,75,50,400,0,0,'intraslab',region{j},0,0,0);
            end
        end
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_9.png'
        
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),7,75,50,400,0,0,'intraslab',region{j},0,0,0);
            end
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_10.png'
        
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),8,75,50,400,0,0,'intraslab',region{j},0,0,0);
            end
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_11.png'
        
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),7,75,10,400,0,0,'interface',region{j},0,0,0);
            end
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_12.png'
        
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),8,75,10,400,0,0,'interface',region{j},0,0,0);
            end
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_13.png'
        
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),12);
        for i=1:numel(T)
            for j=1:12
                lny(i,j)  = Kuehn2020(T(i),9,75,10,400,0,0,'interface',region{j},0,0,0);
            end
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
end

%% MAGNITUDE SCALING

switch filename
    case 'Kuehn2020_14.png'
        
        T           = 0.01;
        M           = (5:0.5:9.5)';
        N           = numel(M);
        lny         = nan(N,12);
        O           = ones(N,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(T,M,75*O,10*O,760,0,0,'interface',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,M,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [5 9.5];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_15.png'
        T           = 0.01;
        M           = (5:0.5:9.5)';
        N           = numel(M);
        lny         = nan(N,12);
        O           = ones(N,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(T,M,75*O,50*O,760,0,0,'intraslab',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,M,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [5 8.5];
        handles.ax1.YLim   = [0.0001 10];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_16.png'
        T           = 3;
        M           = (5:0.5:9.5)';
        N           = numel(M);
        lny         = nan(N,12);
        O           = ones(N,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(T,M,75*O,10*O,760,0,0,'interface',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,M,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [5 9.5];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_17.png'
        T           = 3;
        M           = (5:0.5:8.5)';
        N           = numel(M);
        lny         = nan(N,12);
        O           = ones(N,1);
        for i=1:12
            lny(:,i)  = Kuehn2020(T,M,75*O,50*O,760,0,0,'intraslab',region{i},0,0,0);
        end
        
        handles.ax1.ColorOrder=[black;blue;blue;red;green;green;brown;brown;purple;purple;cyan;orange];
        plot(handles.ax1,M,exp(lny),'linewidth' ,1);
        displayname = {'Global','Alaska','Aleutian','Cascadia','Northern CA&M','Northern SA','Japan Pacific','Japan Phillipine','Southern CA','Southern SA','Taiwan','New Zealand'};
        
        handles.ax1.XLim   = [5 8.5];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Magnitude')
        ylabel(handles.ax1,'PSA(g)')
end

%% DEPTH (Ztor) SCALING

switch filename
    case 'Kuehn2020_18.png'
        Ztor        = (5:1:40)';
        N           = numel(Ztor);
        lny         = nan(N,8);
        O           = ones(N,1);
        Tlist=[0 0.1 0.2 0.5 1 2 3 5];
        for i=1:8
            lny(:,i)  = Kuehn2020(Tlist(i),8*O,75*O,Ztor,760,0,0,'interface','global',0,0,0);
        end
        
        displayname = {'PGA','T=0.1 sec','T=0.2 sec','T=0.5 sec','T=1.0 sec','T=2.0 sec','T=3.0 sec','T=5.0 sec'};
        handles.ax1.ColorOrder=[blue;blue;green;orange;red;brown;purple;black];
        plot(handles.ax1,Ztor,exp(lny),'linewidth',1);
        
        handles.ax1.XLim   = [0 40];
        handles.ax1.YLim   = [0.01 1];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Ztor (km)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_19.png'
        Ztor        = (40:5:100)';
        N           = numel(Ztor);
        lny         = nan(N,8);
        O           = ones(N,1);
        Tlist=[0 0.1 0.2 0.5 1 2 3 5];
        for i=1:8
            lny(:,i)  = Kuehn2020(Tlist(i),7*O,100*O,Ztor,760,0,0,'intraslab','global',0,0,0);
        end
        
        displayname = {'PGA','T=0.1 sec','T=0.2 sec','T=0.5 sec','T=1.0 sec','T=2.0 sec','T=3.0 sec','T=5.0 sec'};
        handles.ax1.ColorOrder=[blue;blue;green;orange;red;brown;purple;black];
        plot(handles.ax1,Ztor,exp(lny),'linewidth',1);
        
        handles.ax1.XLim   = [40 100];
        handles.ax1.YLim   = [0.001 1];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Ztor (km)')
        ylabel(handles.ax1,'PSA(g)')
end

%% SITE AMPLIFICATION
switch filename
    case 'Kuehn2020_20.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),6);
        for i=1:numel(T)
            lny(i,1) = Kuehn2020(T(i),7,75,10,400,0,0,'interface','global',0,0,0);
            lny(i,2) = Kuehn2020(T(i),8,75,10,400,0,0,'interface','global',0,0,0);
            lny(i,3) = Kuehn2020(T(i),9,75,10,400,0,0,'interface','global',0,0,0);
            lny(i,4) = Kuehn2020(T(i),7,75,10,760,0,0,'interface','global',0,0,0);
            lny(i,5) = Kuehn2020(T(i),8,75,10,760,0,0,'interface','global',0,0,0);
            lny(i,6) = Kuehn2020(T(i),9,75,10,760,0,0,'interface','global',0,0,0);
            
        end
        handles.ax1.ColorOrder=[blue;blue;blue;red;red;red];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'M=7 Vs30=400','M=8 Vs30=400','M=9 Vs30=400','M=7 Vs30=760','M=8 Vs30=760','M=9 Vs30=760'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0.0001 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_21.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),6);
        for i=1:numel(T)
            lny(i,1) = Kuehn2020(T(i),7,75,10,400,0,0,'interface','japan_pac',0,0,0);
            lny(i,2) = Kuehn2020(T(i),8,75,10,400,0,0,'interface','japan_pac',0,0,0);
            lny(i,3) = Kuehn2020(T(i),9,75,10,400,0,0,'interface','japan_pac',0,0,0);
            lny(i,4) = Kuehn2020(T(i),7,75,10,760,0,0,'interface','japan_pac',0,0,0);
            lny(i,5) = Kuehn2020(T(i),8,75,10,760,0,0,'interface','japan_pac',0,0,0);
            lny(i,6) = Kuehn2020(T(i),9,75,10,760,0,0,'interface','japan_pac',0,0,0);
            
        end
        handles.ax1.ColorOrder=[blue;blue;blue;red;red;red];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'M=7 Vs30=400','M=8 Vs30=400','M=9 Vs30=400','M=7 Vs30=760','M=8 Vs30=760','M=9 Vs30=760'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [1e-4 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')
        
    case 'Kuehn2020_22.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        lny  = nan(numel(T),6);
        for i=1:numel(T)
            lny(i,1) = Kuehn2020(T(i),7,75,10,400,0,0,'interface','south_america_s',0,0,0);
            lny(i,2) = Kuehn2020(T(i),8,75,10,400,0,0,'interface','south_america_s',0,0,0);
            lny(i,3) = Kuehn2020(T(i),9,75,10,400,0,0,'interface','south_america_s',0,0,0);
            lny(i,4) = Kuehn2020(T(i),7,75,10,760,0,0,'interface','south_america_s',0,0,0);
            lny(i,5) = Kuehn2020(T(i),8,75,10,760,0,0,'interface','south_america_s',0,0,0);
            lny(i,6) = Kuehn2020(T(i),9,75,10,760,0,0,'interface','south_america_s',0,0,0);
            
        end
        handles.ax1.ColorOrder=[blue;blue;blue;red;red;red];
        plot(handles.ax1,T,exp(lny),'linewidth' ,1);
        displayname = {'M=7 Vs30=400','M=8 Vs30=400','M=9 Vs30=400','M=7 Vs30=760','M=8 Vs30=760','M=9 Vs30=760'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [1e-4 10];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'PSA(g)')        
        
end

%% STANDARD DEVIATION

switch filename
    case 'Kuehn2020_23.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        sigma  = nan(numel(T),1);
        for i=1:numel(T)
            [~,sigma(i,1)] = Kuehn2020(T(i),7,75,10,400,0,0,'interface','global',0,0,0);
        end
        plot(handles.ax1,T,sigma,'bs-','linewidth' ,1);
        displayname = {'KBGC'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Sigma')
        
    case 'Kuehn2020_24.png'
        T=[0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2,0.25,0.3,0.4,0.5,0.75,1,1.5,2,3,4,5,7.5,10]';
        phi  = nan(numel(T),1);
        for i=1:numel(T)
            [~,~,~,phi(i,1)] = Kuehn2020(T(i),7,75,10,400,0,0,'interface','global',0,0,0);
        end
        plot(handles.ax1,T,phi,'bs-','linewidth' ,1);
        displayname = {'KBGC'};
        
        handles.ax1.XLim   = [0.01 10];
        handles.ax1.YLim   = [0 1];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period(s)')
        ylabel(handles.ax1,'Phi')
end

%% RE-ASSIGNS DISPLAYNAME
ch =findall(handles.ax1,'type','line');
if exist('displayname','var')
    displayname = fliplr(displayname);
    for i=1:numel(ch)
        ch(i).DisplayName=displayname{i};
    end
end