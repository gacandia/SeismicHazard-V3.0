function [handles]=GMMValidation_Montalva2018(handles,filename)


switch filename
    case 'Montalva2018_1.png'
        T     = 0.01;
        M     = linspace(5.5,9,30)';
        on    = ones(size(M));
        lny   = zeros(length(M),4);
        VS30  = 200;
        f0    = 0.8;
        Zhyp  = 30*on;
        R     = 50*on; lny(:,1)   = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0,'interface');
        R     = 100*on; lny(:,2)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0,'interface');
        R     = 150*on; lny(:,3)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0,'interface');
        R     = 200*on; lny(:,4)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0,'interface');
        
        plot(handles.ax1,M,exp(lny),'-','linewidth',2,'tag','curves')
        handles.ax1.XLim=[5.5 9];
        handles.ax1.YLim=[1e-3 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Mag (Mw)')
        ylabel(handles.ax1,'ln(Accekeration)(g)')
        
    case 'Montalva2018_2.png'
        T     = 0.01;
        Rrup  = linspace(50,300,30)';
        on    = ones(size(Rrup));
        Rhyp  = linspace(50,300,30)';
        Zhyp  = 30*on;
        
        lny   = zeros(length(Rrup),4);
        VS30  = 200;
        f0    = 0.8;
        M     = 5*on; lny(:,1)  = Montalva2018(T,M,Rrup,Rhyp,Zhyp,VS30,1/f0,'interface');
        M     = 6*on; lny(:,2)  = Montalva2018(T,M,Rrup,Rhyp,Zhyp,VS30,1/f0,'interface');
        M     = 7*on; lny(:,3)  = Montalva2018(T,M,Rrup,Rhyp,Zhyp,VS30,1/f0,'interface');
        M     = 8*on; lny(:,4)  = Montalva2018(T,M,Rrup,Rhyp,Zhyp,VS30,1/f0,'interface');
        
        plot(handles.ax1,Rrup,exp(lny),'-','linewidth',2,'tag','curves')
        handles.ax1.XLim=[50 300];
        handles.ax1.YLim=[1e-4 1e0];
        handles.ax1.XScale='linear';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'ln(Accekeration)(g)')   
        
    case 'Montalva2018_3.png'
        T     = 0.01;
        VS30  = logsp(200,1200,50)';
        lny   = zeros(length(VS30),4);
        Zhyp  = 20;
        f0    = -1;
        M     = 7;
        for jj=1:length(VS30)
            R = 50;  lny(jj,1)  = Montalva2018(T,M,R,R,Zhyp,VS30(jj),1/f0,'interface');
            R = 100; lny(jj,2)  = Montalva2018(T,M,R,R,Zhyp,VS30(jj),1/f0,'interface');
            R = 150; lny(jj,3)  = Montalva2018(T,M,R,R,Zhyp,VS30(jj),1/f0,'interface');
            R = 200; lny(jj,4)  = Montalva2018(T,M,R,R,Zhyp,VS30(jj),1/f0,'interface');
        end
        
        plot(handles.ax1,VS30,exp(lny),'-','linewidth',2,'tag','curves')
        handles.ax1.XLim=[200 1200];
        handles.ax1.YLim=[1e-2 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'VS30 (m/s)')
        ylabel(handles.ax1,'ln(Accekeration)(g)') 
        
    case 'Montalva2018_4.png'
        T     = 0.01;
        f0    = logsp(0.4,10,50)';
        lny   = zeros(length(f0),4);
        Zhyp  = 30;
        VS30  = 1200;
        M     = 7;
        for jj=1:length(f0)
            R = 50;  lny(jj,1)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0(jj),'interface');
            R = 100; lny(jj,2)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0(jj),'interface');
            R = 150; lny(jj,3)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0(jj),'interface');
            R = 200; lny(jj,4)  = Montalva2018(T,M,R,R,Zhyp,VS30,1/f0(jj),'interface');
        end
        
        plot(handles.ax1,f0,exp(lny),'-','linewidth',2,'tag','curves')
        handles.ax1.XLim=[0.5 10];
        handles.ax1.YLim=[1e-2 1e0];
        handles.ax1.XScale='log';
        handles.ax1.YScale='log';
        xlabel(handles.ax1,'f0 (Hz)')
        ylabel(handles.ax1,'ln(Accekeration)(g)')         
end