function fnval = chemo_fun(times, y, p, more)
%  Note:  This version replaces 100 in the R code 
%  by Qsfactor in the definition of Qs.
%  Probably this value should be smaller since exp will blow up otherwise
Qsfactor = 10;
p = exp(p);
% y = exp(y);
nt    = length(times);
if nt == 1,  y = y(:)';  end
fnval = zeros(nt,5);
Q  = p(3).*y(:,2) + p(4).*y(:,3);
Qs = Q.*exp(Qsfactor.*(Q - p(16)))./(1 + exp(Qsfactor.*(Q - p(16)))) + ...
     p(16)./ (1 + exp(Qsfactor.*(Q - p(16))));
fnval(:,1) = p(6).*(p(5) - y(:,1)) - p(12).*y(:,2).*y(:,1)./ ...
    (p(10) + y(:,1)) - p(12).*y(:,3).*y(:,1)./(p(11) + y(:,1));
fnval(:,2) = y(:,2).*(p(9).*p(12).*y(:,1)./ ...
    (p(10) + y(:,1)) - p(3).*p(13).*...
    (y(:,4) + y(:,5))./(p(15) + Qs) - p(6));
fnval(:,3) = y(:,3).*(p(9).*p(12).*y(:,1)./ ...
    (p(11) + y(:,1)) - p(4).*p(13).*(y(:,4) + y(:,5))./ ...
    (p(15) + Qs) - p(6));
fnval(:,4) = y(:,4).*(p(14).*p(13).*Q./ ...
    (p(15) + Qs) - (p(6) + p(7) + p(8)));
fnval(:,5) = p(8).*y(:,4) - (p(6) + p(7)).*y(:,5);
% fnval = fnval./y;
if nt == 1, fnval = fnval(:);
end

