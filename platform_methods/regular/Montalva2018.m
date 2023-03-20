function [lny,sigma,tau,phi]=Montalva2018(To,M,Rrup,Rhyp,Zhyp,VS30,Tn,mechanism,adjfun)

% Syntax : Montalva2018 mechanism                                           
isadmisible = imag(To)==0 && To>=0 && To<=10;

if ~isadmisible
    lny   = [];
    sigma = [];
    tau   = [];
    phi   = [];
    return
end
To      = max(To,0.01); %PGA is associated to To=0.01;
period  = [0.01,0.02,0.05,0.075,0.1,0.2,0.25,0.4,0.5,0.6,0.75,1,1.5,2,2.5,3,4,5,6,7.5,10];
T_lo    = max(period(period<=To));
T_hi    = min(period(period>=To));
index   = find(abs((period - T_lo)) < 1e-6); % Identify the period

switch mechanism
    case 'interface', R=Rrup; fevent=0;
    case 'intraslab', R=Rhyp; fevent=1;
end

f0 = 1/Tn;

if isnan(f0) || Tn==0 || Tn==-1 
    fpeak=0;
else
    fpeak=1;
end

Arock=exp(gmpe1(1,M,R,Zhyp,1000,f0,fevent,fpeak));
% Arock=[];

if T_lo==T_hi
    [lny,sigma,tau] = gmpe2(index,M,R,Zhyp,VS30,f0,fevent,fpeak,Arock);
    phi = sqrt(sigma.^2-tau.^2);
else
    [lny_lo,sigma_lo,tau_lo] = gmpe2(index,  M,R,Zhyp,VS30,f0,fevent,fpeak,Arock);
    [lny_hi,sigma_hi,tau_hi] = gmpe2(index+1,M,R,Zhyp,VS30,f0,fevent,fpeak,Arock);
    x          = log([T_lo;T_hi]);
    Y_sa       = [lny_lo,lny_hi]';
    Y_sigma    = [sigma_lo,sigma_hi]';
    Y_tau      = [tau_lo,tau_hi]';
    lny        = interp1(x,Y_sa,log(To))';
    sigma      = interp1(x,Y_sigma,log(To))';
    tau        = interp1(x,Y_tau,log(To))';
    phi        = sqrt(sigma.^2-tau.^2);
end

% unit convertion
% lny  = lny+log(units);

% modifier
if exist('adjfun','var')
    SF  = feval(adjfun,To); 
    lny = lny+log(SF);
end

% FROM FONDEF pdf document
function[lny,sigma,tau]=gmpe1(index,M,R,Zhyp,VS30,f0,fevent,fpeak,Arock) %#ok<*DEFNU>

