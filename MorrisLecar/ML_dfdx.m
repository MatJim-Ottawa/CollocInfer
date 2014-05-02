function dfdxval = ML_dfdx(t,x,p,more)
%  x-derivative of right side function for Morris Lecar differential equation
%  To be called by CollocInfer functions




M_SS = 0.5 * (1 + tanh( (r(:,1)-p(9))/p(10) ) );
d_M_SS_dV = 0.5 * ( 1 - tanh( ( r(:,1) - p(9))  / p(10) ).^2)./p(10);

N_SS = 0.5 * (1 + tanh( (r(:,1)-p(11))/p(12) ) );
d_N_SS_dV = 0.5 * ( 1 - tanh( ( r(:,1) - p(11))  / p(12) ).^2)./p(12);

T_N = 1 / (cosh( (r(:,1)-p(11))/(2*p(12))) );




r = zeros(length(t),2,2);
r(:,1,1) =  -p(3) - p(5) * x(:,2) - p(4)*( M_SS + (x(:,1) - p(7)).*d_M_SS_dV);
r(:,1,2) = (  p(5)*( p(8) - x(:,1) ) )/p(2);
r(:,2,1) =  p(13) * ( sinh( (x(:,1)-p(11))/(2*p(12))) * ( 1 / (2*p(12))) * ( N_SS - x(:,2)) + (1 ./ T_N) * d_N_SS_dV )  ;
r(:,2,2) = 1./T_N;



dfdxval = r;

end

