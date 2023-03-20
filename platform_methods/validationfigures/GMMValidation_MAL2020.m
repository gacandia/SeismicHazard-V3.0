function [handles]=GMMValidation_MAL2020(handles,filename)

switch filename
    case 'MAL2020_1.png'
        Rrup     = linspace(1e0,1e2,20)';
        Zhyp     = 15*ones(20,1);
        Ztor     = 1*ones(20,1);
        Zbot     = 'unk';
        Rx       = sqrt(Rrup.^2-Ztor.^2);
        Rjb      = abs(Rx);
        Ry0      = 0*ones(20,1);
        M        = 4.75*ones(20,1);
        Vs30     = 424;
        dip      = 90;
        width    = 20;
        Z10      = 0.048;
        Z25      = 0.607;
        SOF      = 'strike-slip';
        event    = 'mainshock';
        Vs30type = 'measured';
        region   = 'global';
        HWeffect = 'exclude';
        lny   = nan(20,4);
        lny(:,1)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@ASK2014 ,M,Rrup,Rjb,Rx,Ry0,Ztor,dip,width,Vs30,Z10,SOF,event,Vs30type,region);
        lny(:,2)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@BSSA2014,M,Rjb,Vs30,Z10,SOF,region);
        lny(:,3)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@CB2014  ,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,width,Vs30,Z25,SOF,HWeffect,region);
        lny(:,4)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@CY2014  ,M,Rrup,Rjb,Rx,Ztor,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,5)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@I2014   ,M,Rrup,Vs30,SOF);
        
        
        plot(handles.ax1,Rrup,exp(lny(:,1))/100,'linewidth',1,'color',[1 0 0]),
        plot(handles.ax1,Rrup,exp(lny(:,2))/100,'linewidth',1,'color',[0 1 0]),
        plot(handles.ax1,Rrup,exp(lny(:,3))/100,'linewidth',1,'color',[0 0 1]),
        plot(handles.ax1,Rrup,exp(lny(:,4))/100,'linewidth',1,'color',[0.5 0 1]),
        plot(handles.ax1,Rrup,exp(lny(:,5))/100,'linewidth',1,'color',[1 1 0]),
        
        handles.ax1.XLim   = [1e0 1e2];
        handles.ax1.YLim   = [1e-2 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup (km)')
        
        handles.ax1.ColorOrderIndex=1;
        
    case 'MAL2020_2.png'
        Rrup     = linspace(1e0,1e2,20)';
        Zhyp     = 15*ones(20,1);
        Ztor     = 1*ones(20,1);
        Zbot     = 30;
        Rx       = sqrt(Rrup.^2-Ztor.^2);
        Rjb      = sqrt(Rrup.^2-Ztor.^2);
        Ry0      = 0*ones(20,1);
        M        = 4.75*ones(20,1);
        Vs30     = 760;
        dip      = 90;
        width    = 999;
        Z10      = 0.048;
        Z25      = 0.607;
        SOF      = 'strike-slip';
        event    = 'mainshock';
        Vs30type = 'measured';
        region   = 'global';
        HWeffect = 'exclude';
        lny   = nan(20,4);
        lny(:,1)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@ASK2014 ,M,Rrup,Rjb,Rx,Ry0,Ztor,dip,width,Vs30,Z10,SOF,event,Vs30type,region);
        lny(:,2)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@BSSA2014,M,Rjb,Vs30,Z10,SOF,region);
        lny(:,3)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@CB2014  ,M,Rrup,Rjb,Rx,Zhyp,Ztor,Zbot,dip,width,Vs30,Z25,SOF,HWeffect,region);
        lny(:,4)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@CY2014  ,M,Rrup,Rjb,Rx,Ztor,dip,Vs30,Z10,SOF,Vs30type,region);
        lny(:,5)=MAL2020(-4,M,Rrup,Rjb,HWeffect,dip,Vs30,@I2014   ,M,Rrup,Vs30,SOF);
        
        
        plot(handles.ax1,Rrup,exp(lny(:,1))/100,'linewidth',1,'color',[1 0 0]),
        plot(handles.ax1,Rrup,exp(lny(:,2))/100,'linewidth',1,'color',[0 1 0]),
        plot(handles.ax1,Rrup,exp(lny(:,3))/100,'linewidth',1,'color',[0 0 1]),
        plot(handles.ax1,Rrup,exp(lny(:,4))/100,'linewidth',1,'color',[0.5 0 1]),
        plot(handles.ax1,Rrup,exp(lny(:,5))/100,'linewidth',1,'color',[1 1 0]),
        
        handles.ax1.XLim   = [1e0 1e2];
        handles.ax1.YLim   = [1e-2 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup (km)')
        
        handles.ax1.ColorOrderIndex=1;        
        
end