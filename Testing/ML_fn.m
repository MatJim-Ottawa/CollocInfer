function out1 = ML_fn(t,x,p,more)
%FN
%    OUT1 = FN(p(1),p(2),p(3),p(4),p(5),p(6),p(7),p(8),p(9),p(10),p(11),p(12),p(13),x(:,1),x(:,2))

%    This function was generated by the Symbolic Math Toolbox version 5.11.
%    15-Apr-2014 00:12:11

t2 = 1.0./p(12);
t3 = p(11)-x(:,1);
out1 = [(p(1)+p(3).*(p(6)-x(:,1))-p(4).*(tanh((p(9)-x(:,1))./p(10)).*(1.0./2.0)-1.0./2.0).*(p(7)-x(:,1))+p(5).*x(:,2).*(p(8)-x(:,1)))./p(2);-p(13).*cosh(t2.*t3.*(1.0./2.0)).*(x(:,2)+tanh(t2.*t3).*(1.0./2.0)-1.0./2.0)]';
