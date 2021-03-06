function FhN = made_ODE_CSTR()
%% make_ODE_CSTR Replaces usual make process for CSTR
% Based on equations (3),(4) of Parameter Estimation for Differential
% Equations: A Generalized Smoothing Approach

% Create symbolic variables, size appropriately
syms t;
p = sym('p%d_%d',[1,4]);
x = sym('x%d_%d',[1,2]);

% x(1) = C
% x(2) = T

% p(1) = r
% p(2) = k
% p(3) = a
% p(4) = b


% Create a function that describes the ODE using symbolic variables like 
% CSTR below.

% Define System Parameters


% INPUTS:
% % Known functions of time.
% Declared here, define in seperate function .m file
syms C_in(t)
syms F_in(t)
syms T_in(t)
syms T_co(t)
syms F_co(t)

T_ref = 350;
% 
% % Function of F_CO
a_ = p(3)*((F_co(t))^(p(4)+1))./(F_co(t) + p(3).*((F_co(t))^p(4))/2)
% % Function of t and F_in
B_CC = p(2).*exp(-10e4.*p(1).*(1./x(2)-1/T_ref)) + F_in(t);
% % Function of F_CO and F_IN
B_TT = a_ + F_in(t);
% % Function of t and F_IN
B_TC = 130*B_CC;



f = [-B_CC.*x(1) + F_in(t).*C_in(t);
     -B_TT.*x(2) + B_TC.*x(1) +  F_in(t).*T_in(t) + a_.*T_co(t)];

% Create an instance of ODE  
odeproblem = ODE(f,t,x,p);

% Set the ode to use exp(p) in functions; 
% odeproblem.SetExponentialParameter();

% Compute the derivatives needed for collocinfer
odeproblem.computeDerivatives();
odeproblem.displayResult();


% Get function handles for ODE, what collocinfer is expecting
 FhN = odeproblem.make();

odeproblem.plot([0,65],[1.6,335],[0.833,0.461,1.678,0.5],[]);


end