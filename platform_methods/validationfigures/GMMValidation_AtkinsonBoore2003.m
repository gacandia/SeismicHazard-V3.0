function [handles]=GMMValidation_AtkinsonBoore2003(handles,filename)

switch filename
    case 'AtkinsonBoore2003_1.png'
        Rrup  = logsp(20,400,40)';
        on    = ones(size(Rrup));
        Zhyp  = 20*ones(40,1);
        
        M=5.5*on; lny1 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','interface','general');
        M=6.5*on; lny2 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','interface','general');
        M=7.5*on; lny3 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','interface','general');
        M=8.5*on; lny4 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','interface','general');
        
        plot(handles.ax1,Rrup,exp(lny1)*980.66,'--','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny2)*980.66,'--','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny3)*980.66,'--','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny4)*980.66,'--','linewidth',1),
        
        handles.ax1.ColorOrderIndex=1;
        M=5.5*on; lny1 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','interface','general');
        M=6.5*on; lny2 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','interface','general');
        M=7.5*on; lny3 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','interface','general');
        M=8.5*on; lny4 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','interface','general');
        
        displayname = {...
            'Interface M=5.5 NEHRP B'...
            'Interface M=6.5 NEHRP B'...
            'Interface M=7.5 NEHRP B'...
            'Interface M=8.5 NEHRP B'...
            'Interface M=5.5 NEHRP D'...
            'Interface M=6.5 NEHRP D'...
            'Interface M=7.5 NEHRP D'...
            'Interface M=8.5 NEHRP D'...            
            };
        
        plot(handles.ax1,Rrup,exp(lny1)*980.66,'-','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny2)*980.66,'-','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny3)*980.66,'-','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny4)*980.66,'-','linewidth',1),
        
        
        
        
        handles.ax1.XLim   = [20 400];
        handles.ax1.YLim   = [1 1000];
        handles.ax1.XTick  = [20 30 100 200 300];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup(km)')
        ylabel(handles.ax1,'PGA (cm/s2)')
        
    case 'AtkinsonBoore2003_2.png'
        Rrup  = logsp(40,400,40)';
        on    = ones(size(Rrup));
        Zhyp  = 50*ones(40,1);
        
        M=5.5*on; lny1 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','intraslab','general');
        M=6.5*on; lny2 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','intraslab','general');
        M=7.5*on; lny3 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpb','intraslab','general');
        
        plot(handles.ax1,Rrup,exp(lny1)*980.66,'--','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny2)*980.66,'--','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny3)*980.66,'--','linewidth',1),
        
        handles.ax1.ColorOrderIndex=1;
        M=5.5*on; lny1 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','intraslab','general');
        M=6.5*on; lny2 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','intraslab','general');
        M=7.5*on; lny3 = AtkinsonBoore2003(0.01,M,Rrup,Zhyp,'nehrpd','intraslab','general');
        
        displayname = {...
            'Intraslab M=5.5 NEHRP B'...
            'Intraslab M=6.5 NEHRP B'...
            'Intraslab M=7.5 NEHRP B'...
            'Intraslab M=5.5 NEHRP D'...
            'Intraslab M=6.5 NEHRP D'...
            'Intraslab M=7.5 NEHRP D'...
        };        
        
        plot(handles.ax1,Rrup,exp(lny1)*980.66,'-','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny2)*980.66,'-','linewidth',1),
        plot(handles.ax1,Rrup,exp(lny3)*980.66,'-','linewidth',1),
        
        handles.ax1.XLim   = [20 400];
        handles.ax1.YLim   = [1 1000];
        handles.ax1.XTick  = [20 30 100 200 300];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'Rrup(km)')
        ylabel(handles.ax1,'PGA (cm/s2)')
end


%% RE-ASSIGNS DISPLAYNAME
ch =findall(handles.ax1,'type','line');
if exist('displayname','var')
    displayname = fliplr(displayname);
    for i=1:numel(ch)
        ch(i).DisplayName=displayname{i};
    end
end