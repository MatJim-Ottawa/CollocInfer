% Test

load('tmp.mat');



for N = 1:100
    
    %GENERATE DATA
    H1 = rand(1000,3,3);
    H2 = rand(1000,3,3);
    weights = rand(1000,3);

   testFunction(bvals.bvals,bvals.dbvals,H1,H2,weights);
    
end