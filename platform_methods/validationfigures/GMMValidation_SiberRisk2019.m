function [handles]=GMMValidation_SiberRisk2019(handles,filename)

switch filename
    case 'SiberRisk2019_1.png'
        T=[0.01 0.02  0.05  0.075  0.1  0.15  0.2  0.25  0.3  0.4  0.5  0.6  0.75  1  1.5  2  2.5  3  4  5  6  7.5  10];
        nT = length(T);
        sigma= zeros(1,nT);
        phi  = zeros(1,nT);
        tau  = zeros(1,nT);
        for i=1:nT
            [~,sigma(i),tau(i),phi(i)]=SiberRisk2019(T(i),7,100,100,30,760,'interface');
        end
        plot(handles.ax1,T,[sigma;tau;phi],'linewidth',1);
        
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'sigma,tau,phi')
        
    case 'SiberRisk2019_2.png'
        T=[0.01 0.02  0.05  0.075  0.1  0.15  0.2  0.25  0.3  0.4  0.5  0.6  0.75  1  1.5  2  2.5  3  4  5  6  7.5  10];
        nT = length(T);
        sigma= zeros(1,nT);
        phi  = zeros(1,nT);
        tau  = zeros(1,nT);
        for i=1:nT
            [~,sigma(i),tau(i),phi(i)]=SiberRisk2019(T(i),9,100,100,30,760,'intraslab');
        end
        plot(handles.ax1,T,[sigma;tau;phi],'linewidth',1);
        handles.ax1.XLim=[0.01 10];
        handles.ax1.YLim=[0 1];
        handles.ax1.XScale='log';
        handles.ax1.YScale='linear';
        xlabel(handles.ax1,'T(s)')
        ylabel(handles.ax1,'sigma,tau,phi')
end