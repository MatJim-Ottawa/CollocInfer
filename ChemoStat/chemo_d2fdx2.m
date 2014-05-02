function d2fdx2val = chemo_d2fdx2(times, y, p, more)

p = exp(p);

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

d2fdx2val = zeros(nt,ny,ny,ny);

% y1-y1
d2fdx2val(:,1,1,1) =  (2.*p12.*y2)./(p10 + y1).^2 + (2.*p12.*y3)./(p11 + y1).^2 - (2.*p12.*y1.*y2)./(p10 + y1).^3 - (2.*p12.*y1.*y3)./(p11 + y1).^3;
d2fdx2val(:,2,1,1) = -(2.*p9.*p10.*p12.*y2)./(p10 + y1).^3;
d2fdx2val(:,3,1,1) = -(2.*p9.*p11.*p12.*y3)./(p11 + y1).^3;

% y2-y1
d2fdx2val(:,1,2,1) = -(p10.*p12)./(p10 + y1).^2;
d2fdx2val(:,2,2,1) =  (p9.*p10.*p12)./(p10 + y1).^2;

% y3-y1
d2fdx2val(:,1,3,1) = -(p11.*p12)./(p11 + y1).^2; 
d2fdx2val(:,3,3,1) = (p9.*p11.*p12)./(p11 + y1).^2;

% y1-y2
d2fdx2val(:,1,1,2) = -(p10.*p12)./(p10 + y1).^2;
d2fdx2val(:,2,1,2) =  (p9.*p10.*p12)./(p10 + y1).^2;

% y2-y2
d2fdx2val(:,2,2,2) =  (exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.^2.*p13.*p15.*(y4 + y5).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 2.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 2) + 2.*p2.*p3.^2.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5)) + exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.^2.*p13.*(y4 + y5).*(- p1.^2.*p3.^3.*y2.^3 - 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 - p1.^2.*p3.*p4.^2.*y2.*y3.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + 2.*Qsfactor.*p4.^2.*y3.^2 + 2.*p4.*y3) + p3.^2.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 4.*p2.*Qsfactor.*p3.*y2 + 2.*p2.*p4.*y3.*p1 + 4.*p2)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdx2val(:,3,2,2) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.^2.*p4.*p13.*y3.*(y4 + y5).*(p1.^2.*p3.^2.*y2.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + p1.^2.*p4.^2.*y3.^2 + 2.*Qsfactor.*p3.*y2 + 2.*Qsfactor.*p4.*y3 + 2) + p3.^2.*p4.*p13.*p15.*y3.*(y4 + y5).*(p1.^2.*p2.*p3.*y2 - 2.*Qsfactor.*p2 + p1.^2.*p2.*p4.*y3)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.^2.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5) - p3.^2.*p4.*p13.*p15.*y3.*(y4 + y5).*(2.*p1 + p1.^2.*p3.*y2 + p1.^2.*p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdx2val(:,4,2,2) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.^2.*p13.*p14.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p3.^2.*p13.*p14.*p15.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p3.^2.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

%  y3-y2
d2fdx2val(:,2,3,2) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p1.^2.*p3.^3.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*y2.*y3.^2 + Qsfactor.*p3.^2.*y2.^2 - Qsfactor.*p4.^2.*y3.^2 + p3.*y2 - p4.*y3) - p3.*p4.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 3.*p2.*Qsfactor.*p3.*y2 + p2.*p4.*y3.*p1 + 2.*p2)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p3.*p4.*p13.*p15.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdx2val(:,3,3,2) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3 - Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.^2.*y3.^2 - p3.*y2 + p4.*y3) - p3.*p4.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 3.*p2.*Qsfactor.*p4.*y3 + p2.*p3.*y2.*p1 + 2.*p2)) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + p3.*p4.*p13.*p15.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + Qsfactor.*p3.*y2 + 3.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdx2val(:,4,3,2) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*p14.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p3.*p4.*p13.*p14.*p15.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p3.*p4.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y4-y2
d2fdx2val(:,2,4,2) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.*p13.*p15 + p3.*p4.*p13.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^3.*p13.*y2.^2) + p3.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdx2val(:,3,4,2) =  (p4.*p13.*y3.*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdx2val(:,4,4,2) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*p14.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p3.*p13.*p14.*p15) - p3.*p13.*p14.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y5-y2
d2fdx2val(:,2,5,2) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.*p13.*p15 + p3.*p4.*p13.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^3.*p13.*y2.^2) + p3.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdx2val(:,3,5,2) =  (p4.*p13.*y3.*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;

% y1-y3
d2fdx2val(:,1,1,3) = -(p11.*p12)./(p11 + y1).^2;
d2fdx2val(:,3,1,3) = (p9.*p11.*p12)./(p11 + y1).^2;

% y2-y3
d2fdx2val(:,2,2,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p1.^2.*p3.^3.*y2.^3 + 2.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + p1.^2.*p3.*p4.^2.*y2.*y3.^2 + Qsfactor.*p3.^2.*y2.^2 - Qsfactor.*p4.^2.*y3.^2 + p3.*y2 - p4.*y3) - p3.*p4.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p3.^2.*y2.^2 - p2.*p4.*y3.*p1.^2.*p3.*y2 + 3.*p2.*Qsfactor.*p3.*y2 + p2.*p4.*y3.*p1 + 2.*p2)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) - p3.*p4.*p13.*p15.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 3.*Qsfactor.*p3.*y2 + Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdx2val(:,3,2,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3 - Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.^2.*y3.^2 - p3.*y2 + p4.*y3) - p3.*p4.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 3.*p2.*Qsfactor.*p4.*y3 + p2.*p3.*y2.*p1 + 2.*p2)) - exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*(y4 + y5).*(p2.*p3.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) - p2.*p4.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + p3.*p4.*p13.*p15.*(y4 + y5).*(p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + Qsfactor.*p3.*y2 + 3.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 1)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdx2val(:,4,2,3) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.*p13.*p14.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p3.*p4.*p13.*p14.*p15.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p3.*p4.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y3-y3
d2fdx2val(:,2,3,3) = -(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p4.^2.*p13.*y2.*(y4 + y5).*(p1.^2.*p3.^2.*y2.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + p1.^2.*p4.^2.*y3.^2 + 2.*Qsfactor.*p3.*y2 + 2.*Qsfactor.*p4.*y3 + 2) + p3.*p4.^2.*p13.*p15.*y2.*(y4 + y5).*(p1.^2.*p2.*p3.*y2 - 2.*Qsfactor.*p2 + p1.^2.*p2.*p4.*y3)) + exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.*p4.^2.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5) - p3.*p4.^2.*p13.*p15.*y2.*(y4 + y5).*(2.*p1 + p1.^2.*p3.*y2 + p1.^2.*p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3; 
d2fdx2val(:,3,3,3) =  (exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.^2.*p13.*p15.*(y4 + y5).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 2.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p4.^2.*y3.^2 + p1.^2.*p3.*p4.*y2.*y3 + 2) + 2.*p2.*p3.*p4.^2.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5)) + exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.^2.*p13.*(y4 + y5).*(- p1.^2.*p3.^2.*p4.*y2.^2.*y3 - 2.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 - p1.^2.*p4.^3.*y3.^3 + 2.*Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + 2.*p3.*y2) + p4.^2.*p13.*p15.*(y4 + y5).*(- p2.*p1.^2.*p4.^2.*y3.^2 - p2.*p3.*y2.*p1.^2.*p4.*y3 + 4.*p2.*Qsfactor.*p4.*y3 + 2.*p2.*p3.*y2.*p1 + 4.*p2)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;
d2fdx2val(:,4,3,3) =  (exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.^2.*p13.*p14.*y4.*(p1.^2.*p3.^3.*y2.^3 + 3.*p1.^2.*p3.^2.*p4.*y2.^2.*y3 + 3.*p1.^2.*p3.*p4.^2.*y2.*y3.^2 + p1.^2.*p4.^3.*y3.^3) - p4.^2.*p13.*p14.*p15.*y4.*(- p2.*p1.^2.*p3.^2.*y2.^2 - 2.*p2.*p1.^2.*p3.*p4.*y2.*y3 - p2.*p1.^2.*p4.^2.*y3.^2 + 4.*p2.*Qsfactor.*p3.*y2 + 4.*p2.*Qsfactor.*p4.*y3 + 4.*p2)) - p4.^2.*p13.*p14.*p15.*y4.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.^2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 4.*Qsfactor.*p3.*y2 + 4.*Qsfactor.*p4.*y3 + p1.^2.*p3.^2.*y2.^2 + p1.^2.*p4.^2.*y3.^2 + 2.*p1.^2.*p3.*p4.*y2.*y3 + 2))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^3;

