%  ------------------------------------------------------------------------
%                  ChemoStat model, CollocInfer Manual Section 4 (Feb 25,
%                  2014 Edition)
%  ------------------------------------------------------------------------

% % Store Current Folder so that it can be reset at the end of this script.
% clear;
% currentFolder = pwd;
% 
% % CollocInfer Path 
% 
% % This should be changed to local Settings!! :
% cd('E:/CollocInfer/')
% 
% 
% 
% addpath('../fdaM')
% addpath('fhn')
% addpath('SSE')
% addpath('id')
% addpath('logtrans')
% addpath('logstate_lik')
% addpath('genlin')
% addpath('findif')
% addpath('loggenlin')
% addpath('ChemoStat') % Needed?

%Should add all needed paths
add_collocinfer_paths_local;
cd('E:/CollocInfer/')
data = dlmread('../DATA/ChemoExampleData.csv');
ChemoData = data;


ChemoTime = [0:200];

% VARNAMES = c('C1','C2','B')
%Initial State values
x0 = [50,50,2];

%RMParnames = c(’p’,’r1’,’r2’,’Kc1’,’Kc2’,’G’,’chiB’,’KB’,’delta’)
%Initial Parameter values
RMpars = [0.2 ,0.025 ,0.125 ,2.2e4 ,1e5, 5e6 ,1 ,1e9 ,0.3];

% Range for time
rng = [0,max(ChemoTime)];

% Will use Symbolic ODE to generate data and function handles for problem.

% [ODE,LOG_CHEMO] = make_ODE_CHEMO_section4(1,1);

% CHEMO contains function handles for problem

% Data will contain data with noise(indept normal) w/ sigma = 0.10 ,seeded
% number
% [T,ChemoData] = ODE.generateData(ChemoTime,log(x0),log(RMpars),[],0.10,1001);



knots      = rng(1):1:rng(2); 
nbasis     = length(knots)+2;
ChemoBasis = create_bspline_basis(rng,nbasis,4,knots);

DEfd = smooth_basis(ChemoTime, ChemoData, fdPar(ChemoBasis,int2Lfd(2),10));
   
% Get initial coefs after smoothing
coefs0 = getcoef(DEfd);

[ODE,CHEMO] = make_ODE_CHEMO_section4(1,0);

lambda = 1e5;
[lik, proc] = LS_setup(CHEMO, ChemoTime, coefs0, ChemoBasis, ...
                       lambda, [],[], ChemoData, [], [], ...
                       [], 0, 1);
                   
                   

res1 = ParsMatchOpt(log(RMpars), coefs0, proc);


res3 = outeropt(ChemoTime,ChemoData,coefs0,res1,lik,proc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ChemoData2 = [log(exp(ChemoData(:,1)) + exp(ChemoData(:,2))),ChemoData(:,3)];

% Define likefn
RMobsfn = @(t,x,p,more) [log(exp(x(:,1)) +exp(x(:,2))),x(:,3)];

[lik2, proc2] = LS_setup(CHEMO, ChemoTime, coefs0, ChemoBasis, ...
                       lambda, [],[], ChemoData2, [], [], ...
                       [], 0, 1, [],RMobsfn);
            
coef02 = coefs0;
coef02(:,1:2) = 0;

res1R = dlmread('../DATA/res1pars.csv');
Fres3R = dlmread('../DATA/Fres3pars.csv');


% Look at FitMatchOpt?
Fres3 = FitMatchOpt(coef02, [1:2], res1R', proc2);

res32 = outeropt(ChemoTime,ChemoData2,Fres3R,res1R',lik2,proc2);

%CollocInferPlots(coefs0,log(RMpars),lik,proc,ChemoTime,ChemoData2)

% exp(res32)
% 
% ans =
% 
%   Columns 1 through 5
% 
%          0.198115034205939        0.0246683264054978         0.122626625094734          551792849.793551          1743.86577780405
% 
%   Columns 6 through 9
% 
%           4880819.71134693          1.01067630939406          1002091950.44141         0.301493706115853


format long g;

% cd(currentFolder);