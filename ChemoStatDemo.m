%  ------------------------------------------------------------------------
%                  ChemoStat model, based on R file ChemoEx2.r
%  ------------------------------------------------------------------------

%  This version uses LSsetup to do the analysis, and should be regarded
%  as the current working version as of today,  March 8, 2014  (Jim)

%  add paths to required functions

addpath('../fdaM')
addpath('fhn')
addpath('SSE')
addpath('id')
addpath('logtrans')
addpath('logstate_lik')
addpath('findif')
addpath('ChemoStat')

% The Chemostat equations represent a four-species Chemostat plus the  
% resource of Nitrogen. There are two species of Algae with varying
% defenses against Rotifers. The Rotifers themselves are divided into two 
% class -- breeding and senescent, although these two are very tightly 
% coupled.
%
% A full description of these equations can be found in the user manual. 
% The five state variables for the equations are
% 
% 1  N  - nitrogen content in the Chemostat
% 2  C1 - Algal type 1
% 3  C2 - Algal type 2 
% 4  B  - Breeding Rotifers
% 5  S  - Senescent Rotifers
%
% Notable is that only the sums C1+C2 and B+S can be observed.  
% Further, an unknown fraction of each is counted at each time. This  
% requires us to set up a model for the observation process along with the  
% ODE.
%
% The equations are:
%
% f1 = p6*(p5 - y1) - p12*y2*y1/(p10 + y1) - p12*y3*y1/(p11 + y1);
% f2 = y2*{p9*p12*y1/(p10 + y1) - p3*p13*(y4 + y5)/[p15 + Qs(Q)] - p6};
% f3 = y3*{p9*p12*y1/(p11 + y1) - p4*p13*(y4 + y5)/[p15 + Qs(Q)] - p6};
% f4 = y4*{p14*p13*Q/[p15 + Qs(Q)] - (p6 + p7 + p8)};
% f5 = p8*y4 - (p6 + p7)*y5;
%
% where the exponential barrier function is
%
%      Q_s(Q) = Q/(a2 + exp(-a1*(Q - Qstar)))
%
% The system has 16 parameters, also described in the user manual. 

%  The parameters, in the order in which the appear in parameter vector p
%  and with the initial estimates are:
%
%   i  name   initial  description
%  -----------------------------------------------------
%   1  a1     100      constant in exponential barrier (not estimated)
%   2  a2       1      constant in exponential barrier (not estimated)
%
%   3  p1     0.05     proportion of Chlorella clone 1
%   4  p2     0.95     proportion of Chlorella clone 2
%   5  NI     160      constant Nitrogen input
%   6  delta  0.3      growth/decay rate for N
%   7  m      0.055    extra decay rate beyond delta for Rotifers
%   8  lambda 0.4      extra decay rate specific to breeding Rotifers
%   9  XC     0.002025 growth rate for Chlorella per unit nitrogen
%  10  KC1    4.4      M-M constant for C_1
%  11  KC2    2.2      M-M constant for C_2
%  12  rho    270      decay of nitrogen per unit of Chlorella
%  13  G      0.011    growth rate for Rotifers due to breeding
%  14  XB     170      growth rate for breeding Rotifers per unit Chlorella
%  15  KB     0.15     M-M constant for breeding Rotifers
%  16  Qstar  0.15

%  Here "M-M" stands for a Michaelis-Menton constant usual in ecology
%  models.
%  The two constants a1 and a2 define the exponential barrier on the total
%  Chlorella concentration Q of Q_s(Q) = Q/(a2 + exp(-a1*(Q - Qstar)))
%
%  There is therefore only 14 parameters that are potentially estimable
%  in the model, but a1 and a2 are added for possible manipulation of the
%  barrier function.

%  if this .mat file is set up, go to line 172

%load ChemoStatDemoSetup

% First we load up some data

load ChemoData.txt

% The first two of these parameters give the fractions of Algae and 
% Rotifers that are counted. The remaining parameters are all positive and  
% using their logged values is helpful. 

%  ------------------------------------------------------------------------
%          This run is identical to that of the R file except
%              that the derivatives are also coded and used.
%  ------------------------------------------------------------------------

ChemoTime = 0:100;

