function [param,mdl,implot] = dDISPgetparam(handles,im) %#ok<*INUSD,*DEFNU>

ch=get(handles.panel2,'children');
ch2=ch(handles.edit);
val=vertcat(ch2.Value);
str=cell(length(ch2),1);
for i=1:length(ch2)
    str{i}=ch2(i).String;
    if val(i)~=0 && size(str{i},1)>1
        str{i}=str{i}{val(i)};
    end
end

methods = pshatoolbox_methods(5);
methods = methods(vertcat(methods.isregular));

val     = handles.Dpop.Value;
label   = methods(val).label;
on      = ones(size(im));
ky      = str2double(handles.ky.String)*on;
Ts      = str2double(handles.Ts.String)*on;
mdl     = [];

% ------------------------- STANDARD MODELS -------------------------------
switch label
    case 'BMT 2017 Sa(M)'
        Sa    = im;
        implot= str2double(str{1});
        mag   = str2double(str{2})*on;
        param = {ky,Ts,Sa,mag};
    case 'MC 2022F (V-M)'
        implot= str2double(str{1});
        Sa    = im;
        PGV   = str2double(str{2})*on;
        mag   = str2double(str{3})*on;
        param = {ky,Ts,Sa,PGV,mag};
    case 'MC 2022S (V-M)'
        implot= str2double(str{1});
        Sa    = im;
        PGV   = str2double(str{2})*on;
        mag   = str2double(str{3})*on;
        param = {ky,Ts,Sa,PGV,mag};
        
        % crustal (bray et al)
    case 'BT 2007 Sa'
        Sa    = im;
        implot= str2double(str{1});
        param = {ky,Ts,Sa};
    case 'BT 2007 Sa(M)'
        Sa    = im;
        implot= str2double(str{1});
        mag   = str2double(str{2})*on;
        param = {ky,Ts,Sa,mag};
    case 'BM 2019 NonNF (M)'
        Sa    = im;
        implot= str2double(str{1});
        mag   = str2double(str{2})*on;
        param = {ky,Ts,Sa,mag};
        
        % crustal (bray et al)
    case 'Jibson  2007 (M)'
        PGA   = im;
        implot= str2double(str{1});
        mag   = str2double(str{2})*on;
        param = {ky,Ts,PGA,mag};
    case 'Jibson  2007 Ia'
        Ia    = im;
        implot= str2double(str{1});
        param = {ky,Ts,Ia};
    case 'RA 2011'
        implot= str2double(str{1});
        kmax  = im;
        kvmax = str2double(str{2})*on;
        param = {ky,Ts,kmax,kvmax};
    case 'RS 2009 (Scalar-M)'
        PGA   = im;
        implot= str2double(str{1});
        mag   = str2double(str{2})*on;
        param = {ky,Ts,PGA,mag};
    case 'RS 2009 (Vector)'
        PGA    = im;
        implot = str2double(str{1});
        PGV    = str2double(str{2})*on;
        param  = {ky,Ts,PGA,PGV};
    case 'AM 1988'
        PGA      = im;
        implot   = str2double(str{1});
        param    = {ky,Ts,PGA};
end

% ------------------------- MACHINE LEARNING BASED MODELS -----------------
switch label
    case {'PLSR Interface(M)','PLSR Intraslab(M)'}
        Sa       = im;
        implot   = str2double(str{1});
        mag      = str2double(str{2})*on;
        fpath    = fileparts(which(methods(val).job));
        jb       = fullfile(fpath,methods(val).job);
        mdl      = py.joblib.load(jb);
        param    = {ky,Ts,Sa,mag};
        
    case 'ML testing Sa(M)'
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job));
        jb       = fullfile(fpath,methods(val).job);
        mdl      = py.joblib.load(jb);
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'Ridge Interface(M)','Ridge Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job));
        jb       = fullfile(fpath,methods(val).job);
        mdl      = py.joblib.load(jb);
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'SVR Interface(M)','SVR Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job{1}));
        jb1      = fullfile(fpath,methods(val).job{1});
        jb2      = fullfile(fpath,methods(val).job{2});
        jb3      = fullfile(fpath,methods(val).job{3});
        mdl      = {py.joblib.load(jb1),py.joblib.load(jb2),py.joblib.load(jb3)};
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'RF Interface(M)','RF Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job));
        jb       = fullfile(fpath,methods(val).job);
        mdl      = py.joblib.load(jb);
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'GBDT Interface(M)','GBDT Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job));
        jb       = fullfile(fpath,methods(val).job);
        mdl      = py.xgboost.Booster(); mdl.load_model(jb);
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'ANN Interface(M)','ANN Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job{1}));
        jb1      = fullfile(fpath,methods(val).job{1});
        jb2      = fullfile(fpath,methods(val).job{2});
        
        md = py.ann.ResNet(int64(5),int64(1));
        md.load_state_dict(py.torch.load(jb2,py.torch.device('cpu')));
        md.eval();
        
        mdl      = {py.joblib.load(jb1),md};
        param    = {ky, Ts, Sa, PGV,M};
        
    case {'PCR Interface(M)','PCR Intraslab(M)'}
        Sa       = im;
        PGV      = str2double(str{2})*on;
        M        = str2double(str{3})*on;
        implot   = str2double(str{1});
        fpath    = fileparts(which(methods(val).job{1}));
        jb1      = fullfile(fpath,methods(val).job{1});
        jb2      = fullfile(fpath,methods(val).job{2});
        jb3      = fullfile(fpath,methods(val).job{3});
        mdl      = {py.joblib.load(jb1),py.joblib.load(jb2),py.joblib.load(jb3)};
        param    = {ky, Ts, Sa, PGV,M};
        
end
