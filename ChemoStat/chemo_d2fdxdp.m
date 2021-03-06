function d2fdxdpval = chemo_d2fdxdp(times, y, p, more)

p  = exp(p);
np = length(p);

Qsfactor = 0;

p1  = p(1);
p2  = p(2);
p3  = p(3);
p4  = p(4);
p5  = p(5);
p6  = p(6);
p7  = p(7);
p8  = p(8);
p9  = p(9);
p10 = p(10);
p11 = p(11);
p12 = p(12);
p13 = p(13);
p14 = p(14);
p15 = p(15);
p16 = p(16);

% y = exp(y);

y1 = y(:,1);
y2 = y(:,2);
y3 = y(:,3);
y4 = y(:,4);
y5 = y(:,5);

[nt, ny] = size(y);

d2fdxdpval = zeros(nt,ny,ny,np);

% y2-p3

d2fdxdpval(:,2,2,3) = -(p13.*(y4 + y5).*(p15.^2 + 3.*p2.^2.*p15.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^3.*p15.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.^2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p3.^3.*y2.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p4.^2.*y3.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.^4.*y2.^4.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 2.*p2.*p3.*p15.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*p2.*p4.*p15.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p3.*p4.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.^2.*p3.*p15.*y2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p2.^2.*p4.*p15.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 5.*Qsfactor.*p2.*p3.^2.*p15.*y2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.*p4.^2.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 4.*Qsfactor.*p3.^2.*p4.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.^2.*p4.^2.*y2.^2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*p4.*y2.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.^3.*p15.*y2.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p1.^2.*p3.^3.*p4.*y2.^3.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p2.*p3.*p4.*p15.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.^2.*p4.*p15.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p13.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(p1.^2.*p3.^3.*p15.*y2.^3 + p4.*y3.*p1.^2.*p3.^2.*p15.*y2.^2 + 5.*Qsfactor.*p3.^2.*p15.*y2.^2 + 3.*p4.*y3.*Qsfactor.*p3.*p15.*y2 + p3.*p15.*y2 - 3.*p2.*p15.^2 - 2.*p4.*y3.*p15))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,2,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y3.*(y4 + y5).*(p1.^2.*p3.^3.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*y2.*y3.^2 + Qsfactor.*p3.^2.*y2.^2 - Qsfactor.*p4.^2.*y3.^2 + p3.*y2 - p4.*y3) - p4.*p13.*p15.*y3.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 3.*p2.*Qsfactor.*p3.*y2 + p2.*p4.*y3.*p1 + 2.*p2)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y3.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p4.*p13.*p15.*y3.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,4,2,3) =  (p13.*p14.*y4.*(p15.^2 + 3.*p2.^2.*p15.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^3.*p15.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p3.^3.*y2.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p4.^3.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.^4.*y2.^4.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 2.*p2.*p3.*p15.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p2.*p4.*p15.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.^2.*p3.*p15.*y2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^2.*p4.*p15.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 5.*Qsfactor.*p2.*p3.^2.*p15.*y2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p2.*p4.^2.*p15.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.*p4.^2.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.^2.*p4.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*p1.^2.*p3.^2.*p4.^2.*y2.^2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.^3.*p15.*y2.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.*p4.^3.*y2.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*p1.^2.*p3.^3.*p4.*y2.^3.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 6.*Qsfactor.*p2.*p3.*p4.*p15.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.*p4.^2.*p15.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p1.^2.*p2.*p3.^2.*p4.*p15.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p13.*p14.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p1.^2.*p3.^3.*p15.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*p15.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*p15.*y2.*y3.^2 + 5.*Qsfactor.*p3.^2.*p15.*y2.^2 + 6.*Qsfactor.*p3.*p4.*p15.*y2.*y3 + Qsfactor.*p4.^2.*p15.*y3.^2 + p3.*p15.*y2 - p4.*p15.*y3 - 3.*p2.*p15.^2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y3-p3

d2fdxdpval(:,2,3,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y2.*(y4 + y5).*(p1.^2.*p3.^3.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*y2.*y3.^2 + Qsfactor.*p3.^2.*y2.^2 - Qsfactor.*p4.^2.*y3.^2 + p3.*y2 - p4.*y3) - p4.*p13.*p15.*y2.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 3.*p2.*Qsfactor.*p3.*y2 + p2.*p4.*y3.*p1 + 2.*p2)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y2.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p4.*p13.*p15.*y2.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdxdpval(:,3,3,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y2.*(y4 + y5).*(p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3 - Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.^2.*y3.^2 - p3.*y2 + p4.*y3) - p4.*p13.*p15.*y2.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 3.*p2.*Qsfactor.*p4.*y3 + p2.*p3.*y2.*p1 + 2.*p2)) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y2.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + p4.*p13.*p15.*y2.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + Qsfactor.*p3.*y2 + 3.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,4,3,3) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*p14.*y2.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p4.*p13.*p14.*p15.*y2.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p4.*p13.*p14.*p15.*y2.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y4-p3

