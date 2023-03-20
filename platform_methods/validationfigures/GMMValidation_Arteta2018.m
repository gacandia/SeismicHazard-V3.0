function [handles]=GMMValidation_Arteta2018(handles,filename)

switch filename
    case 'Arteta2018_1.png'
        % Figure 10a from Abrahamson 2016
        T=[0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10]';
        lny = zeros(1,length(T));
        sig = zeros(1,length(T));
        for i=1:length(T)
            [lny(1,i),sig(1,i)]=Arteta2018(T(i),7.2,120,'rock','forearc');
        end
        plot(handles.ax1,T,exp([lny;lny-sig;lny+sig]),'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.0001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period [s]')
        ylabel(handles.ax1,'Sa RotD50s [g]')
        
    case  'Arteta2018_2.png'
        T=[0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10]';
        lny1 = zeros(4,length(T));
        lny2 = zeros(4,length(T));
        for i=1:length(T)
            lny1(1,i)=Arteta2018(T(i),5,80,'rock','forearc');
            lny1(2,i)=Arteta2018(T(i),6,80,'rock','forearc');
            lny1(3,i)=Arteta2018(T(i),7,80,'rock','forearc');
            lny1(4,i)=Arteta2018(T(i),8,80,'rock','forearc');
            lny2(1,i)=Arteta2018(T(i),5,80,'soil','forearc');
            lny2(2,i)=Arteta2018(T(i),6,80,'soil','forearc');
            lny2(3,i)=Arteta2018(T(i),7,80,'soil','forearc');
            lny2(4,i)=Arteta2018(T(i),8,80,'soil','forearc');            
        end
        plot(handles.ax1,T,exp(lny1),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1);

        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period [s]')
        ylabel(handles.ax1,'Sa RotD50s [g]')
        
    case  'Arteta2018_3.png'
        T=[0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10]';
        lny1 = zeros(4,length(T));
        lny2 = zeros(4,length(T));
        for i=1:length(T)
            lny1(1,i)=Arteta2018(T(i),5,120,'rock','forearc');
            lny1(2,i)=Arteta2018(T(i),6,120,'rock','forearc');
            lny1(3,i)=Arteta2018(T(i),7,120,'rock','forearc');
            lny1(4,i)=Arteta2018(T(i),8,120,'rock','forearc');
            lny2(1,i)=Arteta2018(T(i),5,120,'soil','forearc');
            lny2(2,i)=Arteta2018(T(i),6,120,'soil','forearc');
            lny2(3,i)=Arteta2018(T(i),7,120,'soil','forearc');
            lny2(4,i)=Arteta2018(T(i),8,120,'soil','forearc');            
        end
        plot(handles.ax1,T,exp(lny1),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1);

        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period [s]')
        ylabel(handles.ax1,'Sa RotD50s [g]')
        
    case  'Arteta2018_4.png'
        T=[0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10]';
        lny1 = zeros(4,length(T));
        lny2 = zeros(4,length(T));
        for i=1:length(T)
            lny1(1,i)=Arteta2018(T(i),5,200,'rock','forearc');
            lny1(2,i)=Arteta2018(T(i),6,200,'rock','forearc');
            lny1(3,i)=Arteta2018(T(i),7,200,'rock','forearc');
            lny1(4,i)=Arteta2018(T(i),8,200,'rock','forearc');
            lny2(1,i)=Arteta2018(T(i),5,200,'soil','forearc');
            lny2(2,i)=Arteta2018(T(i),6,200,'soil','forearc');
            lny2(3,i)=Arteta2018(T(i),7,200,'soil','forearc');
            lny2(4,i)=Arteta2018(T(i),8,200,'soil','forearc');            
        end
        plot(handles.ax1,T,exp(lny1),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log'; 
        xlabel(handles.ax1,'Period [s]')
        ylabel(handles.ax1,'Sa RotD50s [g]')        
        
        
    case  'Arteta2018_5.png'
        M    = linspace(5,8,50)';
        on   = ones(50,1);
        lny(:,1)=Arteta2018(0,M,80*on,'rock','forearc');
        lny(:,2)=Arteta2018(0,M,160*on,'rock','forearc');
        lny(:,3)=Arteta2018(0,M,300*on,'rock','forearc');
        lny(:,4)=Arteta2018(0,M,500*on,'rock','forearc');
        
        plot(handles.ax1,M,exp(lny),'linewidth',1)
        handles.ax1.XLim=[5 8];
        handles.ax1.YLim=[0.0001 0.1];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Magnitude, Mw')
        ylabel(handles.ax1,'PGA [g]')
        
    case 'Arteta2018_6.png'        
        T=[0.01;0.02;0.05;0.075;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.75;1;1.5;2;2.5;3;4;5;6;7.5;10]';
        lny1 = zeros(4,length(T));
        lny2 = zeros(4,length(T));
        for i=1:length(T)
            lny1(1,i)=Arteta2018(T(i),6,80 ,'rock','forearc');
            lny1(2,i)=Arteta2018(T(i),6,160,'rock','forearc');
            lny1(3,i)=Arteta2018(T(i),6,300,'rock','forearc');
            lny1(4,i)=Arteta2018(T(i),6,500,'rock','forearc');
            lny2(1,i)=Arteta2018(T(i),6,80 ,'rock','backarc');
            lny2(2,i)=Arteta2018(T(i),6,160,'rock','backarc');
            lny2(3,i)=Arteta2018(T(i),6,300,'rock','backarc');
            lny2(4,i)=Arteta2018(T(i),6,500,'rock','backarc');            
        end        
        
        plot(handles.ax1,T,exp(lny1),'linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1);        

        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0.00001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log'; 
        xlabel(handles.ax1,'Period [s]')
        ylabel(handles.ax1,'Sa RotD50s [g]')    
        
    case  'Arteta2018_7.png'
        Rhyp  = logsp(100,500,10)';
        on    = ones(10,1);
        [lny(:,1),sig(:,1)]=Arteta2018(0,6.3*on,Rhyp,'rock','forearc');
        [lny(:,2),sig(:,2)]=Arteta2018(0,6.3*on,Rhyp,'soil','forearc');
        
        plot(handles.ax1,Rhyp,exp(lny),'linewidth',1)
        handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rhyp,exp(lny+1.5*sig),'--','linewidth',1)
        handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rhyp,exp(lny-1.5*sig),'--','linewidth',1)
        handles.ax1.XLim=[100 1000];
        handles.ax1.YLim=[0.001 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rhyp [km]')
        ylabel(handles.ax1,'PGA [g]')        
end