ChemoPars = [1.000e+02 1.000e+00 5.000e-02 1.000e+00 1.600e+02 ...
             3.000e-01 5.500e-02 4.000e-01 2.025e-03 4.400e+00 ...
             2.200e+00 2.700e+02 1.100e-02 1.700e+02 1.500e-01 ...
             1.500e-01];
         
ChemoParNames = ['a1    '; ...    
                 'a2    '; ...    
                 'p1    '; ...    
                 'p2    '; ...    
                 'NI    '; ... 
                 'delta '; ...         
                 'm     '; ...
                 'lambda'; ...
                 'XC    '; ...   
                 'KC1   '; ...    
                 'KC2   '; ...    
                 'rho   '; ...      
                 'G     '; ...   
                 'XB    '; ...    
                 'KB    '; ... 
                 'Qstar '];

ChemoVarNames = ['N '; 'C1'; 'C2'; 'B '; 'S '];

% Parameters 'p1' and 'p2' represent relative palatability of the two algal
% clones, as such only one can be estimated and we fix p2 = 0. 

% logpars = [ChemoPars(1:2),log(ChemoPars(3:16))];

% Changed to match R code
logpars = log(ChemoPars);

ChemoLogData = log(ChemoData);

active = [1:2,5,7:16];     

% We'll choose a fairly large value of lambda. 

lambda = 200.*ones(5,1);  

% We need some basis functions

rng        = [0,100];
knots      = rng(1):0.5:rng(2); 
nbasis     = length(knots)+2;
ChemoBasis = create_bspline_basis(rng,nbasis,4,knots);

%  define observation vector at time 0

y0 = log([2, 0.1, 0.4, 0.2, 0.1]);

%  check the values of the right hand side

more = [];

