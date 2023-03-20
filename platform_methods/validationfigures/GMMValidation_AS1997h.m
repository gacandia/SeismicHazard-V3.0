function [handles]=GMMValidation_AS1997h(handles,filename)

switch filename
    case 'AS1997h_1.png'
        T = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.075, 0.09, 0.1, 0.12, 0.15, 0.17, 0.2, 0.24, 0.3, 0.36, 0.4, 0.46, 0.5, 0.6, 0.75, 0.85, 1, 1.5, 2, 3, 4, 5];
        lny1 = zeros(4,length(T));
        lny2 = zeros(4,length(T));
        for i=1:length(T)
            lny1(1,i)=AS1997h(T(i),7,1  ,'rock','unspecified','footwall','arbitrary');
            lny1(2,i)=AS1997h(T(i),7,10 ,'rock','unspecified','footwall','arbitrary');
            lny1(3,i)=AS1997h(T(i),7,30 ,'rock','unspecified','footwall','arbitrary');
            lny1(4,i)=AS1997h(T(i),7,100,'rock','unspecified','footwall','arbitrary');
            
            lny2(1,i)=AS1997h(T(i),7,1  ,'deepsoil','unspecified','footwall','arbitrary');
            lny2(2,i)=AS1997h(T(i),7,10 ,'deepsoil','unspecified','footwall','arbitrary');
            lny2(3,i)=AS1997h(T(i),7,30 ,'deepsoil','unspecified','footwall','arbitrary');
            lny2(4,i)=AS1997h(T(i),7,100,'deepsoil','unspecified','footwall','arbitrary');
        end
        plot(handles.ax1,T,exp(lny1),'-','linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1)
        
        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.01 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
    case 'AS1997h_2.png'
        T    = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.075, 0.09, 0.1, 0.12, 0.15, 0.17, 0.2, 0.24, 0.3, 0.36, 0.4, 0.46, 0.5, 0.6, 0.75, 0.85, 1, 1.5, 2, 3, 4, 5];
        lny1 = zeros(3,length(T));
        lny2 = zeros(3,length(T));
        for i=1:length(T)
            lny1(1,i)=AS1997h(T(i),5.5,10 ,'rock','unspecified','footwall','arbitrary');
            lny1(2,i)=AS1997h(T(i),6.5,10 ,'rock','unspecified','footwall','arbitrary');
            lny1(3,i)=AS1997h(T(i),7.5,10 ,'rock','unspecified','footwall','arbitrary');
            
            lny2(1,i)=AS1997h(T(i),5.5,10 ,'deepsoil','unspecified','footwall','arbitrary');
            lny2(2,i)=AS1997h(T(i),6.5,10 ,'deepsoil','unspecified','footwall','arbitrary');
            lny2(3,i)=AS1997h(T(i),7.5,10 ,'deepsoil','unspecified','footwall','arbitrary');
        end
        plot(handles.ax1,T,exp(lny1),'-','linewidth',1); handles.ax1.ColorOrderIndex=1;
        plot(handles.ax1,T,exp(lny2),'--','linewidth',1)

        handles.ax1.XLim=[0.01  10];
        handles.ax1.YLim=[0.01 10];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log'; 
end
