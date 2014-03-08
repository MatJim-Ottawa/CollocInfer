function dfdxval = SIR_dfdx(t,x,p,more)
%  x-derivative of right side function for SIR differential equation
%  To be called by CollocInfer functions
%  x(1) = S,    x(2) = I,     x(3) = R
%  p(1) = beta, p(2) = gamma, p(3) = mu
p = exp(p);
r = zeros(length(t),3,3);
r(:,1,1) = (-p(1).*x(:,2) - p(3));     
r(:,1,2) = (-p(1).*x(:,1));
r(:,2,1) = ( p(1).*x(:,2));
r(:,2,2) = ( p(1).*x(:,1) - (p(2)+p(3)));
r(:,3,2) = ( p(2));
r(:,3,3) = (-p(3));
dfdxval = r;

end

