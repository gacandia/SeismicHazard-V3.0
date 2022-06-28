function varargout = CPT_explorer(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @CPT_explorer_OpeningFcn, ...
    'gui_OutputFcn',  @CPT_explorer_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    warning off
    gui_mainfcn(gui_State, varargin{:});
    warning on
end

function CPT_explorer_OpeningFcn(hObject, eventdata, handles, varargin)
SS=get(0,'screensize');
handles.figure1.Position(1:2)=(SS(3:4)-handles.figure1.Position(3:4))/2;
handles.ax = findall(handles.figure1,'type','axes');
[handles.reg1,handles.reg2]=getSBTn;

if nargin==4
    handles.param = varargin{1};
    Ncpt          = numel(handles.param);
    handles.logpop.String=compose('Site %g',1:Ncpt);
    for i=1:Ncpt
        wt = handles.param(i).wt;
        Df = handles.param(i).Df;
        handles.cpt(i) = interpretCPT_4(handles.param(i).Data,wt,Df);
    end
    plotCPSfile(handles)
    ch=handles.uibuttongroup1.Children;
    set(ch,'Enable','on');
    handles.logpop.Enable='on';
    handles.M.Enable='on';
    handles.PGA.Enable='on';
else
    ch=handles.uibuttongroup1.Children;
    set(ch,'Enable','off');
    handles.logpop.Enable='off';
    handles.M.Enable='off';
    handles.PGA.Enable='off';
    
end
guidata(hObject, handles);

function varargout = CPT_explorer_OutputFcn(hObject, eventdata, handles) %#ok<*INUSD>
varargout{1} = [];

function logpop_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
plotCPSfile(handles)

function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles) %#ok<*INUSL>
plotCPSfile(handles)

function M_Callback(hObject, eventdata, handles)
plotCPSfile(handles)

function PGA_Callback(hObject, eventdata, handles)
plotCPSfile(handles)

function File_Callback(hObject, eventdata, handles)

function Undock_Axes_Callback(hObject, eventdata, handles)

fig=figure(1001);
fig.Position=[271   320   795   304];
ax(1)=subplot(1,5,1);
ax(2)=subplot(1,5,2);
ax(3)=subplot(1,5,3);
ax(4)=subplot(1,5,4);
ax(5)=subplot(1,5,5);
set(ax,'ydir','reverse')
for ii=1:5
    str = sprintf('ax%g',ii);
    axi = handles.(str);
    ax(ii).XLim   = axi.XLim;
    ax(ii).YLim   = axi.YLim;
    ax(ii).YTick  = axi.YTick;
    ax(ii).XLabel = axi.XLabel;
    ax(ii).YLabel = axi.YLabel;
    ax(ii).Title  = axi.Title;
    
    ch = findall(axi,'type','patch');
    for i=1:length(ch)
        copyobj(ch(i),ax(ii))
    end
    
    ch = findall(axi,'type','line');
    for i=1:length(ch)
        copyobj(ch(i),ax(ii))
    end
    ax(ii).Layer='top';
    
    
end

function ImportCPT_Callback(hObject, eventdata, handles)

[filename, pathname, filterindex] = uigetfile({'*.xls';'*.txt';'*.*'}, 'Pick a CPT file');
if filterindex==0
    return
end
fname = fullfile(pathname,filename); %File path
if contains(fname,'.txt')
    handles.radiobutton1.Value=1;
    handles.uibuttongroup1.SelectedObject.String='Basic plots';
    handles.param = loadsiteLIBS(fname,[]);
    wt = handles.param.wt;
    Df = handles.param.Df;
    handles.cpt = interpretCPT_4(handles.param.Data,wt,Df);
    plotCPSfile(handles)
    ch=handles.uibuttongroup1.Children;
    set(ch,'Enable','on');
    handles.logpop.Enable='on';
    handles.M.Enable='on';
    handles.PGA.Enable='on';
    handles.radiobutton1.String  ='Basic plots';
    handles.radiobutton2.String  ='Normalized plots';
    handles.radiobutton3.String  ='Liquefaction Plots (BI16)';
    handles.radiobutton10.String ='Liquefaction Plots (R15)';
    handles.radiobutton4.String  ='SBT';
    handles.radiobutton9.String  ='SBTn';
    handles.radiobutton9.Visible ='on';
    
    handles.M.Enable='on';
    handles.PGA.Enable='on';
    
else
    handles.radiobutton1.Value=1;
    handles.uibuttongroup1.SelectedObject.String = 'CPT measurements';
    ch=handles.uibuttongroup1.Children;

    % import ground water table file
    fname_gwt = strrep(fname,'.XLS','.gwt');
    wt = dlmread(fname_gwt);    
    
    % read and process CPT data
    handles.cpt = interpretCPT_5(filename,wt);
    
    %% ************* MODIFIED BY LINA ************* Include Dissipation and shear wave velocity
    
    % **** NOTE THE NAME OF THE FILES ARE MANUALLY INSERTED
    
% % % % % % %     % read and process dissipation data
% % % % % % %     name_File_Dissipation   = 'DissNWUCPTu01'; % Name file 
% % % % % % %     handles.dissipation     = interpretDissipation(name_File_Dissipation,handles.cpt);
% % % % % % %     
% % % % % % %     % read and process shear wave data 
% % % % % % %     nameFileVs              = 'Vs_NWU';   % Name file
% % % % % % %     handles.dissipation     = interpret_shearwave(nameFileVs,handles.cpt);
% % % % % % %     %%
% % % % % % %     set(ch,'Enable','on');
% % % % % % %     handles.radiobutton1.String  ='CPT measurements';
% % % % % % %     handles.radiobutton2.String  ='Normalized Parameters';
% % % % % % %     handles.radiobutton3.String  ='Soil Strength';
% % % % % % %     handles.radiobutton10.String ='CPT Strength PM';
% % % % % % %     handles.radiobutton4.String  ='Charts';
% % % % % % %     handles.radiobutton9.String  ='';
% % % % % % %     handles.radiobutton9.Visible ='off';
% % % % % % %     handles.M.Enable='off';
% % % % % % %     handles.PGA.Enable='off';

end
plotCPSfile(handles)
guidata(hObject,handles)
