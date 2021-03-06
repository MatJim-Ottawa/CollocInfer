function dfdpval = chemo_dfdp(times, y, p, more)

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

y1 = y(:,1);
y2 = y(:,2);
y3 = y(:,3);
y4 = y(:,4);
y5 = y(:,5);

% y = exp(y);

[nt, ny] = size(y); 
np = length(p);

dfdpval = zeros(nt,ny,np);

% p3

dfdpval(:,2,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p13.*p15.*y2.*(y4 + y5) - p13.*y2.*(y4 + y5).*(Qsfactor.*p3.^2.*y2.^2 + Qsfactor.*p4.*y3.*p3.*y2 - p4.*y3)) + p13.*p15.*y2.*(y4 + y5).*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + p4.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2; 
dfdpval(:,3,3) = (p4.*p13.*y3.*(y4 + y5).*(y2./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*y2.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2;
dfdpval(:,4,3) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p13.*p14.*y2.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p13.*p14.*p15.*y2.*y4) - p13.*p14.*p15.*y2.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% p4

dfdpval(:,2,4) = (p3.*p13.*y2.*(y4 + y5).*(y3./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + (Qsfactor.*y3.*(p3.*y2 + p4.*y3))./(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1).^2)))./(p15 + (p3.*y2 + p4.*y3)./(exp(-Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)).^2; 
dfdpval(:,3,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(2.*p13.*p15.*y3.*(y4 + y5) - p13.*y3.*(y4 + y5).*(Qsfactor.*p4.^2.*y3.^2 + Qsfactor.*p3.*y2.*p4.*y3 - p3.*y2)) + p13.*p15.*y3.*(y4 + y5).*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1) + p3.*p13.*y2.*y3.*exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(y4 + y5))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;
dfdpval(:,4,4) = -(exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)).*(p13.*p14.*y3.*y4.*(Qsfactor.*p3.^2.*y2.^2 + 2.*Qsfactor.*p3.*p4.*y2.*y3 + Qsfactor.*p4.^2.*y3.^2) - 2.*p13.*p14.*p15.*y3.*y4) - p13.*p14.*p15.*y3.*y4.*(exp(2.*Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1))./(p15 + p15.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p3.*y2.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + p4.*y3.*exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3))).^2;

% p5

dfdpval(:,1,5) = p6;

% p6

dfdpval(:,1,6) = p5 - y1;
dfdpval(:,2,6) = -y2;
dfdpval(:,3,6) = -y3;
dfdpval(:,4,6) = -y4;
dfdpval(:,5,6) = -y5;

% p7

dfdpval(:,4,7) = -y4;
dfdpval(:,5,7) = -y5;

% p8

dfdpval(:,4,8) = -y4;
dfdpval(:,5,8) =  y4;

% p9

dfdpval(:,2,9) = (p12.*y1.*y2)./(p10 + y1);
dfdpval(:,3,9) = (p12.*y1.*y3)./(p11 + y1);

% p10

dfdpval(:,1,10) = (p12.*y1.*y2)./(p10 + y1).^2;
dfdpval(:,2,10) = -(p9.*p12.*y1.*y2)./(p10 + y1).^2;

% p11

dfdpval(:,1,11) = (p12.*y1.*y3)./(p11 + y1).^2;
dfdpval(:,3,11) = -(p9.*p12.*y1.*y3)./(p11 + y1).^2;

% p12

dfdpval(:,1,12) = - (y1*y2)/(p10 + y1) - (y1*y3)/(p11 + y1);
dfdpval(:,2,12) = (p9*y1*y2)/(p10 + y1);
dfdpval(:,3,12) = (p9*y1*y3)/(p11 + y1);

% p13

dfdpval(:,2,13) = -(p3.*y2.*(y4 + y5))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1)); 
dfdpval(:,3,13) = -(p4.*y3.*(y4 + y5))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1));
dfdpval(:,4,13) = (p14.*y4.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1));

% p14

dfdpval(:,4,14) = (p13.*y4.*(p3.*y2 + p4.*y3))./(p15 + (p3.*y2 + p4.*y3)./(1./exp(Qsfactor.*(p3.*y2 - p16 + p4.*y3)) + 1));

% p15

dfdpval(:,2,15) = (p3*p13*y2*(y4 + y5))/(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2; 
dfdpval(:,3,15) = (p4*p13*y3*(y4 + y5))/(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2;
dfdpval(:,4,15) = -(p13*p14*y4*(p3*y2 + p4*y3))/(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2;

% p16

dfdpval(:,2,16) = -(p1*p3*p13*y2*(y4 + y5)*(p3*y2 + p4*y3))/(exp(Qsfactor*(p3*y2 - p16 + p4*y3))*(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1)^2*(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2); 
dfdpval(:,3,16) = -(p1*p4*p13*y3*(y4 + y5)*(p3*y2 + p4*y3))/(exp(Qsfactor*(p3*y2 - p16 + p4*y3))*(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1)^2*(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2); 
dfdpval(:,4,16) = (p1*p13*p14*y4*(p3*y2 + p4*y3)^2)/(exp(Qsfactor*(p3*y2 - p16 + p4*y3))*(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1)^2*(p15 + (p3*y2 + p4*y3)/(exp(-p1*(p3*y2 - p16 + p4*y3)) + 1))^2);

for k=1:16
    dfdpval(:,:,k) = dfdpval(:,:,k).*p(k);
end

end