fnval = chemo_fun1(ChemoTime, y0', logpars, more);

disp(['Right side = ', num2str(fnval')])

%  approximate the solution to the equation

[odetrajt, odetrajy] = ode45(@chemo_fun1, ChemoTime, y0, [], logpars, more);

plot(odetrajt, odetrajy)

%  smooth the trajectories and display results

DEfd = smooth_basis(ChemoTime, odetrajy, ...
                    fdPar(ChemoBasis,int2Lfd(2),1e-6));
           
plotfit_fd(odetrajy, ChemoTime, DEfd)

%  plot the trajectors on the raw data scale

DEmat = exp(eval_fd(ChemoTime, DEfd));

plot(ChemoTime, DEmat, '-')

%  extract coefficients to give starting values
                
coefs0 = getcoef(DEfd);

%  set up the lik and proc objects for LS fitting

lambda = 1e4;

ChemoMeas = @(t,x,p,more) [log(exp(x(:,2)) + exp(x(:,3))) + p(1), log(exp(x(:,4)) + exp(x(:,5))) + p(2)]

[lik, proc] = LS_setup(@chemo_fun, ChemoTime, coefs0, ChemoBasis, ...
                       lambda, [],[], ChemoData, [], [], ...
                       [], 0, 1,[],ChemoMeas);

%  The starting coefficient matrix for the inner optimizations must be
%  declared global and then defined at this point.  This is required
%  because inner optimizations should be started with the coefficients
%  as optimized on the last inner optimization, and this one of a few
%  techniques for achieving this.  The R package has even more trouble with
%  this in the sense of needing to write the optimized coefficients to a 
%  file after each inner optimization, and then retrieving prior to a new
%  optimization.  The Matlab strategy used here does all this in memory,
%  which is considerably faster.

global INNEROPT_COEFS0

%  initialize the inner optimization with the coefficients produced by
%  the FitMatchOpt optimization

INNEROPT_COEFS0 = coefs0; 

% Now, with parameters fixed, we'll estimate coefficients. 

[f, grad] = SplineCoefs(coefs0, ChemoTime, ChemoLogData, logpars, lik, proc);

grad = reshape(grad,nbasis,5); 
subplot(1,1,1)
for i=1:5
%     subplot(5,1,i)
    plot(grad(:,i))
    pause
end

%  call to inneropt

control_in = optimset('LargeScale', 'off', 'GradObj', 'on', ...
                      'Hessian', 'off', 'Diagnostics', 'off', ...
                      'Display', 'iter');

tic;
coefs1 = inneropt(ChemoTime, ChemoLogData, logpars, lik, proc, ...
                  [], control_in);
toc

% We'll for the trajectory and also the appropriate sum of exponentiated
% states to compare to the data. 

traj    = lik.bvals*coefs1;
obstraj = lik.more.more.fn(ChemoTime,exp(traj),logpars,lik.more.more.more);

% Plot these against the data

subplot(2,1,1)
plot(ChemoTime, obstraj(:,1), '-', ChemoTime, ChemoData(:,1), 'bo' )
ylabel('Chlamy')
xlabel('')
subplot(2,1,2)
plot(ChemoTime, obstraj(:,2), '-', ChemoTime, ChemoData(:,2), 'bo' )
ylabel('Brachionus')
xlabel('days')

% Now we can continue with the outer optimization


control_in = optimset('LargeScale', 'on', 'GradObj', 'on', ...
                      'Hessian', 'off', 'Diagnostics', 'on', ...
                      'Display', 'iter', ...
                      'MaxIter', 400);


control_out = optimset('LargeScale', 'off', 'GradObj', 'off', ...
                      'Hessian', 'off', 'Diagnostics', 'on', ...
                      'MaxIter', 0, ...
                      'Display', 'iter');

tic;
[pars_opt, coesfs2, value, gradient] = ...
         outeropt(ChemoTime, ChemoData, coefs1, logpars, ...
                  lik, proc, active, ...
                  [], control_in, [], control_out);
toc

% We'll extract the resulting parameters and coefficients. 

npars = res2.pars;
coefs2 = reshape(res2.coefs,size(C));

% And obtain an estimated trajectory and the exponentiated sum to comprare
% to the data. 

traj  = lik.bvals*C;
ptraj = lik.more.more.fn(ChemoTime,exp(traj),npars,lik.more.more.more);

% Lets have a look at how much we changed our parameters on the original 
% scale. 

new.pars = npars;
new.pars(3:16) = exp(new.pars(3:16));

disp(ChemoPars)
disp(new.pars)
disp(new.pars/ChemoPars)

% Now we can produce a set of diagnostic plots. 

% Firstly, a representation of the trajectory compared to the data. 

subplot(2,1,1)
plot(ChemoTime,ptraj(:,1))
ylabel('Chlamy')
xlabel('')
points(ChemoTime,ChemoData(:,1))
subplot(2,1,2)
plot(ChemoTime,ptraj(:,2))
ylabel('Brachionus')
xlabel('days')
points(ChemoTime,ChemoData(:,2))


% Now we'll plot both the derivative of the trajectory and the value of the
% differential equation right hand side at each point. This represents the 
% fit to the model. 

traj2  = proc.bvals.bvals*C;
dtraj2 = proc.bvals.dbvals*C;

ftraj2 = proc.more.fn(proc2.more.qpts,traj2,npars,proc.more.more);


for i = 1:5
  subplot(5,1,i)  
  plot(mids,dtraj2(:,i))
  xlabel('')
  ylabel(ChemoVarnames(i))
  lines(mids,ftraj2(:,i))
end
legend('Smooth','Model','location','NorthWest')

% Solving the differential equation from the estiamted initial condition
% of the trajectory allows us to compare the qualitative behavior of 
% our estimate to that of the differential equation. 

y0 = traj(1,:);
odetraj = ode45(@chemo.ode,y0,ChemoTime,[],npars);


subplot(2,1,1)
plot(ChemoTime,traj)
ylabel('')
title('Reconstructed Trajectories')
legend(ChemoVarnames,'location','NorthEast')
subplot(2,1,2)
plot(ChemoTime,odetraj(:,2:6))
ylabel('')
title('ODE Solution')

% We can also compare the pattern of observations predicted by the 
% differential equation and that estimated by our methods. 

otraj = lik.more.more.fn(ChemoTime,exp(odetraj(:,2:6)),npars, ...
                         lik.more.more.more);

subplot(2,1,1)
plot(ChemoTime,ptraj)
xlabel('days')
ylabel('')
title('Predicted Observations -- Smooth')
plot(ChemoTime,ChemoData,'.')
legend(['Algae','Rotifers'],'location','NorthEast')
subplot(2,1,2)
plot(ChemoTime,otraj)
xlabel('days')
ylabel('')
title('Predicted Observations -- ODE')
legend(['Algae','Rotifers'],'location','NorthEast')

