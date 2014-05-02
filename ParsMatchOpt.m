function pars = ParsMatchOpt(pars_0, coefs, proc, allpars, active, ...
                             options_out)

%  Last modified 31 March 2014

if nargin < 6 || isempty(options_out), options_out = [];      end
if nargin < 5 || isempty(active)
    active   = 1:length(pars_0); 
    allpars  = pars_0;     
end
if nargin < 4 || isempty(allpars), allpars = pars_0;  end

if isempty(options_out)
    options_out = optimset('GradObj', 'on', 'MaxIter', 100, ...
                           'display', 'iter', ...
                           'TolFun', 1e-6);
end

pars_0 = pars_0(:);

pars_opt = fminunc(@ParsMatch, pars_0, options_out, ...
                   coefs, proc, allpars, active);
               
pars = allpars;
pars(active) = pars_opt;

end
