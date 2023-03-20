function [handles]=GMMValidation_TBA03(handles,filename)

switch filename

    case 'TBA03_1.png'
        T    = -5; %AI
        Rrup = logsp(1,200,100);
        on = ones(1,100);
        lny       = zeros(9,100);
        SOF = 'strike-slip'; media = 1; M=7.5*on; lny(1,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 2; M=7.5*on; lny(2,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=7.5*on; lny(3,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 1; M=6.5*on; lny(4,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 2; M=6.5*on; lny(5,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=6.5*on; lny(6,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 1; M=5.5*on; lny(7,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 2; M=5.5*on; lny(8,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=5.5*on; lny(9,:) = TBA03(T,M,Rrup,media, SOF);
        AI = exp(lny);
        plot(handles.ax1,Rrup,AI/100,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1 1000],'ylim',[1e-3 1e1])
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'AI (m/s)')
        
    case 'TBA03_2.png'
        T    = -5; %AI
        Rrup = logsp(1,200,100);
        on = ones(1,100);
        lny       = zeros(9,100);
        SOF = 'reverse';     media = 3; M=7.5*on; lny(1,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=7.5*on; lny(2,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'normal';      media = 3; M=7.5*on; lny(3,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'reverse';     media = 3; M=6.5*on; lny(4,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=6.5*on; lny(5,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'normal';      media = 3; M=6.5*on; lny(6,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'reverse';     media = 3; M=5.5*on; lny(7,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'strike-slip'; media = 3; M=5.5*on; lny(8,:) = TBA03(T,M,Rrup,media, SOF);
        SOF = 'normal';      media = 3; M=5.5*on; lny(9,:) = TBA03(T,M,Rrup,media, SOF);
        AI = exp(lny);
        plot(handles.ax1,Rrup,AI/100,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1 1000],'ylim',[1e-3 1e1])
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'AI (m/s)')

end