%Coeficientes
Coef = [9.5796	1.694	-2.0552	-0.6719	0.0481	-0.0029	0.0086	4.3234	-0.1836	1.5342	-0.2227	0.0681	0.5496	0.3762	0.3205	0.7392
    7.2827	0.4879	-1.6088	-0.4773	0.2456	-0.0042	0.0114	3.1605	-0.181	-0.2027	-0.2572	0.063	0.5679	0.387	0.3189	0.7576
    2.3273	2.2898	-0.5017	-1.0245	-0.1336	-0.0115	0.0086	6.2085	-0.1462	0.784	0.0553	0.0301	0.6166	0.3355	0.3289	0.7752
    2.7371	3.4236	-0.5182	-1.2203	-0.3276	-0.0118	0.0061	7.4944	0.0153	2.0237	-0.0005	-0.0104	0.6663	0.3511	0.3328	0.8234
    12.3513	6.2946	-2.3478	-1.3019	-0.7962	-0.0067	0.0033	8.1111	0.0092	6.89	0.0542	0.0095	0.6543	0.387	0.3318	0.8294
    12.0135	3.0978	-2.3538	-0.6445	-0.1895	-0.0031	0.0039	4.5146	0.0012	3.4707	-0.4038	0.0493	0.6146	0.4375	0.3353	0.8255
    5.8869	2.2804	-1.1626	-0.7092	-0.0846	-0.0065	0.0004	4.6583	-0.1023	1.5693	-0.4341	0.042	0.5437	0.4618	0.3381	0.7894
    7.7585	2.6098	-1.6313	-0.6409	-0.1235	-0.0029	0.0008	3.8693	-0.3932	2.3911	-0.0972	0.023	0.5208	0.5546	0.356	0.8399
    11.0256	3.4167	-2.3273	-0.673	-0.2398	0.0001	-0.0006	3.915	-0.6166	3.964	0.0253	0.0321	0.4659	0.4692	0.3629	0.7542
    14.3245	4.0743	-3.0383	-0.8353	-0.3266	0.003	0.0018	4.56	-0.8733	5.2928	0.3383	0.0236	0.405	0.3975	0.3765	0.681
    13.0566	3.9789	-2.8202	-0.8006	-0.2936	0.0018	0.0017	4.2968	-1.0607	4.7228	0.5661	0.0133	0.4103	0.3553	0.3646	0.6538
    10.1588	3.5206	-2.3521	-0.8777	-0.2049	0.0015	0.0003	4.6197	-1.0904	3.7595	0.673	-0.0363	0.5375	0.3942	0.365	0.76
    6.575	4.2188	-1.648	-1.1342	-0.3511	-0.0013	0.0018	5.9613	-1.0085	3.9026	0.666	-0.0634	0.5609	0.4161	0.3592	0.7853
    12.4348	7.6973	-2.8442	-1.5506	-0.9359	0.0017	0.001	8.1448	-0.5326	8.7793	0.4262	-0.0917	0.5679	0.3963	0.3474	0.7748
    16.4865	7.1936	-3.7101	-1.4618	-0.7409	0.0072	-0.0037	7.8425	-0.2571	8.3016	0.2749	-0.0806	0.5607	0.3782	0.3526	0.7628
    19.2618	7.6039	-4.3416	-1.1854	-0.7872	0.0098	-0.0035	6.4895	-0.0947	9.4182	0.0654	-0.0708	0.5248	0.3995	0.3446	0.7442
    14.9964	6.1593	-3.6399	-0.5839	-0.5437	0.007	-0.0035	3.4696	-0.1265	7.3303	0.25	-0.0515	0.4933	0.3141	0.3246	0.6689
    18.7614	7.4247	-4.4797	-0.6542	-0.7506	0.0101	-0.0019	3.8682	-0.2322	9.5312	0.3209	-0.0268	0.4927	0.3454	0.2872	0.6667
    20.7315	7.9061	-4.9686	-0.9894	-0.8281	0.0117	-0.0005	5.7567	-0.3653	10.8509	0.2682	0.0409	0.4767	0.2928	0.277	0.6243
    18.6702	7.832	-4.6018	-1.0741	-0.8287	0.0097	-0.0036	6.2898	-0.3176	10.6605	0.1471	0.1168	0.4563	0.3596	0.2881	0.6484
    16.4001	8.1968	-4.3047	-1.2249	-0.9383	0.0089	-0.005	7.1431	-0.323	11.5219	0.3459	0.0484	0.4987	0.249	0.2785	0.6231];


a1     = Coef(index,1);
a2     = Coef(index,2);
a4     = Coef(index,3);
a5     = Coef(index,4);
a6     = Coef(index,5);
a8     = Coef(index,6);
a9     = Coef(index,7);
a10    = Coef(index,8);
a11    = Coef(index,9);
a12    = Coef(index,10);
a13    = Coef(index,11);
a14    = Coef(index,12);
tau    = Coef(index,13);
sigma  = Coef(index,16);

C1   = 7.4;
C2   = 20;
C3   = 0.95;
Vlin = 725;
flin = 5.5;
c    = 4.0;
n1   = 1.8;
n2   = 3.0;


% source term
ind         = M>=C1;
Ffuente     = a2*(M-C1);
Ffuente(ind)= a12*(M(ind)-C1);

% Path Term
Ftrayectoria = (a4+a5*fevent+a6*(M-C1)).*log(R+C2*exp(C3*(M-5)))+a8*R;

% Event term
Zh      = min(Zhyp,120);
Fevento = (a10+a9*(Zh-60))*fevent;

% Site term
VS  = min(1000, VS30); % (equation (8))
f0S = min(6.0,f0);
if VS30 < Vlin
    Fsitio = a11*log(VS/Vlin)+a14*fpeak*log(f0S/flin)-a13*log(Arock+c)+a13*(log(Arock+c*((VS/Vlin)^n1+fpeak*(f0S/flin)^n2)));
