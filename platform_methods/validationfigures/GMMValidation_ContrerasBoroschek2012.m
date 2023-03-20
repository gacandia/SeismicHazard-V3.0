function [handles]=GMMValidation_ContrerasBoroschek2012(handles,filename)

handles.t1.String='M';
handles.t2.String='Rrup (km)';
handles.t3.String='Zhyp (km)';
handles.t4.String='Media';

switch filename
    case 'ContrerasBoroschek2012_1.png'
        % Figure 9a Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),7.7,175.6,38.9,'soil');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 0.429];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        
    case 'ContrerasBoroschek2012_2.png'
        % Figure 9b Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),7.9,120.3,33,'soil');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 0.693];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        
    case 'ContrerasBoroschek2012_3.png'
        % Figure 9c Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),7.9,38,33,'rock');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 0.65];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        
    case 'ContrerasBoroschek2012_4.png'
        % Figure 9d Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),7.7,118.5,38.9,'rock');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 0.3];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        
    case 'ContrerasBoroschek2012_5.png'
        % Figure 9d Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),8.8,34,30,'soil');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)   
        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 2.29];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
        
    case 'ContrerasBoroschek2012_6.png'
        % Figure 9d Contreras and Boroschek 2012
        T = [0.01 0.04 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 2];
        lny = zeros(1,length(T));
        for i=1:length(T)
            lny(1,i)=ContrerasBoroschek2012(T(i),8.8,99,30,'soil');
        end
        plot(handles.ax1,T,exp(lny),'-','linewidth',1)           
        
        handles.ax1.XLim=[0 2];
        handles.ax1.YLim=[0 1.578];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='linear';
end