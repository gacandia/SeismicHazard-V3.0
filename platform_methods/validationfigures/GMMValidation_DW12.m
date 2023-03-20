function [handles]=GMMValidation_DW12(handles,filename)

switch filename
       
    case 'DW12_1.png'
        T    = -4; %CAV
        Rrup = logsp(1,200,100); on = ones(1,100);
        lny       = zeros(9,100);
        mechanism = 'strike-slip'; media = 1; M=7*on; lny(1,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 2; M=7*on; lny(2,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 3; M=7*on; lny(3,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 1; M=6*on; lny(4,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 2; M=6*on; lny(5,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 3; M=6*on; lny(6,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 1; M=5*on; lny(7,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 2; M=5*on; lny(8,:) = DW12(T,M,Rrup,media, mechanism);
        mechanism = 'strike-slip'; media = 3; M=5*on; lny(9,:) = DW12(T,M,Rrup,media, mechanism);
        CAV = exp(lny)/980.66;
        plot(handles.ax1,Rrup,CAV,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1e0 5e2],'ylim',[1e-2 5])
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV-{GM} (g*sec)')
        
    case 'DW12_2.png'
        T    = -4; %CAV
        Rrup = logsp(1,200,100)';
        on   = ones(100,1);
        lny  = nan(100,9);
        mechanism = 'reverse';     M=7*on; lny(:,1) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'strike-slip'; M=7*on; lny(:,2) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'normal';      M=7*on; lny(:,3) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'reverse';     M=6*on; lny(:,4) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'strike-slip'; M=6*on; lny(:,5) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'normal';      M=6*on; lny(:,6) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'reverse';     M=5*on; lny(:,7) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'strike-slip'; M=5*on; lny(:,8) = DW12(T,M,Rrup,2, mechanism);
        mechanism = 'normal';      M=5*on; lny(:,9) = DW12(T,M,Rrup,2, mechanism);
        
        CAV = exp(lny)/980.66;
        plot(handles.ax1,Rrup,CAV,'linewidth',1,'tag','curves')
        set(handles.ax1,'xscale','log','yscale','log','xlim',[1e0 5e2],'ylim',[1e-2 5])
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV-{GM} (g*sec)')

end