d2fdxdpval(:,2,4,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p13.*p15.*y2 + p4.*p13.*y2.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^2.*p13.*y2.^3) + p13.*p15.*y2.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p4.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
d2fdxdpval(:,3,4,3) =  (p4.*p13.*y3.*(y2./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*y2.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdxdpval(:,4,4,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p13.*p14.*y2.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p13.*p14.*p15.*y2) - p13.*p14.*p15.*y2.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y5-p3

d2fdxdpval(:,2,5,3) = (exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p13.*p15.*y2 + p4.*p13.*y2.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^2.*p13.*y2.^3) + p13.*p15.*y2.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p4.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
d2fdxdpval(:,3,5,3) = (p4.*p13.*y3.*(y2./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*y2.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;



% y2-p4

d2fdxdpval(:,2,2,4) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y3.*(y4 + y5).*(p1.^2.*p3.^3.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*y2.*y3.^2 + Qsfactor.*p3.^2.*y2.^2 - Qsfactor.*p4.^2.*y3.^2 + p3.*y2 - p4.*y3) - p3.*p13.*p15.*y3.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 3.*p2.*Qsfactor.*p3.*y2 + p2.*p4.*y3.*p1 + 2.*p2)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y3.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p3.*p13.*p15.*y3.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,2,4) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y3.*(y4 + y5).*(p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3 - Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.^2.*y3.^2 - p3.*y2 + p4.*y3) - p3.*p13.*p15.*y3.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 3.*p2.*Qsfactor.*p4.*y3 + p2.*p3.*y2.*p1 + 2.*p2)) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y3.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + p3.*p13.*p15.*y3.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + Qsfactor.*p3.*y2 + 3.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,4,2,4) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*p14.*y3.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p3.*p13.*p14.*p15.*y3.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p3.*p13.*p14.*p15.*y3.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y3-p4

