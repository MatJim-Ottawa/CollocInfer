function ML = make_ODE_Morris_Lecar()
% Wikipedia Article for Morris-Lecar model : http://en.wikipedia.org/wiki/Morris%E2%80%93Lecar_model
% Video : http://video.mit.edu/watch/phase-plane-analysis-of-the-morris-lecar-model-6572/

% Create symbolic variables
syms t;

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
% p_ex = [0; %I:
%         20; %C: 
%         2;  %g_L: 
%         4.4; %g_Ca: 
%         8;  %g_K: 
%         -60; %V_L: 
%         120; %V_Ca: 
%         -84; %V_K: 
%         -1.2; %V_1: 
%         18; %V_2:
%         2; %V_3:
%         30; %V_4:
%         0.04];
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%% CODE FROM Morris_Lecar.m Figure 3

% 
% 
% 
% %dynamics
% 
% global C;
% global gbarCa;
% global ECa;
% global gbarK;
% global EK;
% global gleak;
% global Eleak;
% global v1;
% global v2;
% global v3;
% global v4;
% global phi;
% global tau;
% global Iapplied;
% 
% %assign parameter values
% C       = 20 ; %microfarad/cm^2 
% gbarCa  =4.4; % millisiemens/ cm^2 
% ECa     =120; %millivolts
% gbarK   =8;% millisiemens/ cm^2 
% EK      =-84; %millivolts
% gleak   =2;% millisiemens/ cm^2 
% Eleak   =-60;%millivolts
% v1      =-1.2; %millivolts
% v2      = 18 ; %millivolts
% v3      = 2 ; %millivolts
% v4      = 30; %millivolts
% phi     = 0.04 % per millisecond
% tau     =0.8
% 
% 
% %initial condition: subthreshold perturbation
% S0a=[-35    0.0149];
% 
% Iapplied=150
% 
% %locally define state variables:
% V=S(1);
% w=S(2);
% 
% %local functions:
% m_inf = (0.5*(1+tanh((V-v1)/v2)));
% w_inf = (0.5*(1+tanh((V-v3)/v4)));
% 
% ddt_V = (1/C)*(gbarCa*m_inf*(ECa-V) + gbarK*w*(EK-V) + gleak*(Eleak-V)+Iapplied);
% ddt_w = phi*(w_inf-w)/(tau);
% 
% dS=[ddt_V; ddt_w];
% 
% end
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% p_ex = [150; %I:
%         20; %C: 
%         2;  %g_L: 
%         4.4; %g_Ca: 
%         8;  %g_K: 
%         -60; %V_L: 
%         120; %V_Ca: 
%         -84; %V_K: 
%         -1.2; %V_1: 
%         18; %V_2:
%         2; %V_3:
%         30; %V_4:
%         0.04];    
%    
%     
%     
% x_ex = [-35,    0.0149];

p = sym('p%d_%d',[1,13]);

% Values for x:
% x(0) V: membrane potential
% x(1) N: recovery variable, the probability that the K+ channel is
% conducting

x = sym('x%d_%d',[1,2]);


M_SS = 0.5 * (1 + tanh( (x(1)-p(9))/p(10) ) );
N_SS = 0.5 * (1 + tanh( (x(1)-p(11))/p(12) ) );
T_N = 1 / (cosh( (x(1)-p(11))/(2*p(12))) );
%T_N = 0.8;

f = [(  p(1) - p(3)*(x(1) - p(6)) - p(4)*M_SS.*(x(1) - p(7)) - ...
        p(5)*x(2).*(x(1) - p(8))  )/p(2); ...
        p(13)*( N_SS - x(2))./T_N];
    

% Create an instance of ODE  
odeproblem = ODE(f,t,x,p);

% Set the ode to use exp(p) in functions; 
% odeproblem.SetExponentialParameter();

% Compute the derivatives needed for collocinfer
odeproblem.computeDerivatives();

% odeproblem.returnMatlabFunctions('testing');
% Get function handles for ODE, what collocinfer is expecting
ML = odeproblem.make();




% Debug code
%odeproblem.displayResult();
%odeproblem.plot([0,600],x_ex,p_ex,[]);


end