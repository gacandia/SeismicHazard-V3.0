function [handles]=GMMValidation_BU17(handles,filename)

switch filename
    
    case 'BU17_1.png'
        T    = -4; %CAV
        Rrup = logsp(5,200,100);
        on   = ones(1,100);
        Zhyp = 15*on;
        M=6.69*on; mechanism = 'reverse'; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[5 200],'ylim',[10 1e4]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
        
    case 'BU17_2.png'
        T    = -4; %CAV
        Rrup = logsp(5,200,100);
        on   = ones(1,100);
        Zhyp = 15*on;
        M=6.93*on; mechanism = 'reverse'; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[5 200],'ylim',[10 1e4]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
        
    case 'BU17_3.png'
        T    = -4; %CAV
        Rrup = logsp(5,200,100);
        on   = ones(1,100);
        Zhyp = 15*on;
        M=7.62*on; mechanism = 'reverse'; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[5 200],'ylim',[10 1e4]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
        
    case 'BU17_4.png'
        T    = -4; %CAV
        Rrup = logsp(10,300,100);
        on   = ones(1,100);
        Zhyp = 30*on;
        mechanism = 'subduction-interface'; M=9*on; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[10 300],'ylim',[100 1e5]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
        
    case 'BU17_5.png'
        T    = -4; %CAV
        Rrup = logsp(10,300,100);
        on   = ones(1,100);
        Zhyp = 146*on;
        mechanism = 'subduction-intraslab'; M=6.2*on; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[50 300],'ylim',[10 1e3]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
        
    case 'BU17_6.png'
        T    = -4; %CAV
        Rrup = logsp(10,300,100);
        on   = ones(1,100);
        Zhyp = 30*on;
        mechanism = 'subduction-interface'; M=5.7*on; [lny,sig1] = BU17(T,M,Rrup,Zhyp,mechanism,'CAV');
        plot(handles.ax1,Rrup,exp(lny+[-sig1;0;sig1]),'k-','tag','curves');
        set(handles.ax1,'xscale','log','yscale','log','box','on','xlim',[10 300],'ylim',[1 1e3]);
        xlabel(handles.ax1,'Rrup (km)')
        ylabel(handles.ax1,'CAV (cm/s)')
end