d2fdxdpval(:,2,3,4) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y2.*(y4 + y5).*(p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3 - Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.^2.*y3.^2 - p3.*y2 + p4.*y3) - p3.*p13.*p15.*y2.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 3.*p2.*Qsfactor.*p4.*y3 + p2.*p3.*y2.*p1 + 2.*p2)) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y2.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + p3.*p13.*p15.*y2.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + Qsfactor.*p3.*y2 + 3.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,3,4) = -(p13.*(y4 + y5).*(p15.^2 + 3.*p2.^2.*p15.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^3.*p15.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.^2.*y2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p3.^2.*y2.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p4.^3.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p4.^4.*y3.^4.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*p2.*p3.*p15.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 2.*p2.*p4.*p15.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p3.*p4.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p2.^2.*p3.*p15.*y2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.^2.*p4.*p15.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 5.*Qsfactor.*p2.*p4.^2.*p15.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 4.*Qsfactor.*p3.*p4.^2.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.^2.*p4.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.^2.*p4.^2.*y2.^2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*p4.*y2.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p4.^3.*p15.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p1.^2.*p3.*p4.^3.*y2.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p2.*p3.*p4.*p15.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.*p4.^2.*p15.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p13.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(p1.^2.*p4.^3.*p15.*y3.^3 + p3.*y2.*p1.^2.*p4.^2.*p15.*y3.^2 + 5.*Qsfactor.*p4.^2.*p15.*y3.^2 + 3.*p3.*y2.*Qsfactor.*p4.*p15.*y3 + p4.*p15.*y3 - 3.*p2.*p15.^2 - 2.*p3.*y2.*p15))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,4,3,4) =  (p13.*p14.*y4.*(p15.^2 + 3.*p2.^2.*p15.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^3.*p15.^2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p3.^3.*y2.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p4.^3.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p4.^4.*y3.^4.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p2.*p3.*p15.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 2.*p2.*p4.*p15.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.^2.*p3.*p15.*y2.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.^2.*p4.*p15.*y3.*exp(3.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - Qsfactor.*p2.*p3.^2.*p15.*y2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 5.*Qsfactor.*p2.*p4.^2.*p15.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.*p4.^2.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 3.*Qsfactor.*p3.^2.*p4.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*p1.^2.*p3.^2.*p4.^2.*y2.^2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p4.^3.*p15.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*p1.^2.*p3.*p4.^3.*y2.*y3.^3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p3.^3.*p4.*y2.^3.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - 6.*Qsfactor.*p2.*p3.*p4.*p15.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*p1.^2.*p2.*p3.*p4.^2.*p15.*y2.*y3.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p1.^2.*p2.*p3.^2.*p4.*p15.*y2.^2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p13.*p14.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p1.^2.*p3.^2.*p4.*p15.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*p15.*y2.*y3.^2 + p1.^2.*p4.^3.*p15.*y3.^3 + Qsfactor.*p3.^2.*p15.*y2.^2 + 6.*Qsfactor.*p3.*p4.*p15.*y2.*y3 + 5.*Qsfactor.*p4.^2.*p15.*y3.^2 - p3.*p15.*y2 + p4.*p15.*y3 - 3.*p2.*p15.^2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y4-p4

d2fdxdpval(:,2,4,4) =  (p3.*p13.*y2.*(y3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*y3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdxdpval(:,3,4,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p13.*p15.*y3 + p3.*p13.*y3.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^2.*p13.*y3.^3) + p13.*p15.*y3.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
d2fdxdpval(:,4,4,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p13.*p14.*y3.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p13.*p14.*p15.*y3) - p13.*p14.*p15.*y3.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y5-p4

d2fdxdpval(:,2,5,4) = (p3.*p13.*y2.*(y3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*y3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdxdpval(:,3,5,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p13.*p15.*y3 + p3.*p13.*y3.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^2.*p13.*y3.^3) + p13.*p15.*y3.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;



% y1-p6

d2fdxdpval(:,1,1,6) = -1;

% y2-p6

d2fdxdpval(:,2,2,6) = -1;

% y3-p6

d2fdxdpval(:,3,3,6) = -1;

% y4-p6

d2fdxdpval(:,4,4,6) = -1;

% y5-p6

d2fdxdpval(:,5,5,6) = -1;



% y4-p7

d2fdxdpval(:,4,4,7) = -1;

% y5-p7

d2fdxdpval(:,5,5,7) = -1;



% y4-p8

d2fdxdpval(:,4,4,8) = -1;
d2fdxdpval(:,5,4,8) =  1;



% y1-p9

d2fdxdpval(:,2,1,9) = (p10.*p12.*y2)./(p10 + y1).^2;
d2fdxdpval(:,3,1,9) = (p11.*p12.*y3)./(p11 + y1).^2;

% y2-p9

d2fdxdpval(:,2,2,9) = (p12.*y1)./(p10 + y1);

% y3-p9

d2fdxdpval(:,3,3,9) = (p12.*y1)./(p11 + y1);



% y1-p10

d2fdxdpval(:,1,1,10) =  (p12.*y2.*(p10 - y1))./(p10 + y1).^3;
d2fdxdpval(:,2,1,10) = -(p9.*p12.*y2.*(p10 - y1))./(p10 + y1).^3;

% y2-p10

d2fdxdpval(:,1,2,10) =  (p12.*y1)./(p10 + y1).^2;
d2fdxdpval(:,2,2,10) = -(p9.*p12.*y1)./(p10 + y1).^2;



% y1-p11

d2fdxdpval(:,1,1,11) =  (p12.*y3.*(p11 - y1))./(p11 + y1).^3;
d2fdxdpval(:,3,1,11) = -(p9.*p12.*y3.*(p11 - y1))./(p11 + y1).^3;

% y3-p11

d2fdxdpval(:,1,3,11) =  (p12.*y1)./(p11 + y1).^2;
d2fdxdpval(:,3,3,11) = -(p9.*p12.*y1)./(p11 + y1).^2;



% y1-p12

d2fdxdpval(:,1,1,12) = -(p10.*y2)./(p10 + y1).^2 - (p11.*(y3.*p10.^2 + 2.*y3.*p10.*y1 + y3.*y1.^2))./((p10 + y1).^2.*(p11 + y1).^2);
d2fdxdpval(:,2,1,12) =  (p9.*p10.*y2)./(p10 + y1).^2; 
d2fdxdpval(:,3,1,12) =  (p9.*p11.*y3)./(p11 + y1).^2;

% y2-p12

d2fdxdpval(:,1,2,12) = -y1./(p10 + y1); 
d2fdxdpval(:,2,2,12) =  (p9.*y1)./(p10 + y1);

% y3-p12

d2fdxdpval(:,1,3,12) = -y1./(p11 + y1);
d2fdxdpval(:,3,3,12) = (p9.*y1)./(p11 + y1);



% y2-p13

d2fdxdpval(:,2,2,13) = -(p3.*p15.*(y4 + y5).*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*(y4 + y5).*(Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.*y3.*p3.*y2 - p4.*y3) - 2.*p2.*p3.*p15.*(y4 + y5)) + p2.*p3.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdxdpval(:,3,2,13) =  (p4.*y3.*(y4 + y5).*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdxdpval(:,4,2,13) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p14.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p3.*p14.*p15.*y4) - p3.*p14.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y3-p13

d2fdxdpval(:,2,3,13) =  (p3.*y2.*(y4 + y5).*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdxdpval(:,3,3,13) = -(p4.*p15.*(y4 + y5).*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*(y4 + y5).*(Qsfactor.*p4.^2.*y3.^2 + Qsfactor.*p3.*y2.*p4.*y3 - p3.*y2) - 2.*p2.*p4.*p15.*(y4 + y5)) + p2.*p3.*p4.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdxdpval(:,4,3,13) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p14.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p4.*p14.*p15.*y4) - p4.*p14.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y4-p13

d2fdxdpval(:,2,4,13) =  (p3.*y2)./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))));
d2fdxdpval(:,3,4,13) = -(p4.*y3)./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))));
d2fdxdpval(:,4,4,13) =  (p14.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))));

