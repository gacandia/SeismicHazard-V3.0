function [handles]=GMMValidation_MontalvaBastias2017(handles,filename)

switch filename
    case 'MontalvaBastias2017_1.png'
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,25,25,0,300,'interface','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,25,25,0,300,'interface','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_2.png'
        % Figure 3b from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,50,50,0,300,'interface','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,50,50,0,300,'interface','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_3.png'
        % Figure 3c from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,100,100,0,300,'interface','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,100,100,0,300,'interface','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_4.png'
        % Figure 3d from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,150,150,0,300,'interface','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,150,150,0,300,'interface','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_5.png'
        % Figure 4a from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,75,75,100,300,'intraslab','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,75,75,100,300,'intraslab','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_6.png'
        % Figure 4b from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,100,100,100,300,'intraslab','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,100,100,100,300,'intraslab','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_7.png'
        % Figure 4c from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,150,150,100,300,'intraslab','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,150,150,100,300,'intraslab','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'MontalvaBastias2017_8.png'
        % Figure 4d from Montalva and Bastias 2017
        T   = [0.01 0.02 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.4 0.5 0.6 0.75 1 1.5 2 2.5 3 4 5 6 7.5 10];
        lny = zeros(2,length(T));
        for i=1:length(T)
            lny(1,i)=MontalvaBastias2017(T(i),6.5,200,200,100,300,'intraslab','forearc');
            lny(2,i)=MontalvaBastias2017(T(i),8.5,200,200,100,300,'intraslab','forearc');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[1e-5 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
end