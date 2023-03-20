function [handles]=GMMValidation_AkkarBoomer2007(handles,filename)

switch filename
    case 'AkkarBoomer2007_1.png'
        T     = (2i+linspace(0.05,4.00,80)).';
        lny   = zeros(length(T),5);
        
        for i=1:length(T)
            lny(i,1)=AkkarBoomer2007(T(i),7,2,'soft','reverse',2);
            lny(i,2)=AkkarBoomer2007(T(i),7,2,'soft','reverse',5);
            lny(i,3)=AkkarBoomer2007(T(i),7,2,'soft','reverse',10);
            lny(i,4)=AkkarBoomer2007(T(i),7,2,'soft','reverse',20);
            lny(i,5)=AkkarBoomer2007(T(i),7,2,'soft','reverse',30);
        end
        SD = exp(lny);
        for i=1:5
            SD(:,i)=exp(smooth(real(T),log(SD(:,i)),5));
        end
        
        plot(handles.ax1,real(T),SD,'-','linewidth',1)

        handles.ax1.XLim   = [0 4];
        handles.ax1.YLim   = [0 65];
        handles.ax1.XScale = 'linear';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'SD (cm)')
        
    case 'AkkarBoomer2007_2.png'
        T     = (2i+linspace(0.05,4.00,80)).';
        lny   = zeros(length(T),5);
        
        for i=1:length(T)
            lny(i,1)=AkkarBoomer2007(T(i),7,2,'soft','reverse',2);
            lny(i,2)=AkkarBoomer2007(T(i),7,2,'soft','reverse',5);
            lny(i,3)=AkkarBoomer2007(T(i),7,2,'soft','reverse',10);
            lny(i,4)=AkkarBoomer2007(T(i),7,2,'soft','reverse',20);
            lny(i,5)=AkkarBoomer2007(T(i),7,2,'soft','reverse',30);
        end
        SD = exp(lny);
        PSA = SD.*(2*pi./repmat(real(T),1,5)).^2;
        plot(handles.ax1,real(T),PSA,'-','linewidth',1)

        handles.ax1.XLim   = [0.04 4];
        handles.ax1.YLim   = [0 2000];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'linear';
        xlabel(handles.ax1,'Period (s)')
        ylabel(handles.ax1,'PSA (cm/s^2)')        
end