function [handles]=GMMValidation_Kanno2006(handles,filename)


switch filename
    case 'Kanno2006_1.png'
        T    = 0; %PGA
        Rrup = logsp(1,300,100);
        on   = ones(1,100);
        Zhyp = 5*on;
        lny  = zeros(4,100);
        lny(1,:) = Kanno2006(T,6.5*on,Rrup,Zhyp,300);
        lny(2,:) = Kanno2006(T,7.0*on,Rrup,Zhyp,300);
        lny(3,:) = Kanno2006(T,7.5*on,Rrup,Zhyp,300);
        lny(4,:) = Kanno2006(T,8.0*on,Rrup,Zhyp,300);
        
        PGA = exp(lny);
        plot(handles.ax1,Rrup,PGA*980.66,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1 300],'ylim',[1e-1 1e4])
        xlabel(handles.ax1,'Fault Distance (km)')
        ylabel(handles.ax1,'PGA (cm/s2)')
        
    case 'Kanno2006_2.png'
        T    = -1; %PGV
        Rrup = logsp(1,300,100)';
        on   = ones(1,100)';
        Zhyp = 5*on;
        lny  = zeros(4,100);
        lny(1,:) = Kanno2006(T,6.5*on,Rrup,Zhyp,300);
        lny(2,:) = Kanno2006(T,7.0*on,Rrup,Zhyp,300);
        lny(3,:) = Kanno2006(T,7.5*on,Rrup,Zhyp,300);
        lny(4,:) = Kanno2006(T,8.0*on,Rrup,Zhyp,300);
        
        PGA = exp(lny);
        plot(handles.ax1,Rrup,PGA,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1 300],'ylim',[1e-1 1e4])
        xlabel(handles.ax1,'Fault Distance (km)')
        ylabel(handles.ax1,'PVA (cm/s)')
        
    case 'Kanno2006_3.png'
        T    = 0; %PGA
        Rrup = logsp(30,300,100);
        on   = ones(1,100);
        Zhyp = 50*on;
        lny  = zeros(4,100);
        lny(1,:) = Kanno2006(T,6.5*on,Rrup,Zhyp,300);
        lny(2,:) = Kanno2006(T,7.0*on,Rrup,Zhyp,300);
        lny(3,:) = Kanno2006(T,7.5*on,Rrup,Zhyp,300);
        lny(4,:) = Kanno2006(T,8.0*on,Rrup,Zhyp,300);
        
        PGA = exp(lny);
        plot(handles.ax1,Rrup,PGA*980.66,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[10 300],'ylim',[1e-1 1e4])
        xlabel(handles.ax1,'Fault Distance (km)')
        ylabel(handles.ax1,'PGA (cm/s2)')
        
    case 'Kanno2006_4.png'
        T    = -1; %PGV
        Rrup = logsp(30,300,100);
        on   = ones(1,100);
        Zhyp = 50*on;
        lny  = zeros(4,100);
        lny(1,:) = Kanno2006(T,6.5*on,Rrup,Zhyp,300);
        lny(2,:) = Kanno2006(T,7.0*on,Rrup,Zhyp,300);
        lny(3,:) = Kanno2006(T,7.5*on,Rrup,Zhyp,300);
        lny(4,:) = Kanno2006(T,8.0*on,Rrup,Zhyp,300);
        
        PGA = exp(lny);
        plot(handles.ax1,Rrup,PGA,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[10 300],'ylim',[1e-1 1e4])
        xlabel(handles.ax1,'Fault Distance (km)')
        ylabel(handles.ax1,'PVA (cm/s)')
        
    case 'Kanno2006_5.png'
        T   = [0.01 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 0.15 0.17 0.20 0.22 0.25 0.30 0.35 0.40 0.45 0.50 0.60 0.70 0.80 0.90 1.00 1.10 1.20 1.30 1.50 1.70 2.00 2.20 2.50 3.00 3.50 4.00 4.50 5.00];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Kanno2006(T(i),7,5,5,300);
            lny(2,i)=Kanno2006(T(i),7,20,5,300);
            lny(3,i)=Kanno2006(T(i),7,40,5,300);
            lny(4,i)=Kanno2006(T(i),7,80,5,300);
        end
        plot(handles.ax1,T,exp(lny)*980.66,'linewidth',1);
        handles.ax1.XLim=[0.05  5];
        handles.ax1.YLim=[1e-1 1e4];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
        
    case 'Kanno2006_6.png'
        T   = [0.01 0.05 0.06 0.07 0.08 0.09 0.10 0.11 0.12 0.13 0.15 0.17 0.20 0.22 0.25 0.30 0.35 0.40 0.45 0.50 0.60 0.70 0.80 0.90 1.00 1.10 1.20 1.30 1.50 1.70 2.00 2.20 2.50 3.00 3.50 4.00 4.50 5.00];
        lny = zeros(4,length(T));
        for i=1:length(T)
            lny(1,i)=Kanno2006(T(i),7,40 ,50,300);
            lny(2,i)=Kanno2006(T(i),7,80 ,50,300);
            lny(3,i)=Kanno2006(T(i),7,120,50,300);
            lny(4,i)=Kanno2006(T(i),7,200,50,300);
        end
        plot(handles.ax1,T,exp(lny)*980.66,'linewidth',1);
        handles.ax1.XLim=[0.05  5];
        handles.ax1.YLim=[1e-1 1e4];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Period (s)')
end