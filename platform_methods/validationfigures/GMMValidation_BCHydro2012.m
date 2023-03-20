function [handles]=GMMValidation_BCHydro2012(handles,filename)

switch filename
    case 'BCHydro2012_1.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),7,25,25,[],760,'interface','forearc','central');
            lny(2,i)=BCHydro2012(T(i),8,25,25,[],760,'interface','forearc','central');
            lny(3,i)=BCHydro2012(T(i),9,25,25,[],760,'interface','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_2.png'
        % Figure 10b from Abrahamson 2016
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),7,50,50,[],760,'interface','forearc','central');
            lny(2,i)=BCHydro2012(T(i),8,50,50,[],760,'interface','forearc','central');
            lny(3,i)=BCHydro2012(T(i),9,50,50,[],760,'interface','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_3.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),7,100,100,[],760,'interface','forearc','central');
            lny(2,i)=BCHydro2012(T(i),8,100,100,[],760,'interface','forearc','central');
            lny(3,i)=BCHydro2012(T(i),9,100,100,[],760,'interface','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_4.png'
        % Figure 10d from Abrahamson 2016
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),7,200,200,[],760,'interface','forearc','central');
            lny(2,i)=BCHydro2012(T(i),8,200,200,[],760,'interface','forearc','central');
            lny(3,i)=BCHydro2012(T(i),9,200,200,[],760,'interface','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_5.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),5.5,50 ,50 ,50,760,'intraslab','forearc','central');
            lny(2,i)=BCHydro2012(T(i),5.5,75 ,75 ,50,760,'intraslab','forearc','central');
            lny(3,i)=BCHydro2012(T(i),5.5,100,100,50,760,'intraslab','forearc','central');
            lny(4,i)=BCHydro2012(T(i),5.5,150,150,50,760,'intraslab','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_6.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),6.5,50 ,50 ,50,760,'intraslab','forearc','central');
            lny(2,i)=BCHydro2012(T(i),6.5,75 ,75 ,50,760,'intraslab','forearc','central');
            lny(3,i)=BCHydro2012(T(i),6.5,100,100,50,760,'intraslab','forearc','central');
            lny(4,i)=BCHydro2012(T(i),6.5,150,150,50,760,'intraslab','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);

        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'BCHydro2012_7.png'
        T   = [0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=BCHydro2012(T(i),7.5,50 ,50 ,50,760,'intraslab','forearc','central');
            lny(2,i)=BCHydro2012(T(i),7.5,75 ,75 ,50,760,'intraslab','forearc','central');
            lny(3,i)=BCHydro2012(T(i),7.5,100,100,50,760,'intraslab','forearc','central');
            lny(4,i)=BCHydro2012(T(i),7.5,150,150,50,760,'intraslab','forearc','central');
        end
        plot(handles.ax1,T,exp(lny),'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
      
end