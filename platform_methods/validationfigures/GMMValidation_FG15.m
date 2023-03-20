function [handles]=GMMValidation_FG15(handles,filename)

switch filename
    %{M,Rrup,Zhyp,Vs30,SOF,arc,regtype}
    case 'FG15_1.png'
        T    = -5; %Arias Intensity
        Rrup1=logsp(40,300,100)';
        Rrup2=logsp(20,250,100)';
        on = ones(100,1);
        Zhyp=30*on;
        arc = 'other';
        regtype = 'Nonlinear'   ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,1100 ,'interface',arc,regtype);  plot(handles.ax1,Rrup1,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,300  ,'interface',arc,regtype);  plot(handles.ax1,Rrup1,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,1100 ,'interface',arc,regtype);  plot(handles.ax1,Rrup1,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,300  ,'interface',arc,regtype);  plot(handles.ax1,Rrup1,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,1100 ,'interface',arc,regtype);  plot(handles.ax1,Rrup2,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,300  ,'interface',arc,regtype);  plot(handles.ax1,Rrup2,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,1100 ,'interface',arc,regtype);  plot(handles.ax1,Rrup2,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,300  ,'interface',arc,regtype);  plot(handles.ax1,Rrup2,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[5 500],'ylim',[1e-3 1e3]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'AI (m/s)')
        
    case 'FG15_2.png'
        T    = -4; %Arias Intensity
        Rrup1=logsp(40,300,100)';
        Rrup2=logsp(20,250,100)';
        on = ones(100,1);
        Zhyp=30*on;
        arc = 'other';
        regtype = 'Nonlinear'   ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,1100,'interface',arc,regtype); plot(handles.ax1,Rrup1,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,300 ,'interface',arc,regtype); plot(handles.ax1,Rrup1,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,1100,'interface',arc,regtype); plot(handles.ax1,Rrup1,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=9*on; lny = FG15(T,M,Rrup1,Zhyp,300 ,'interface',arc,regtype); plot(handles.ax1,Rrup1,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,1100,'interface',arc,regtype); plot(handles.ax1,Rrup2,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Nonlinear'   ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,300 ,'interface',arc,regtype); plot(handles.ax1,Rrup2,exp(lny)/100,'r-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,1100,'interface',arc,regtype); plot(handles.ax1,Rrup2,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        regtype = 'Linear'      ; M=7*on; lny = FG15(T,M,Rrup2,Zhyp,300 ,'interface',arc,regtype); plot(handles.ax1,Rrup2,exp(lny)/100,'b-','linewidth',1,'tag','curves');
        
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[5 500],'ylim',[1e-1 1e3]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (m/s)')
        
end