% y5-p13

d2fdxdpval(:,2,5,13) = -(p3.*y2)./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)))); 
d2fdxdpval(:,3,5,13) = -(p4.*y3)./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))));



% y2-p14

d2fdxdpval(:,4,2,14) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p3.*p13.*p15.*y4) - p3.*p13.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y3-p14

d2fdxdpval(:,4,3,14) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p4.*p13.*p15.*y4) - p4.*p13.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y4-p14

d2fdxdpval(:,4,4,14) = (p13.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))));



% y2-p15

d2fdxdpval(:,2,2,15) =  ((p3.*p13.*(y4 + y5).*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 + p2.*p4.*y3) - p2.*p3.*p13.*(y4 + y5).*(p3.*y2 - 2.*p2.*p15 - p4.*y3 + 2.*Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3))./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p3.*p13.*(y4 + y5).*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 + p2.*p4.*y3) - (p3.*p13.*(y4 + y5).*(p3.*y2 - 2.*p2.*p15 - p4.*y3 + 2.*Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3))./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p2.*p15 + p3.*y2 + p4.*y3 + p15./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,2,15) = -(2.*p4.*p13.*y3.*(y4 + y5).*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^3; 
d2fdxdpval(:,4,2,15) = -((p3.*p13.*p14.*y4.*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 - p2.*p4.*y3) - p2.*p3.*p13.*p14.*y4.*(2.*Qsfactor.*p3.^2.*y2.^2 + 4.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + 2.*Qsfactor.*p4.^2.*y3.^2 + p4.*y3 - 2.*p2.*p15))./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p3.*p13.*p14.*y4.*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 - p2.*p4.*y3) - (p3.*p13.*p14.*y4.*(2.*Qsfactor.*p3.^2.*y2.^2 + 4.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + 2.*Qsfactor.*p4.^2.*y3.^2 + p4.*y3 - 2.*p2.*p15))./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p2.*p15 + p3.*y2 + p4.*y3 + p15./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y3-p15

