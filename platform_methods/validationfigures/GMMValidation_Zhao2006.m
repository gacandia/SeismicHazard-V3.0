function [handles]=GMMValidation_Zhao2006(handles,filename)

switch filename
    case 'Zhao2006_1.png'
        M     = 7*ones(40,1);
        Rrup  = logsp(0.3,400,40)';
        Zhyp  = 20*ones(40,1);
        
        [lny,sigma]=Zhao2006(0.01,M,Rrup,Zhyp,500,'strike-slip');
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny+sigma),'--','linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny-sigma),'--','linewidth',1)
        
        displayname = {...
            'Strike-slip M=7, Mean'...
            'Strike-slip M=7, Mean+sigma'...
            'Strike-slip M=7, Mean-sigma'...
            };
        
        handles.ax1.XLim   = [0.3 400];
        handles.ax1.YLim   = [0.002 3.3];
        handles.ax1.XTick  = [0.5 1 2 5 10 20 50 100 200];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup(km)')
        
    case 'Zhao2006_2.png'
        M     = 7*ones(40,1);
        Rrup  = logsp(5,400,40)';
        Zhyp  = 20*ones(40,1);
        
        [lny,sigma]=Zhao2006(0.01,M,Rrup,Zhyp,500,'interface');
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny+sigma),'--','linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny-sigma),'--','linewidth',1)
        displayname = {...
            'Interface M=7, Zhyp=20km Mean'...
            'Interface M=7, Zhyp=20km  Mean+sigma'...
            'Interface M=7, Zhyp=20km  Mean-sigma'...
            };        
        
        handles.ax1.XLim   = [5 400];
        handles.ax1.XTick  = [5 10 20 50 100 200];
        handles.ax1.YLim   = [0.002 3.3];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup(km)')
        
    case 'Zhao2006_3.png'
        M     = 7*ones(40,1);
        Rrup  = logsp(30,400,40)';
        Zhyp  = 40*ones(40,1);
        
        [lny,sigma]=Zhao2006(0.01,M,Rrup,Zhyp,500,'intraslab');
        
        plot(handles.ax1,Rrup,exp(lny),'linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny+sigma),'--','linewidth',1),handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,Rrup,exp(lny-sigma),'--','linewidth',1)
        
        displayname = {...
            'Intraslab M=7, Zhyp=40km Mean'...
            'Intraslab M=7, Zhyp=40km  Mean+sigma'...
            'Intraslab M=7, Zhyp=40km  Mean-sigma'...
            };        
        handles.ax1.XLim   = [30 400];
        handles.ax1.XTick  = [30 50 70 100 200 300 400];
        handles.ax1.YLim   = [0.002 3.3];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        
    case 'Zhao2006_4.png'
        
        Rrup  = logsp(40,400,40)';
        Zhyp  = 40*ones(40,1);
        VS30  = 500;
        M = 5*ones(40,1);lny1=Zhao2006(0.01,M,Rrup,Zhyp,VS30,'intraslab');
        M = 6*ones(40,1);lny2=Zhao2006(0.01,M,Rrup,Zhyp,VS30,'intraslab');
        M = 7*ones(40,1);lny3=Zhao2006(0.01,M,Rrup,Zhyp,VS30,'intraslab');
        M = 8*ones(40,1);lny4=Zhao2006(0.01,M,Rrup,Zhyp,VS30,'intraslab');
        
        displayname = {...
            'Intraslab M5'...
            'Intraslab M6'...
            'Intraslab M7'...
            'Intraslab M8'...
            };        
        
        plot(handles.ax1,Rrup,exp([lny1,lny2,lny3,lny4]),'linewidth',1)
        
        handles.ax1.XLim   = [40 400];
        handles.ax1.YLim   = [0.0005 3.2];
        handles.ax1.XTick  = [40 50 70 100 200 300 400];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup(s)')
        ylabel(handles.ax1,'PGA')
        
    case 'Zhao2006_5.png'
        
        T=[0.02;0.05;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.25;1.5;2;2.5;3;4;5];
        h=[15 40 60 80 100 120]';
        R=[120 120 120 120 120 120]';
        M=[7 7 7 7 7 7]';
        lny = zeros(6,length(T));
        for j=1:length(T)
            lny(:,j)=Zhao2006(T(j),M,R,h,500,'interface');
        end
        
        
        SA = exp(lny);
        SA = SA(2:6,:)./SA(ones(5,1),:);
        plot(handles.ax1,T,SA,'linewidth',1)
        
        displayname = {...
            'h=40'...
            'h=60'...
            'h=80'...
            'h=100'...
            'h=120'...
            };         
        
        handles.ax1.XLim   = [0.02 6];
        handles.ax1.XTick  = [0.02 0.05 0.1 0.2 0.5 1 2 5];
        handles.ax1.YLim   = [0.98 5.5];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'ratio')
        
    case 'Zhao2006_6.png'
        
        T=[0.02;0.05;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.25;1.5;2;2.5;3;4;5];
        h=[15 15 15 15]';
        R=[40 60 90 150]';
        M=[7 7 7 7]';
        SaC = zeros(4,length(T));
        SaR = zeros(4,length(T));
        SaI = zeros(4,length(T));
        SaS = zeros(4,length(T));
        for j=1:length(T)
            SaC(:,j)=exp(Zhao2006(T(j),M,R,h,500,'strike-slip'));
            SaR(:,j)=exp(Zhao2006(T(j),M,R,h,500,'reverse'));
            SaI(:,j)=exp(Zhao2006(T(j),M,R,h,500,'interface'));
            SaS(:,j)=exp(Zhao2006(T(j),M,R,h,500,'intraslab'));
        end
        RA1= SaI./SaC;
        RA2= SaS./SaC;
        RA3= SaR./SaC;
        plot(handles.ax1,T,RA1(1,:),'^-','linewidth',1); set(handles.ax1,'ColorOrderIndex',1)
        plot(handles.ax1,T,RA2,'s-','linewidth',1)
        plot(handles.ax1,T,RA3(1,:),'o-','linewidth',1)
 
        displayname = {...
            'Interface / strike-slip'...
            'Slab / strike-slip (h=40)'...
            'Slab / strike-slip (h=60)'...
            'Slab / strike-slip (h=80)'...
            'Slab / strike-slip (h=150)'...
            'Reverse / Strike-Slip'
            };         
        handles.ax1.XLim   = [0.02 6];
        handles.ax1.XTick  = [0.02 0.05 0.1 0.2 0.5 1 2 5];
        handles.ax1.YLim   = [0.39 2.4];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        handles.ax1.YTick  = [0.5 1 1.5 2];
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'ratio')
        
    case 'Zhao2006_7.png'
        
        T=[0.02;0.05;0.1;0.15;0.2;0.25;0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.25;1.5;2;2.5;3;4;5];
        sig1 = zeros(1,length(T));
        sig2 = zeros(1,length(T));
        
        for j=1:length(T)
            [~,sig1(j)]=Zhao2006(T(j),7,100,15,00,'interface');
            [~,sig2(j)]=Zhao2006(T(j),7,100,15,00,'intraslab');
        end
        plot(handles.ax1,T,sig1,'o-','linewidth',1);
        plot(handles.ax1,T,sig2,'^-','linewidth',1);
        handles.ax1.XLim   = [0.02 6];
        handles.ax1.XTick  = [0.02 0.05 0.1 0.2 0.5 1 2 5];
        handles.ax1.YLim   = [0.4 1.6];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        handles.ax1.YTick  = [0.4:0.2:1.6];
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'sigma total')
end

%% RE-ASSIGNS DISPLAYNAME
ch =findall(handles.ax1,'type','line');
if exist('displayname','var')
    displayname = fliplr(displayname);
    for i=1:numel(ch)
        ch(i).DisplayName=displayname{i};
    end
end