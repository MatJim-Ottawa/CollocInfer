#include "F:\Program Files\MATLAB\R2013b\extern\include\mex.h"

/* Computational Subroutine*/

void computeLoop(mxArray *cell_ptr, mwIndex nrhs,const mxArray *prhs[] )
{
	mwIndex i;

	for( i = 0; i < (mwIndex)nrhs; i++)
	{
		mxSetCell(cell_ptr,i,mxDuplicateArray(prhs[i]));	
	}
	
}


/* Gateway routine */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[] )
{
	mxArray *cell_array_ptr, *rhs[1];
	mwIndex i;


	cell_array_ptr = mxCreateCellMatrix((mwSize)nrhs,1);


/* To computations */

	computeLoop(cell_array_ptr,nrhs,prhs);

	

	plhs[0] = cell_array_ptr;
}
