function [handles]=GMMValidation_Cauzzi2015(handles,filename)

switch filename
    case 'Cauzzi2015_1.png'
        Rrup = logsp(0.1,100,30);
        on   = logsp(1,1,30);
        VS30 = 800;
        lny(1,:) = Cauzzi2015(0.01,4.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(2,:) = Cauzzi2015(0.01,5.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(3,:) = Cauzzi2015(0.01,6.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(4,:) = Cauzzi2015(0.01,7.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(5,:) = Cauzzi2015(0.01,8.0*on,Rrup,Rrup,VS30,3,'strike-slip');
        
        plot(handles.ax1,Rrup,exp(lny)*980.66,'-','linewidth',2)
        handles.ax1.XLim   = [0.1 100];
        handles.ax1.YLim   = [0.1 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
        
    case 'Cauzzi2015_2.png'
        Rrup = logsp(0.1,100,30);
        on   = logsp(1,1,30);
        VS30 = 800;
        lny(1,:) = Cauzzi2015(1,4.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(2,:) = Cauzzi2015(1,5.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(3,:) = Cauzzi2015(1,6.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(4,:) = Cauzzi2015(1,7.5*on,Rrup,Rrup,VS30,3,'strike-slip');
        lny(5,:) = Cauzzi2015(1,8.0*on,Rrup,Rrup,VS30,3,'strike-slip');
        
        plot(handles.ax1,Rrup,exp(lny)*980.66,'-','linewidth',2)
        handles.ax1.XLim   = [0.1 100];
        handles.ax1.YLim   = [0.1 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
    case 'Cauzzi2015_3.png'
        Rrup = logsp(0.1,100,30);
        on   = logsp(1,1,30);
        VS30 = 800;
        lny(1,:) = Cauzzi2015(0.01,4.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(2,:) = Cauzzi2015(0.01,5.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(3,:) = Cauzzi2015(0.01,6.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(4,:) = Cauzzi2015(0.01,7.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(5,:) = Cauzzi2015(0.01,8.0*on,Rrup,Rrup,VS30,2,'strike-slip');
        
        plot(handles.ax1,Rrup,exp(lny)*980.66,'-','linewidth',2)
        handles.ax1.XLim   = [0.1 100];
        handles.ax1.YLim   = [0.1 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
    case 'Cauzzi2015_4.png'
        Rrup = logsp(0.1,100,30);
        on   = logsp(1,1,30);
        VS30 = 800;
        lny(1,:) = Cauzzi2015(1,4.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(2,:) = Cauzzi2015(1,5.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(3,:) = Cauzzi2015(1,6.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(4,:) = Cauzzi2015(1,7.5*on,Rrup,Rrup,VS30,2,'strike-slip');
        lny(5,:) = Cauzzi2015(1,8.0*on,Rrup,Rrup,VS30,2,'strike-slip');
        
        plot(handles.ax1,Rrup,exp(lny)*980.66,'-','linewidth',2)
        handles.ax1.XLim   = [0.1 100];
        handles.ax1.YLim   = [0.1 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
    case 'Cauzzi2015_5.png'
        
        T = [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00 2.05 2.10 2.15 2.20 2.25 2.30 2.35 2.40 2.45 2.50 2.55 2.60 2.65 2.70 2.75 2.80 2.85 2.90 2.95 3.00 3.05 3.10 3.15 3.20 3.25 3.30 3.35 3.40 3.45 3.50 3.55 3.60 3.65 3.70 3.75 3.80 3.85 3.90 3.95 4.00 4.05 4.10 4.15 4.20 4.25 4.30 4.35 4.40 4.45 4.50 4.55 4.60 4.65 4.70 4.75 4.80 4.85 4.90 4.95 5.00 5.05 5.10 5.15 5.20 5.25 5.30 5.35 5.40 5.45 5.50 5.55 5.60 5.65 5.70 5.75 5.80 5.85 5.90 5.95 6.00 6.05 6.10 6.15 6.20 6.25 6.30 6.35 6.40 6.45 6.50 6.55 6.60 6.65 6.70 6.75 6.80 6.85 6.90 6.95 7.00 7.05 7.10 7.15 7.20 7.25 7.30 7.35 7.40 7.45 7.50 7.55 7.60 7.65 7.70 7.75 7.80 7.85 7.90 7.95 8.00 8.05 8.10 8.15 8.20 8.25 8.30 8.35 8.40 8.45 8.50 8.55 8.60 8.65 8.70 8.75 8.80 8.85 8.90 8.95 9.00 9.05 9.10 9.15 9.20 9.25 9.30 9.35 9.40 9.45 9.50 9.55 9.60 9.65 9.70 9.75 9.80 9.85 9.90 9.95 10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i) = Cauzzi2015(T(i),6.5,5 ,5,800,2,'strike-slip');
            lny(2,i) = Cauzzi2015(T(i),6.5,10,10,800,2,'strike-slip');
            lny(3,i) = Cauzzi2015(T(i),6.5,20,20,800,2,'strike-slip');
        end
        plot(T,exp(lny)*980.66,'linewidth',2)
        handles.ax1.XLim   = [0.01 4];
        handles.ax1.YLim   = [0 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
    case 'Cauzzi2015_6.png'
        
        T = [0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00 2.05 2.10 2.15 2.20 2.25 2.30 2.35 2.40 2.45 2.50 2.55 2.60 2.65 2.70 2.75 2.80 2.85 2.90 2.95 3.00 3.05 3.10 3.15 3.20 3.25 3.30 3.35 3.40 3.45 3.50 3.55 3.60 3.65 3.70 3.75 3.80 3.85 3.90 3.95 4.00 4.05 4.10 4.15 4.20 4.25 4.30 4.35 4.40 4.45 4.50 4.55 4.60 4.65 4.70 4.75 4.80 4.85 4.90 4.95 5.00 5.05 5.10 5.15 5.20 5.25 5.30 5.35 5.40 5.45 5.50 5.55 5.60 5.65 5.70 5.75 5.80 5.85 5.90 5.95 6.00 6.05 6.10 6.15 6.20 6.25 6.30 6.35 6.40 6.45 6.50 6.55 6.60 6.65 6.70 6.75 6.80 6.85 6.90 6.95 7.00 7.05 7.10 7.15 7.20 7.25 7.30 7.35 7.40 7.45 7.50 7.55 7.60 7.65 7.70 7.75 7.80 7.85 7.90 7.95 8.00 8.05 8.10 8.15 8.20 8.25 8.30 8.35 8.40 8.45 8.50 8.55 8.60 8.65 8.70 8.75 8.80 8.85 8.90 8.95 9.00 9.05 9.10 9.15 9.20 9.25 9.30 9.35 9.40 9.45 9.50 9.55 9.60 9.65 9.70 9.75 9.80 9.85 9.90 9.95 10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i) = Cauzzi2015(T(i),7.5,5 ,5,800,2,'strike-slip');
            lny(2,i) = Cauzzi2015(T(i),7.5,10,10,800,2,'strike-slip');
            lny(3,i) = Cauzzi2015(T(i),7.5,20,20,800,2,'strike-slip');
        end
        plot(T,exp(lny)*980.66,'linewidth',2)
        handles.ax1.XLim   = [0.01 4];
        handles.ax1.YLim   = [0 1000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median PSA, cms^-^2')
        
    case 'Cauzzi2015_7.png'
        
        T = 2i+[0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00 2.05 2.10 2.15 2.20 2.25 2.30 2.35 2.40 2.45 2.50 2.55 2.60 2.65 2.70 2.75 2.80 2.85 2.90 2.95 3.00 3.05 3.10 3.15 3.20 3.25 3.30 3.35 3.40 3.45 3.50 3.55 3.60 3.65 3.70 3.75 3.80 3.85 3.90 3.95 4.00 4.05 4.10 4.15 4.20 4.25 4.30 4.35 4.40 4.45 4.50 4.55 4.60 4.65 4.70 4.75 4.80 4.85 4.90 4.95 5.00 5.05 5.10 5.15 5.20 5.25 5.30 5.35 5.40 5.45 5.50 5.55 5.60 5.65 5.70 5.75 5.80 5.85 5.90 5.95 6.00 6.05 6.10 6.15 6.20 6.25 6.30 6.35 6.40 6.45 6.50 6.55 6.60 6.65 6.70 6.75 6.80 6.85 6.90 6.95 7.00 7.05 7.10 7.15 7.20 7.25 7.30 7.35 7.40 7.45 7.50 7.55 7.60 7.65 7.70 7.75 7.80 7.85 7.90 7.95 8.00 8.05 8.10 8.15 8.20 8.25 8.30 8.35 8.40 8.45 8.50 8.55 8.60 8.65 8.70 8.75 8.80 8.85 8.90 8.95 9.00 9.05 9.10 9.15 9.20 9.25 9.30 9.35 9.40 9.45 9.50 9.55 9.60 9.65 9.70 9.75 9.80 9.85 9.90 9.95 10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i) = Cauzzi2015(T(i),6.5,5 ,5,800,2,'strike-slip');
            lny(2,i) = Cauzzi2015(T(i),6.5,10,10,800,2,'strike-slip');
            lny(3,i) = Cauzzi2015(T(i),6.5,20,20,800,2,'strike-slip');
        end
        plot(real(T),exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0 10];
        handles.ax1.YLim   = [0 70];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median DRS, cm')
        
    case 'Cauzzi2015_8.png'
        
        T = 2i+[0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.10 0.15 0.20 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95 1.00 1.05 1.10 1.15 1.20 1.25 1.30 1.35 1.40 1.45 1.50 1.55 1.60 1.65 1.70 1.75 1.80 1.85 1.90 1.95 2.00 2.05 2.10 2.15 2.20 2.25 2.30 2.35 2.40 2.45 2.50 2.55 2.60 2.65 2.70 2.75 2.80 2.85 2.90 2.95 3.00 3.05 3.10 3.15 3.20 3.25 3.30 3.35 3.40 3.45 3.50 3.55 3.60 3.65 3.70 3.75 3.80 3.85 3.90 3.95 4.00 4.05 4.10 4.15 4.20 4.25 4.30 4.35 4.40 4.45 4.50 4.55 4.60 4.65 4.70 4.75 4.80 4.85 4.90 4.95 5.00 5.05 5.10 5.15 5.20 5.25 5.30 5.35 5.40 5.45 5.50 5.55 5.60 5.65 5.70 5.75 5.80 5.85 5.90 5.95 6.00 6.05 6.10 6.15 6.20 6.25 6.30 6.35 6.40 6.45 6.50 6.55 6.60 6.65 6.70 6.75 6.80 6.85 6.90 6.95 7.00 7.05 7.10 7.15 7.20 7.25 7.30 7.35 7.40 7.45 7.50 7.55 7.60 7.65 7.70 7.75 7.80 7.85 7.90 7.95 8.00 8.05 8.10 8.15 8.20 8.25 8.30 8.35 8.40 8.45 8.50 8.55 8.60 8.65 8.70 8.75 8.80 8.85 8.90 8.95 9.00 9.05 9.10 9.15 9.20 9.25 9.30 9.35 9.40 9.45 9.50 9.55 9.60 9.65 9.70 9.75 9.80 9.85 9.90 9.95 10];
        lny = zeros(3,length(T));
        for i=1:length(T)
            lny(1,i) = Cauzzi2015(T(i),7.5,5 ,5,800,2,'strike-slip');
            lny(2,i) = Cauzzi2015(T(i),7.5,10,10,800,2,'strike-slip');
            lny(3,i) = Cauzzi2015(T(i),7.5,20,20,800,2,'strike-slip');
        end
        plot(real(T),exp(lny),'linewidth',2)
        handles.ax1.XLim   = [0 10];
        handles.ax1.YLim   = [0 70];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'Median DRS, cm')
end