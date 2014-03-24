function [handle] = ...
    CollocInferPlots(coefs,pars,lik,proc,times,data,ObsPlot,DerivPlot)
%  CollocInferPlots Plots results of CollocInfer process
%
%  Arguments: 
%
%  COEFS      ...  A matrix containing coefficients for the expansion. 
%                  As an input argument is either an NBASIS by NVAR matrix,
%                  in which case NREP = 1, or an NBASIS by NVAR by NREP 
%                  array.
%                  On output it has NVAR columns, and its number of rows is
%                  NBASIS*NREP.
%  PARS       ...  A vector of parameter values.  These are initial values
%                  that are used to start the outer iterations.  Some
%                  of these may be fixed, and the remainder are optimized.
%                  The indices of the optimized parameters are contained
%                  in argument ACTIVE.
%  LIK        ...  LIK object from LS_Setup
%  PROC       ...  PROC object from LS_Setup
%  TIMES      ...  The times of observation of those variables that are
%                  measured.  These times are assumed to be common to all
%                  measured variables.
%  DATA       ...  Array of data.  Defaults to [];
%  ObsPlot    ...  Indicate if Observations should be plotted. Default TRUE
%  DerivPlot  ...  Indicate if Derivatives should be plotted. Default TRUE

%  Last modified 23 March 2014 (Mathieu)
disp('CollocInferPlots Version: 23 March 2014 (Mathieu)')

if nargin < 4
    error('Number of arguments is less than four.');
end

%  ------------------------------------------------------------------------
%             Define default values for the arguments
%  ------------------------------------------------------------------------


if nargin <  8, DerivPlot       = 1;    end
if nargin <  7, ObsPlot         = 1;    end
if nargin <  6, data            = [];    end
if nargin <  5, times           = [];    end

cols = 1:size(coefs,2);

timevec = proc.more.qpts;

traj = proc.bvals.bvals * coefs;

dtraj = proc.bvals.dbvals * coefs;

ftraj = proc.more.fn(timevec,traj,pars,proc.more.more)

otraj = lik.more.fn(timevec,traj,pars,lik.more.more);

if(ObsPlot)
    if (isempty(times)) 
       times = 1:size(data,1);
    end
end

handle = figure()
subplot(1,2,1);

hold on;
plot(timevec,otraj);
if(ObsPlot)
    plot(times,data,'x');
end
hold off;

subplot(2,2,2);
if(DerivPlot)
    hold on;
    plot(timevec,ftraj);
    plot(timevec,dtraj, 'x')
    hold off;
    subplot(2,2,4);
    plot(timevec,dtraj-ftraj);

end