% y4-y3
d2fdx2val(:,2,4,3) =  (p3.*p13.*y2.*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdx2val(:,3,4,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p4.*p13.*p15 + p3.*p4.*p13.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^3.*p13.*y3.^2) + p4.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdx2val(:,4,4,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*p14.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p4.*p13.*p14.*p15) - p4.*p13.*p14.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y5-y3
d2fdx2val(:,2,5,3) =  (p3.*p13.*y2.*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdx2val(:,3,5,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p4.*p13.*p15 + p3.*p4.*p13.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^3.*p13.*y3.^2) + p4.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y2-y4
d2fdx2val(:,2,2,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.*p13.*p15 + p3.*p4.*p13.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^3.*p13.*y2.^2) + p3.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
d2fdx2val(:,3,2,4) =  (p4.*p13.*y3.*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdx2val(:,4,2,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*p14.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p3.*p13.*p14.*p15) - p3.*p13.*p14.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y3-y4
d2fdx2val(:,2,3,4) =  (p3.*p13.*y2.*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;
d2fdx2val(:,3,3,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p4.*p13.*p15 + p3.*p4.*p13.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^3.*p13.*y3.^2) + p4.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
d2fdx2val(:,4,3,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*p14.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p2.*p4.*p13.*p14.*p15) - p4.*p13.*p14.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y2-y5
d2fdx2val(:,2,2,5) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p3.*p13.*p15 + p3.*p4.*p13.*(y3 - Qsfactor.*p3.*y2.*y3) - Qsfactor.*p3.^3.*p13.*y2.^2) + p3.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
d2fdx2val(:,3,2,5) =  (p4.*p13.*y3.*(p3./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2;

% y3-y5
d2fdx2val(:,2,3,5) =  (p3.*p13.*y2.*(p4./(p2 + 1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2)))./(p15 + (p3.*y2 + p4.*y3)./(p2 + exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)))).^2; 
d2fdx2val(:,3,3,5) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p2.*p4.*p13.*p15 + p3.*p4.*p13.*(y2 - Qsfactor.*p4.*y2.*y3) - Qsfactor.*p4.^3.*p13.*y3.^2) + p4.*p13.*p15.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*p2.^2 + 1) + p2.*p3.*p4.*p13.*y2.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)))./(p15 + p2.*p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;


end

