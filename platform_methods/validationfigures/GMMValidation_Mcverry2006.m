function [handles]=GMMValidation_Mcverry2006(handles,filename)

switch filename
    
    case 'Mcverry2006_1.png'
        Rrup = logsp(1,500,30);
        lny  = zeros(3,30);
        Zhyp =  ones(1,30)*10;
        M = ones(1,30)*5.5; lny(1,:) = Mcverry2006(0,M,Rrup,Zhyp,'C','reverse',-4);
        M = ones(1,30)*6.5; lny(2,:) = Mcverry2006(0,M,Rrup,Zhyp,'C','reverse',-4);
        M = ones(1,30)*7.5; lny(3,:) = Mcverry2006(0,M,Rrup,Zhyp,'C','reverse',-4);
        plot(Rrup,exp(lny),'-','linewidth',1)
        
        handles.ax1.XLim=[1 500];
        handles.ax1.YLim=[0.002 2];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        
end