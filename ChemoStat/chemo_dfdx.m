function dfdxval = chemo_dfdx(times, y, p, more)

% fnval = chemo_fun(times, y, p);

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

dfdxval = zeros(nt,ny,ny);

%  y1

dfdxval(:,1,1) = (p12.*y1.*y2)./(p10 + y1).^2 - (p12.*y2)./(p10 + y1) - (p12.*y3)./(p11 + y1) - p6 + (p12.*y1.*y3)./(p11 + y1).^2;
dfdxval(:,1,2) = (p9.*p10.*p12.*y2)./(p10 + y1).^2;
dfdxval(:,1,3) = (p9.*p11.*p12.*y3)./(p11 + y1).^2;

% y2

dfdxval(:,2,1) = -(p12.*y1)./(p10 + y1);
dfdxval(:,2,2) = (p9.*p12.*y1)./(p10 + y1) - p6 - (p3.*p13.*(y4 + y5))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)) + (p3.*p13.*y2.*(y4 + y5).*(p3./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2;
dfdxval(:,2,3) = (p4.*p13.*y3.*(y4 + y5).*(p3./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*p3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2;
dfdxval(:,2,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p3.*p13.*p14.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p3.*p13.*p14.*p15.*y4) - p3.*p13.*p14.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y3

dfdxval(:,3,1) = -(p12.*y1)./(p11 + y1);
dfdxval(:,3,2) = (p3.*p13.*y2.*(y4 + y5).*(p4./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2;
dfdxval(:,3,3) = (p9.*p12.*y1)./(p11 + y1) - p6 - (p4.*p13.*(y4 + y5))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)) + (p4.*p13.*y3.*(y4 + y5).*(p4./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*p4.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2;
dfdxval(:,3,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p4.*p13.*p14.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p4.*p13.*p14.*p15.*y4) - p4.*p13.*p14.*p15.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% y4

dfdxval(:,4,2) = -(p3.*p13.*y2)./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1));
dfdxval(:,4,3) = -(p4.*p13.*y3)./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)); 
dfdxval(:,4,4) = (p13.*p14.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)) - p7 - p8 - p6;
dfdxval(:,4,5) = p8;

% y5
 
dfdxval(:,5,2) = -(p3.*p13.*y2)./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)); 
dfdxval(:,5,3) = -(p4.*p13.*y3)./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)); 
dfdxval(:,5,5) = - p6 - p7;

% for i=1:nt
%     for j=1:ny
%         dfdxval(i,j,:) = dfdxval(i,j,:)./y(i,j);
%         dfdxval(i,j,j) = dfdxval(i,j,j) - fnval(i,j)./y(i,j).^2;
%     end
% end

% dfdxval = squeeze(sum(dfdxval,1));

end