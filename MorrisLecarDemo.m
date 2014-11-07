%  ------------------------------------------------------------------------
%                  Morris-Lecar model
%  ------------------------------------------------------------------------


%  add paths to required functions

addpath('../fdaM')
addpath('SSE')
addpath('id')
addpath('logtrans')
addpath('logstate_lik')
addpath('findif')
addpath('Symbolic_ODE')

add_collocinfer_paths_local

% Values for p:
% p(1) I:    applied Current
% p(2) C:    membrane capacitance
% p(3) g_L:  lead through membrane channel
% p(4) g_Ca: Ca++ conductance trough membrane channel
% p(5) g_K:  K+ conductances through membrane channel
% p(6) V_L:  equilibrium potential of Leak ion channel
% p(7) V_Ca: equilibrium potential of Ca++ ion channel
% p(8) V_K:  equilibrium potential of K ion channel
% p(9) V_1:  tuning parameter
% p(10)V_2:  tuning parameter
% p(11)V_3:  tuning parameter
% p(12)V_4:  tuning parameter
% p(13)phi:  This is a constant?
   

MLPars = [ 150; %I:
          20; %C: 
          2;  %g_L: 
         4.4; %g_Ca: 
          8;  %g_K: 
         -60; %V_L: 
         120; %V_Ca: 
         -84; %V_K: 
        -1.2; %V_1: 
          18; %V_2:
           2; %V_3:
          30; %V_4:
        0.04];% phi
    
% Values for x:
% x(0) V: membrane potential
% x(1) N: recovery variable, the probability that the K+ channel is
% conducting
    
y0 = [-35,    0.0149];

MLTime = 0:1000;

MLParsNames = ['V'; 'N'];

% Which parameters to be active?

active = [1:13];     

% We'll choose a value of lambda.? 

lambda =   1.*ones(2,1);  
% lambda = 200.*ones(2,1);  

% We need some basis functions

rg      = [0,max(MLTime)];
knots   = rg(1):1.0:rg(2); %  200 intervals
nbasis  = length(knots)+2; %  order four
MLBasis = create_bspline_basis(rg,nbasis,4,knots);

%  check the values of the right hand side

more = [];

ML = make_ODE_Morris_Lecar();

%  approximate the solution to the equation

[odetrajt, odetrajy] = ode45(ML.fn, MLTime, y0, [], MLPars, more);

plot(odetrajt, odetrajy)

rng(1);
MLData = odetrajy + [ones(size(odetrajy,1),1),ones(size(odetrajy,1),1)].*randn(size(odetrajy,1),size(odetrajy,2));

plot(odetrajy(:,1),odetrajy(:,2))
pause;

%  smooth the trajectories and display results

DEfd = smooth_basis(MLTime, MLData, ...
                    fdPar(MLBasis,int2Lfd(2),1e-6));
           
plotfit_fd(odetrajy, MLTime, DEfd)


%  extract coefficients to give starting values
                
coefs0 = getcoef(DEfd);

%  set up the lik and proc objects for LS fitting

lambda = 1e4;

[lik, proc] = LS_setup(@ML.fn, MLTime, coefs0, MLBasis, ...
                       lambda, [],[], MLData, [], [], ...
                       [], 0, 0,[],[]);

                   
global INNEROPT_COEFS0

%  initialize the inner optimization with the coefficients produced by
%  the FitMatchOpt optimization

INNEROPT_COEFS0 = coefs0; 

% Now, with parameters fixed, we'll estimate coefficients. 

[f, grad] = SplineCoefs(coefs0, MLTime, MLData, MLPars, lik, proc);

grad = reshape(grad,nbasis,2); 
subplot(1,1,1)
for i=1:2
%     subplot(5,1,i)
    plot(grad(:,i))
    pause
end

%  call to inneropt

control_in = optimset('LargeScale', 'off', 'GradObj',     'on', ...
                      'Hessian',    'off', 'Diagnostics', 'off', ...
                      'Display',    'iter','MaxIter',     2000);

tic;
coefs1 = inneropt(MLTime, MLData, MLPars, lik, proc, ...
                  [], control_in);
toc


ML_ProfileLS = Profile_LS(ML,MLTime,MLData,coefs1,...
                            MLPars,MLBasis,lambda);