else
    Fsitio = a11*log(VS/Vlin)+a14*fpeak*log(f0S/flin)+a13*(n1*log(VS/Vlin)+n2*fpeak*log(f0S/flin));
end


lny = a1 + Ffuente + Ftrayectoria + Fevento + Fsitio;

% from personal communications with G.M
function[lny,sigma,tau]=gmpe2(index,M,R,Zhyp,VS30,f0,fevent,fpeak,Arock)

Mh    = 7.4;
C2    = 0.95;
C1    = 20;
c     = 4;
n1    = 1.8;
n2    = 3.0;
Vlin  = 725 ;
flin  = 5.5;

%Coeficientes
Coef = [8.479877405	1.371818949	1.165673199	-1.873817519	-0.792427701	0.093409514	-0.002760123	4.942094406	0.006279205	-0.229915577	0.074061442	-0.268133777
    9.308316192	1.236698861	1.182675611	-2.047164345	-0.844337542	0.123617293	-0.002011402	5.171914225	0.005952462	-0.251940511	0.067650766	-0.282305806
    13.55979444	2.275752448	3.092496861	-2.817028911	-0.79536282	-0.052301765	-0.000619363	5.132601647	0.005534776	-0.109284725	0.054948135	-0.183310911
    12.97543981	1.356169784	2.016513798	-2.680929487	-0.533859965	0.109030871	-0.000475227	3.715459626	0.009396449	0.007738242	0.040240859	-0.330480592
    14.38070351	1.771734208	2.678460269	-2.919308774	-0.580430942	0.038391185	1.42e-05	3.975922963	0.008336648	-0.029437147	0.055639443	-0.272294583
    10.46020856	1.087981373	1.082337269	-2.08635442	-0.514653539	0.14749505	-0.002595041	3.494169527	0.006429205	-0.068872802	0.070017491	-0.521903594
    5.799770854	1.004451472	0.221381003	-1.186107249	-0.686519553	0.139878107	-0.005052135	4.41469983	0.003617522	-0.160902774	0.052190141	-0.498578498
    6.622870032	1.356973121	0.992581623	-1.435654616	-0.592166093	0.08334285	-0.002494077	3.472799789	0.001369514	-0.411501393	0.048304677	-0.334984397
    9.865622225	2.506248786	3.012104638	-2.145031764	-0.698263608	-0.096199089	0.000561765	3.965902117	-0.000234272	-0.632384832	0.026477257	-0.097700377
    11.77591464	2.911334915	3.751254922	-2.575404571	-0.944192542	-0.14081831	0.002475475	5.05014739	0.002501751	-0.870833067	0.025220423	0.222070601
    11.7487965	3.38160084	3.99301174	-2.592634151	-0.949683773	-0.2035646	0.001769076	5.002450642	0.00262793	-1.104883972	0.020370667	0.489667046
    8.643654952	2.799252085	2.755733795	-2.064859986	-0.894551149	-0.091137126	0.000895342	4.624114194	0.001397511	-1.106411767	-0.032035978	0.619839614
    7.047258699	2.552728647	2.337274897	-1.798576891	-0.898468168	-0.05055116	0.000687332	4.694427416	0.000502296	-1.016717719	-0.04647277	0.531207605
    10.68467411	5.128889991	5.958269525	-2.580927468	-1.238720785	-0.495676614	0.002345904	6.432189176	0.002762409	-0.571538492	-0.078242036	0.292226843
    10.27054203	3.537921538	3.838706121	-2.602328394	-0.970935453	-0.160417611	0.004554716	4.958308479	0.003983787	-0.343361367	-0.085006054	0.16926198
    14.60898269	4.478183908	5.840689216	-3.529601276	-1.087315942	-0.29956126	0.007756433	5.687633311	0.002547202	-0.197908726	-0.085497046	-0.113409595
    10.94813226	3.258692307	3.904514058	-2.907218919	-0.434928605	-0.086195317	0.004632457	2.442287751	0.000689276	-0.191328987	-0.058344921	0.0430079
    13.42211521	4.314394435	5.634252676	-3.50216177	-0.585851403	-0.260301024	0.006737872	3.337680393	0.001692638	-0.253542769	-0.12119169	0.25495211
    14.62633242	4.805049059	6.699272747	-3.818052047	-0.463677964	-0.34542691	0.007710896	2.718386158	0.001097474	-0.382025116	-0.066781392	0.292539214
    10.00796541	3.050810396	3.872421233	-2.958223017	-0.043366174	-0.025161714	0.005244362	0.686616365	-0.000264264	-0.274705699	-0.029532774	0.234285617
    15.30323751	5.829663433	8.439450893	-4.064835519	-0.502822583	-0.523766792	0.008155669	3.15493394	0.000884633	-0.365567101	0.030710682	0.300736109];

