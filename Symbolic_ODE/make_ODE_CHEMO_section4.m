function [odeproblem,CHEMO] = make_ODE_CHEMO_section4(exp_param,log_state)
%% make_ODE_CHEMO_section4 Makes the ODE for ChemoStat problem given in  section 4 of CollocInfer Manual
%
addpath('../logtrans');
% Create symbolic variables
syms t;
p = sym('p%d_%d',[1,9]);
x = sym('x%d_%d',[1,3]);
% RMParnames = c(’p’,’r1’,’r2’,’Kc1’,’Kc2’,’G’,’chiB’,’KB’,’delta’)
% VARNAMES = c('C1','C2','B')

syms Q Qs;

V1 = p(8) + p(1)*x(1) + x(2);

V2 = (1 - (x(1)/p(4)) - (x(2)/p(5)));


% Create a function that describes the ODE using symbolic variables like 
% Chemo example below.

% X(3) is different between R and Matlab, rounding error? -3.6e-8 vs
% -1.8e-8

f = [ (p(2)*x(1).*V2 - p(1)*p(6)*x(1).*x(3)./V1);
    (p(3)*x(2).*V2 - p(6)*x(2).*x(3)./V1);
    ( p(7)*p(6)*x(3).*( p(1)*x(1) + x(2) )./V1  - p(9)*x(3) )];


odeproblem = ODE(f,t,x,p);

% Set the ode to use exp(p) in functions; 
if exp_param == 1
    odeproblem.SetExponentialParameter();
end

% Set the ode to use log(x) in functions; 
if log_state == 1
    odeproblem.SetLogState();
end

% Compute the derivatives needed for collocinfer
odeproblem.computeDerivatives();
%odeproblem.displayResult();
% Get function handles for ODE, what collocinfer is expecting
CHEMO = odeproblem.make();

odeproblem.plot([0,200],log([50,50,2]),log([0.2 ,0.025 ,0.125 ,2.2e4 ,1e5, 5e6 ,1 ,1e9 ,0.3]),[]);
end
