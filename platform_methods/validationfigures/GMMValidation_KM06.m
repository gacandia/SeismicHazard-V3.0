function [handles]=GMMValidation_KM06(handles,filename)

switch filename
    case 'KM06_1.png'
        T         = -4; %Ia
        Rrup      = logsp(1,100,100)';
        on        = ones(size(Rrup));
        lny       = zeros(100,9);
        mechanism = 'reverse';     M=7.5*on; lny(:,1) = KM06(T,M,Rrup,mechanism);
        mechanism = 'strike-slip'; M=7.5*on; lny(:,2) = KM06(T,M,Rrup,mechanism);
        mechanism = 'normal';      M=7.5*on; lny(:,3) = KM06(T,M,Rrup,mechanism);
        mechanism = 'reverse';     M=6.5*on; lny(:,4) = KM06(T,M,Rrup,mechanism);
        mechanism = 'strike-slip'; M=6.5*on; lny(:,5) = KM06(T,M,Rrup,mechanism);
        mechanism = 'normal';      M=6.5*on; lny(:,6) = KM06(T,M,Rrup,mechanism);
        mechanism = 'reverse';     M=5.5*on; lny(:,7) = KM06(T,M,Rrup,mechanism);
        mechanism = 'strike-slip'; M=5.5*on; lny(:,8) = KM06(T,M,Rrup,mechanism);
        mechanism = 'normal';      M=5.5*on; lny(:,9) = KM06(T,M,Rrup,mechanism);
        
        plot(handles.ax1,Rrup,exp(lny)/100,'linewidth',1,'tag','curves')
        handles.ax1.XLim=[1  1000];
        handles.ax1.YLim=[1e-1 1e2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Distance, R(km)')
        ylabel(handles.ax1,'CAV5 (m/s)')
end