Error=[0.563670682	0.403988354	0.285218143	0.74985373
    0.584325686	0.413327487	0.282899586	0.76961568
    0.639253506	0.376371803	0.291609566	0.797080246
    0.683965399	0.39822641	0.299802102	0.846329865
    0.697863534	0.420946886	0.289373012	0.864839022
    0.630701508	0.45429212	0.315045112	0.838700867
    0.547313239	0.463498561	0.320555257	0.785581549
    0.529546347	0.558010625	0.342488595	0.842076973
    0.493216817	0.465658287	0.330223968	0.754419206
    0.493696616	0.403960714	0.364745913	0.734819834
    0.531059889	0.368185701	0.345041885	0.732556632
    0.540872647	0.405826911	0.367612192	0.769660591
    0.566912824	0.41864469	0.350833683	0.787234272
    0.577829174	0.401651471	0.331831137	0.778024654
    0.588974589	0.383622795	0.319857242	0.77224748
    0.554557983	0.42635955	0.313974392	0.766744378
    0.537366458	0.369745974	0.303806337	0.719564511
    0.506255292	0.319124411	0.247391399	0.647562595
    0.562158089	0.262426224	0.263926483	0.674200585
    0.582553881	0.239647272	0.279561888	0.689169565
    0.525641785	0.253592758	0.235159466	0.62921264
    ];

sigma  =Error(index,4);
tau    =Error(index,1);
a1     =Coef(index,1);
a2     =Coef(index,2);
a3     =Coef(index,3);
a4     =Coef(index,4);
a5     =Coef(index,5);
a6     =Coef(index,6);
a7     =Coef(index,7);
a8     =Coef(index,8);
a9     =Coef(index,9);
a10    =Coef(index,10);
a11    =Coef(index,11);
a12    =Coef(index,12);

% source term
Fsource = (a2*(M<=Mh)+a3*(M>Mh)).*(M-Mh);

% path term
exprFp1 = M - Mh;
exprFp2 = fevent;
exprFp3 = a4 + a5*exprFp2 + a6*exprFp1;

exprFp4 = M - 5;
exprFp5 = exp(C2*exprFp4);
exprFp6 = R + C1*exprFp5;
exprFp7 = log(exprFp6);

exprFp8 = R;
Fpath = exprFp3.*exprFp7 + a7*exprFp8;

% event term 
Fevent = (a8 +a9*(min(Zhyp, 120)-60))*fevent;

% site term
Vsref = min(VS30,1000);
f0ref = max(0.1,min(f0,6));

%Arock
Fsite = a10*log(1000/Vlin) +  a12*( n1 * log(1000/Vlin)+ n2*fpeak*log(f0/flin))+ a11*fpeak*log(f0ref/flin);
Arock = exp(a1 + Fsource + Fevent + Fpath + Fsite);

if VS30<=Vlin
    Si1  = log(Vsref/Vlin);
    Si12 = fpeak*log(f0ref/flin);
    Si2  = log(Arock+c);
    Si3  = log(Arock+c*((Vsref/Vlin)^n1 + (f0ref/flin)^n2)); %
    Si6  = Si3 - Si2 ;
    FSite=a10*Si1 + a11*Si12 + a12*Si6;
else
    Si1  = log(Vsref/Vlin);
    Si12 = fpeak*log(f0ref/flin);
    Si7  = (n1*Si1 + n2*Si12);
    FSite=a10*Si1 + a11*Si12 + a12*Si7;
end

%% Value %%
lny   = a1 + Fsource + Fevent + Fpath + FSite;
sigma = sigma*M.^0;
tau   = tau*M.^0;