d2fdxdpval(:,2,3,15) = -(2.*p3.*p13.*y2.*(y4 + y5).*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^3;
d2fdxdpval(:,3,3,15) =  ((p4.*p13.*(y4 + y5).*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p3.*y2 - p2.*p4.*y3) - p2.*p4.*p13.*(y4 + y5).*(p4.*y3 - p3.*y2 - 2.*p2.*p15 + 2.*Qsfactor.*p4.^2.*y3.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3))./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p4.*p13.*(y4 + y5).*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p3.*y2 - p2.*p4.*y3) - (p4.*p13.*(y4 + y5).*(p4.*y3 - p3.*y2 - 2.*p2.*p15 + 2.*Qsfactor.*p4.^2.*y3.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3))./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p2.*p15 + p3.*y2 + p4.*y3 + p15./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdxdpval(:,4,3,15) = -((p4.*p13.*p14.*y4.*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 - p2.*p4.*y3) - p2.*p4.*p13.*p14.*y4.*(2.*Qsfactor.*p3.^2.*y2.^2 + 4.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + 2.*Qsfactor.*p4.^2.*y3.^2 + p4.*y3 - 2.*p2.*p15))./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p2.*p4.*p13.*p14.*y4.*(p2.^2.*p15 + p15./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p3.*y2 - p2.*p4.*y3) - (p4.*p13.*p14.*y4.*(2.*Qsfactor.*p3.^2.*y2.^2 + 4.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + 2.*Qsfactor.*p4.^2.*y3.^2 + p4.*y3 - 2.*p2.*p15))./exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p2.*p15 + p3.*y2 + p4.*y3 + p15./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y4-p15

