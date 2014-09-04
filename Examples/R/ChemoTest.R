sourceDir <- function(path, trace = TRUE) {
  for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
    if(trace) cat(nm,":")
    source(file.path(path, nm))
    if(trace) cat("\n")
  }
}

RosMac = function(t, x, p, more){
  p = exp(p) 
  dx = x
  dx[,'C1'] = p['r1']*x[,'C1']*(1- x[,'C1']/p['Kc1']- x[,'C2']/p['Kc2']) - p['p']*p['G']*x[,'C1']*x[,'B']/(p['KB']+p['p']*x[,'C1']+x[,'C2'])
  dx[,'C2'] = p['r2']*x[,'C2']*(1- x[,'C1']/p['Kc1']- x[,'C2']/p['Kc2']) - p['G']*x[,'C2']*x[,'B']/(p['KB']+p['p']*x[,'C1']+x[,'C2'])
  dx[,'B'] = p['chiB']*p['G']*(p['p']*x[,'C1']+x[,'C2'])*x[,'B']/(p['KB']+p['p']*x[,'C1']+x[,'C2']) - p['delta']*x[,'B']
  return(dx)
}

RosMacODE = function(t,z,p){ 
  p = exp(p)
  x = exp(z) 
  dx = x
  dx['C1'] = p['r1']*x['C1']*(1- x['C1']/p['Kc1']-x['C2']/p['Kc2']) - p['p']*p['G']*x['C1']*x['B']/(p['KB']+p['p']*x['C1']+x['C2']) 
  dx['C2'] = p['r2']*x['C2']*(1- x['C2']/p['Kc2']- x['C1']/p['Kc1']) - p['G']*x['C2']*x['B']/(p['KB']+p['p']*x['C1']+x['C2']) 
  dx['B'] = p['chiB']*p['G']*(p['p']*x['C1']+x['C2'])*x['B']/(p['KB']+p['p']*x['C1']+x['C2']) - p['delta']*x['B']
  return(list(dx/x))
}

RMobsfn = function(t,x,p,more) {
  x = exp(x)
  y = cbind( x[,'C1']+x[,'C2'],x[,'B'])
  return(log(y))
}


RMpars = c(0.2,0.025,0.125,2.2e4,1e5,5e6,1,1e9,0.3)
RMParnames = c('p','r1','r2','Kc1','Kc2','G','chiB','KB','delta')
names(RMpars)= RMParnames
logpars = log(RMpars)
RMVarnames = c('C1','C2','B')
x0 = c(50,50,2)
names(x0) = RMVarnames
time = 0:200
#res0 = lsoda(log(x0),time,RosMacODE,p = logpars)
#data = res0[,2:4] + 0.2*matrix(rnorm(603),201,3)

rr = range(time) 
knots = seq(rr[1],rr[2],by=1)
bbasis = create.bspline.basis(rr,norder=4,breaks=knots)
         
data = as.matrix(read.csv(file = "E:\\data\\ChemoExampleDataR.csv",header = TRUE, sep = " "))
names(data) = RMVarnames
coef0 = smooth.basis(time,data,fdPar(bbasis,int2Lfd(2),10))$fd$coef
colnames(coef0) = RMVarnames

out = LS.setup(pars=logpars,coefs=coef0,basisvals=bbasis,fn=RosMac,lambda=1e5, times=time,posproc=TRUE)
lik = out$lik 
proc = out$pro

res1 = ParsMatchOpt(logpars,coef0,proc)
res3 = outeropt(data,time,res1$pars,coef0,lik,proc)

data2 = cbind( log( exp(data[,'C1'])+exp(data[,'C2'])), data[,'B'])

out = LS.setup(pars=logpars,coefs=coef0,basisvals=bbasis,fn=RosMac,lambda=1e5, times=time,posproc=TRUE,likfn=RMobsfn)
lik2 = out$lik 
proc2 = out$proc

coef02 = coef0 
coef02[,1:2] = 0

Fres3 = FitMatchOpt(coef02,1:2,res1$pars,proc2)
res32 = outeropt(data2,time,res1$pars,Fres3$coefs,lik2,proc2)

write.table(res1$pars,file = "..\\..\\data\\res1pars.csv",col.names=FALSE,row.names=FALSE)
write.table(Fres3$coefs,file = "..\\..\\data\\Fres3pars.csv",col.names=FALSE,row.names=FALSE)
# 
# > exp(res32$pars)
# p           r1           r2          Kc1          Kc2            G         chiB           KB        delta 
# 2.259798e-01 2.925285e-02 1.295061e-01 5.531922e+08 4.778160e+03 5.048355e+06 1.028451e+00 9.684279e+08 3.063652e-01 
