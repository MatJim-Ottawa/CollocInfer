function fnval = RosMac_fun(time, z, p, more)
z1 = z(:,1);
z2 = z(:,2);
z3 = z(:,3);
p1 = p(1);
p2 = p(2);
p3 = p(3);
p4 = p(4);
p5 = p(5);
p6 = p(6);
p7 = p(7);
p8 = p(8);
p9 = p(9);
dz = z;
D = 1 - exp(z1-p4) - exp(z2-p5);
f = log(exp(p6-p9) + exp(z1-p9+p1) + exp(z2-p9));
dz(:,1) = exp(p2).*D - exp(z3-f+p1);
dz(:,2) = exp(p3).*D - exp(z3-f);
dz(:,3) = -p8 + exp(z1-f+p1+p7) + exp(z2-f+p7); 
fnval = dz;
end

