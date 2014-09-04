function fnval = ML_fun(t,x,p,more)
%  Right side function for Morris Lecar differential equation
%  x%  To be called by CollocInfer functions

n = size(x,2);
if n == 1, x = x'; end
r = x;

M_SS = 0.5 * (1 + tanh( (r(:,1)-p(9))/p(10) ) );
N_SS = 0.5 * (1 + tanh( (r(:,1)-p(11))/p(12) ) );
T_N = 1 / (cosh( (r(:,1)-p(11))/(2*p(12))) );

r(:,1) = (  p(1) - p(3)*(r(:,1) - p(6)) - p(4)*M_SS.*(r(:,1) - p(7)) - p(5)*r(:,2).*(r(:,1) - p(8))  )/p(2);
r(:,2) =  p(13)*( N_SS - r(:,2))./T_N;

fnval = r;
if n == 1, fnval = fnval'; end

end

