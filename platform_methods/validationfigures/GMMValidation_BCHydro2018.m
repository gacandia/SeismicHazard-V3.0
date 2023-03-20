function [handles]=GMMValidation_BCHydro2018(handles,filename)

switch filename
    case 'BCHydro2018_1.png'
        % Figure 4.12 BCHydro2018 PEER report
        
        T     = 3; %Ia
        Rrup  = logsp(25,1000,100)';
        on    = ones(size(Rrup));
        M     = 9*on;
        Ztor  = nan*on;
        lny   = BCHydro2018(T,M,Rrup,Ztor,760,'interface');
        plot(handles.ax1,Rrup,exp(lny),'r-','linewidth',1,'tag','curves')
        handles.ax1.XLim=[10 1000];
        handles.ax1.YLim=[1e-4 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
end