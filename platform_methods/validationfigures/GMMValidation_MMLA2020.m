function [handles]=GMMValidation_MMLA2020(handles,filename)

switch filename
    case 'MMLA2020_1.png'
%         M     = 8.5;
%         VS30  = 450;
%         PGA   = logsp(1e-2,1e0,20);
%         lny   = zeros(5,20);
%         for i=1:20
%             lny(1,i)=MMLA2020(-5,M,[],'interface','global',VS30,@gmm_dummy,PGA(i));
%             lny(2,i)=MMLA2020(-5,M,[],'interface','japan',VS30,@gmm_dummy,PGA(i));
%             lny(3,i)=MMLA2020(-5,M,[],'interface','taiwan',VS30,@gmm_dummy,PGA(i));
%             lny(4,i)=MMLA2020(-5,M,[],'interface','south-america',VS30,@gmm_dummy,PGA(i));
%             lny(5,i)=MMLA2020(-5,M,[],'interface','new-zeeland',VS30,@gmm_dummy,PGA(i));
%         end
%         
%         plot(handles.ax1,PGA,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e-2 1e0];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'PGA(g)')
        
    case 'MMLA2020_2.png'
%         M     = 8.0;
%         VS30  = 450;
%         PGA   = logsp(1e-2,1e0,20);
%         lny   = zeros(5,20);
%         for i=1:20
%             lny(1,i)=MMLA2020(-5,M,[],'intraslab','global',VS30,@gmm_dummy,PGA(i));
%             lny(2,i)=MMLA2020(-5,M,[],'intraslab','japan',VS30,@gmm_dummy,PGA(i));
%             lny(3,i)=MMLA2020(-5,M,[],'intraslab','taiwan',VS30,@gmm_dummy,PGA(i));
%             lny(4,i)=MMLA2020(-5,M,[],'intraslab','south-america',VS30,@gmm_dummy,PGA(i));
%             lny(5,i)=MMLA2020(-5,M,[],'intraslab','new-zeeland',VS30,@gmm_dummy,PGA(i));
%         end
%         
%         plot(handles.ax1,PGA,exp(lny)/100,'linewidth',1),handles.ax1.ColorOrderIndex=1;
        handles.ax1.XLim   = [1e-2 1e0];
        handles.ax1.YLim   = [1e-3 1e2];
        handles.ax1.XScale = 'log';
        handles.ax1.YScale = 'log';
        xlabel(handles.ax1,'PGA(g)')
        
end