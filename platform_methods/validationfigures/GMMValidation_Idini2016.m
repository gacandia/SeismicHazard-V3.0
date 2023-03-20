function [handles]=GMMValidation_Idini2016(handles,filename)

switch filename
    case 'Idini2016_1.png'
        % Figure 9a from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),8.5,50,50,0,400,0  ,'interface');
            lny(2,i)=Idini2016(T(i),8.5,50,50,0,400,0.1,'interface');
            lny(3,i)=Idini2016(T(i),8.5,50,50,0,400,1.0,'interface');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);

        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'Idini2016_2.png'
        % Figure 9b from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),7.5,100,100,100,400,0  ,'intraslab');
            lny(2,i)=Idini2016(T(i),7.5,100,100,100,400,0.1,'intraslab');
            lny(3,i)=Idini2016(T(i),7.5,100,100,100,400,1.0,'intraslab');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'Idini2016_3.png'
        % Figure 10a from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),9,30,30,30,1100,0,'interface');
            lny(2,i)=Idini2016(T(i),8,30,30,30,1100,0,'interface');
            lny(3,i)=Idini2016(T(i),7,30,30,30,1100,0,'interface');
            lny(4,i)=Idini2016(T(i),6,30,30,30,1100,0,'interface');
        end        
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'Idini2016_4.png'
        % Figure 10b from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),8,30,60,60,1100,0,'intraslab');
            lny(2,i)=Idini2016(T(i),7,30,60,60,1100,0,'intraslab');
            lny(3,i)=Idini2016(T(i),6,30,60,60,1100,0,'intraslab');
        end        
        plot(handles.ax1,T,exp(lny),'linewidth',1);        
        
    
    case 'Idini2016_5.png'
        % Figure 10c from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),9,100,100,100,1100,0,'interface');
            lny(2,i)=Idini2016(T(i),8,100,100,100,1100,0,'interface');
            lny(3,i)=Idini2016(T(i),7,100,100,100,1100,0,'interface');
            lny(4,i)=Idini2016(T(i),6,100,100,100,1100,0,'interface');
        end        
        plot(handles.ax1,T,exp(lny),'linewidth',1);
%         
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 5];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
        
    case 'Idini2016_6.png'
        % Figure 10b from Idini 2016
        T   = [0.001;0.01;0.02;0.03;0.05;0.07;0.10;0.15;0.20;0.25;0.30;0.40;0.50;0.75;1.00;1.50;2.00;3.00;4.00;5.00;7.50;10.00]';
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=Idini2016(T(i),8,30,100,100,1100,0,'intraslab');
            lny(2,i)=Idini2016(T(i),7,30,100,100,1100,0,'intraslab');
            lny(3,i)=Idini2016(T(i),6,30,100,100,1100,0,'intraslab');
        end        
        plot(handles.ax1,T,exp(lny),'linewidth',1);    
%         
end