d2fdxdpval(:,2,4,15) =  (p3.*p13.*y2)./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdxdpval(:,3,4,15) =  (p4.*p13.*y3)./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdxdpval(:,4,4,15) = -(p13.*p14.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;

% y5-p15

d2fdxdpval(:,2,5,15) = (p3.*p13.*y2)./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdxdpval(:,3,5,15) = (p4.*p13.*y3)./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;



% y2-p16

d2fdxdpval(:,2,2,16) = (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p3.*p13.*(y4 + y5).*(Qsfactor.*p3.^3.*y2.^3 + 2.*Qsfactor.*p3.^2.*p4.*y2.^2.*y3 + Qsfactor.*p3.*p4.^2.*y2.*y3.^2 - p3.*p4.*y2.*y3 - p4.^2.*y3.^2) - Qsfactor.*p3.*p13.*p15.*(y4 + y5).*(2.*p2.*p3.*y2 + p2.*p4.*y3 - Qsfactor.*p2.*p3.^2.*y2.^2 - Qsfactor.*p2.*p3.*p4.*y2.*y3)) - Qsfactor.*p3.*p13.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(2.*p3.*y2 + p4.*y3 + Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p3.*p4.*y2.*y3))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,2,16) = (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p3.*p4.*p13.*y3.*(y4 + y5).*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + Qsfactor.*p4.^2.*y3.^2 + p4.*y3) + Qsfactor.*p3.*p4.*p13.*p15.*y3.*(y4 + y5).*(Qsfactor.*p2.*p3.*y2 - p2 + Qsfactor.*p2.*p4.*y3)) - Qsfactor.*p3.*p4.*p13.*p15.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdxdpval(:,4,2,16) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p3.*p13.*p14.*y4.*(p3.*y2 + p4.*y3).*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) + Qsfactor.*p3.*p13.*p14.*p15.*y4.*(p3.*y2 + p4.*y3).*(Qsfactor.*p2.*p3.*y2 - 2.*p2 + Qsfactor.*p2.*p4.*y3)) - Qsfactor.*p3.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*y2 + p4.*y3).*(Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y3-p16

d2fdxdpval(:,2,3,16) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p3.*p4.*p13.*y2.*(y4 + y5).*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + p3.*y2 + Qsfactor.*p4.^2.*y3.^2 + p4.*y3) + Qsfactor.*p3.*p4.*p13.*p15.*y2.*(y4 + y5).*(Qsfactor.*p2.*p3.*y2 - p2 + Qsfactor.*p2.*p4.*y3)) - Qsfactor.*p3.*p4.*p13.*p15.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,3,3,16) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p4.*p13.*(y4 + y5).*(Qsfactor.*p3.^2.*p4.*y2.^2.*y3 - p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.^2.*y2.*y3.^2 - p3.*p4.*y2.*y3 + Qsfactor.*p4.^3.*y3.^3) - Qsfactor.*p4.*p13.*p15.*(y4 + y5).*(p2.*p3.*y2 + 2.*p2.*p4.*y3 - Qsfactor.*p2.*p4.^2.*y3.^2 - Qsfactor.*p2.*p3.*p4.*y2.*y3)) - Qsfactor.*p4.*p13.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5).*(p3.*y2 + 2.*p4.*y3 + Qsfactor.*p4.^2.*y3.^2 + Qsfactor.*p3.*p4.*y2.*y3))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdxdpval(:,4,3,16) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(Qsfactor.*p4.*p13.*p14.*y4.*(p3.*y2 + p4.*y3).*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) + Qsfactor.*p4.*p13.*p14.*p15.*y4.*(p3.*y2 + p4.*y3).*(Qsfactor.*p2.*p3.*y2 - 2.*p2 + Qsfactor.*p2.*p4.*y3)) - Qsfactor.*p4.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*y2 + p4.*y3).*(Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 

% y4-p16

d2fdxdpval(:,2,4,16) = -(Qsfactor.*p3.*p13.*y2.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2.*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2); 
d2fdxdpval(:,3,4,16) = -(Qsfactor.*p4.*p13.*y3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2.*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2); 
d2fdxdpval(:,4,4,16) =  (Qsfactor.*p13.*p14.*(p3.*y2 + p4.*y3).^2)./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2.*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2);

% y5-p16

d2fdxdpval(:,2,5,16) = -(Qsfactor.*p3.*p13.*y2.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2.*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2); 
d2fdxdpval(:,3,5,16) = -(Qsfactor.*p4.*p13.*y3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2.*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2);

for k=1:16
    d2fdxdpval(:,:,:,k) = d2fdxdpval(:,:,:,k).*p(k);
end

