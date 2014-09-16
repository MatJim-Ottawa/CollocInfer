classdef ODE < handle
%% ODE Class  
% Idea is to give a symbolic representation of the ODE. 
% Calculates all the necessary functions based on symbolic package.
%
% TODO:
%           - Add data property to ODE
%           - Graphing data + ode?                
%           - Generate data from ODE, add noise
%           - log data at source function?        
%           - Export functions to file?
%           - Write unit testing
%           - Added dependency on LogTrans, needs to be tested!?

    
    properties(Access=private)
    %Internal variables not exposed to user.
    
        % Display_Symbolic When computeDerivatives() is run, it populates 
        % this as a struct. It is used by displayResult() to display the 
        % different computed equations in console.
        Display_Symbolic
        
        % DE_Symbolic Internal copy of symbolic DE set in 
        % constructor.      
        DE_Symbolic
        
        % paramvector_Symbolic Internal copy of symbolic vector of  
        % parameter variables set inconstructor.
        paramvector_Symbolic
        
        % statevector_Symbolic Internal copy of symbolic vector of state  
        % variables set inconstructor.
        statevector_Symbolic
        
        % time_Symbolic Internal copy of symbolic time variable set in 
        % constructor. 
        time_Symbolic
        
        % exp_paramvector_bool Boolean value determines if parameter values 
        % will beexponentiated in the equations returned by make(). 
        % Defaults to 0.
        exp_paramvector_bool
        
        % log_statevector_bool Boolean value determines if state values 
        % will be exponentiated in the equations returned by make(). 
        % Defaults to 0.
        log_statevector_bool
        
        % f_struc_representation Contains result of computeDerivatives()
        % in a struc for later use by make().
        f_struc_representation
        
        % Display_Symbolic_Label Contains the labels for each element of
        % Display_Symbolic
        Display_Symbolic_Label

        
    end
    
    %  ----------------------  First methods block  -----------------------
    
    methods
        function thisODE = ODE(f,t,x,p)
%              ODE Contructor function for ODE Class
%              Arguments:
%               All four arguments are required.
%              f      ... A vector containing the symbolic representation 
%                         of the differential equation.
%              t      ... A symbolic variable representing time in f.
%              x      ... A symbolic vector representing the state 
%                         variables in f.
%              p      ... A symbolic vector representing the parameter 
%                         variables in f.
%              
%             TODO:
%                 -Lots of error handling

            disp('ODE Version: 13 March 2014 (Mathieu)')
%              
%           Initialize:
%             
%               Need to type the internal variables correctly 
%               (sym variable) before assigning them to the values passsed 
%               in the contructor.
            syms asim 
            
            thisODE.DE_Symbolic          = asim;
            thisODE.paramvector_Symbolic = asim;
            thisODE.statevector_Symbolic = asim;
            thisODE.time_Symbolic        = asim;
            
%               Initial Value of exp_paramvector_bool
            thisODE.exp_paramvector_bool = 0;
            thisODE.log_statevector_bool = 0;
            
%           Assign:
%             
%               Internal copies of the values from the contructor call.
            thisODE.DE_Symbolic          = f;
            thisODE.paramvector_Symbolic = p;
            thisODE.statevector_Symbolic = x;
            thisODE.time_Symbolic        = t;
            
            thisODE.Display_Symbolic_Label{1} = 'fn';
            thisODE.Display_Symbolic_Label{2} = 'dfdx';
            thisODE.Display_Symbolic_Label{3} = 'dfdp';
            thisODE.Display_Symbolic_Label{4} = 'd2fdx2';
            thisODE.Display_Symbolic_Label{5} = 'd2fdxdp';
            
        end
       
        function functionHandle = returnMatlabFunctions(thisODE,filePath)
%              returnMatlabFunctions Function for debugging.
%              Returns function handles derived from the symbolic equations 
%              DE_Symbolic.
%              IE conversion from symbolic -> @ functions using
%              matlabFunction().
            
            if ~isempty(filePath)
                    matlabFunction(thisODE.DE_Symbolic, 'file', ...
                        [filePath, '\', ...
                         thisODE.Display_Symbolic_Label{1},'.m']);
                end
            
            for i=1:length(thisODE.Display_Symbolic)
                if ~isempty(filePath)
                    matlabFunction(thisODE.Display_Symbolic{i}, 'file', ...
                        [filePath, '\', ...
                         thisODE.Display_Symbolic_Label{i+1},'.m']);
                end
                functionHandle{i} = ...
                         matlabFunction(thisODE.Display_Symbolic{i});
            end
        end
        
        function SetExponentialParameter(thisODE)
            %             SetExponentialParameter 
            %             Sets internal flag(exp_paramvector_bool)
            %             to indicate that the user is requesting equations 
            %             where the parameters are necessarily positve. 
            %             Each call will switch the value to the opposite 
            %             of what is currently set.
            %
            %             TODO:
            %                 -Lots of error handling
            
            % Message to user.
            switch thisODE.exp_paramvector_bool
                case {0}
                    disp(['NOTE: ODE will now exponentiate the ', ...
                          'parameter vector!'])
                case {1}
                    disp(['NOTE: ODE will NO LONGER exponentiate ', ...
                          'the parameter vector!'])
            end
            
            % Switch value of exp_paramvector_bool
            thisODE.exp_paramvector_bool = ...
                not(thisODE.exp_paramvector_bool);
        end
        
        function SetLogState(thisODE)
            %         SetLogState Sets internal flag(log_statevector_bool)
            %         to indicate that the user is requesting equations 
            %         where the stats are on a log scale. Each call will 
            %         switch the value to the opposite of what is currently 
            %         set.     
            %
            %             TODO:
            %                 -Lots of error handling
            
            % Message to user.
            switch thisODE.log_statevector_bool
                case {0}
                    disp(['NOTE: ODE will now accept state vector on'], ...
                         [' log scale!'])
                case {1}
                    disp(['NOTE: ODE will NO LONGER accept state '], ...
                          ['vector on log scale!'])
            end
            
            % Switch value of exp_paramvector_bool
            thisODE.log_statevector_bool = ...
                                      not(thisODE.log_statevector_bool);
        end
        
        function displayResult(thisODE)
%           displayResult Output results from computeDerivatives.
%           computeDerivatives must be called before this function.
            disp('Value for fn')
            disp(thisODE.DE_Symbolic)
            disp('Value for dfdx')
            disp(thisODE.Display_Symbolic{1})
            disp('Value for dfdp')
            disp(thisODE.Display_Symbolic{2})
            disp('Value for d2fdx2')
            disp(thisODE.Display_Symbolic{3})
            disp('Value for d2fdxdp')
            disp(thisODE.Display_Symbolic{4})
        end
            
        function computeDerivatives(thisODE)
%             computeDerivatives Use symbolic toolbox functions to compute 
%             derivatives required from CollocInfer. Necessary values 
%             should have been set 
%             derivatives when class was constructed.
%         
%             TODO:
%                 -Lots of error handling
% 
%           Creates a vector of all the symbolic variables needed to
%           compute the derivatives
          X = [thisODE.statevector_Symbolic,thisODE.paramvector_Symbolic];
                    
%           Computes the Jacobian
          Jf = thisODE.Jacobian(thisODE.DE_Symbolic,X);
          
%           dfdx is the first portion of this matrix
          dfdx = Jf(:,1:length(thisODE.statevector_Symbolic));
          
%           Set this value so that displayResult() need to rerun this 
%           portion
          thisODE.Display_Symbolic{1} = dfdx;

%           Using this symoblic varaible to maintain the shape of the 
%           matrix. It will be substituted with 0 later in make().
          syms trick;
          
          fn_out = reshape(thisODE.DE_Symbolic + ...
                           trick*thisODE.statevector_Symbolic(1), ...
                           size(thisODE.DE_Symbolic,1)* ...
                           size(thisODE.DE_Symbolic,2),1);
          fn_hidden(trick,X,thisODE.time_Symbolic) = fn_out;
          
          
          f.fn = matlabFunction(fn_hidden);
                    
          dfdx_out = reshape(dfdx + ...
                   trick*thisODE.statevector_Symbolic(1), ...
                   size(dfdx,1)*size(dfdx,2),1);          
          dfdx_hidden(trick,X,thisODE.time_Symbolic) = dfdx_out   ;    
          f.dfdx = matlabFunction(dfdx_hidden);                   
          
%         Something with null length, need to handle error!
          dfdp = Jf(:,end-length(thisODE.paramvector_Symbolic)+1:end);
          thisODE.Display_Symbolic{2} = dfdp;
          
          dfdp_out = reshape(dfdp + ...
                      trick*thisODE.statevector_Symbolic(1), ...
                      size(dfdp,1)*size(dfdp,2),1);
          dfdp_hidden(trick,X,thisODE.time_Symbolic) = dfdp_out;
          f.dfdp = matlabFunction(dfdp_hidden);
         
          d2fdx2 = thisODE.Jacobian(dfdx,thisODE.statevector_Symbolic);
          thisODE.Display_Symbolic{3} = d2fdx2;
          
          d2fdx2_out = reshape(d2fdx2 + ...
                      trick*thisODE.statevector_Symbolic(1), ...
                      size(d2fdx2,1)*size(d2fdx2,2),1);
          d2fdx2_hidden(trick,X,thisODE.time_Symbolic) = d2fdx2_out;
          f.d2fdx2 = matlabFunction(d2fdx2_hidden) ;        
          
          d2fdxdp = thisODE.Jacobian(dfdx,thisODE.paramvector_Symbolic);
          thisODE.Display_Symbolic{4} = d2fdxdp;
          
          d2fdxdp_out = reshape(d2fdxdp + ...
                      trick*thisODE.statevector_Symbolic(1), ...
                      size(d2fdxdp,1)*size(d2fdxdp,2),1);
          d2fdxdp_hidden(trick,X,thisODE.time_Symbolic) = d2fdxdp_out;
          f.d2fdxdp = matlabFunction(d2fdxdp_hidden);         
                 
          thisODE.f_struc_representation = f;
          
           disp( ['NOTE: Finished Calculating derivatives for ODE!'] );
            
        end
        
        function plot(thisODE,trange,x_init,p_init,more)

            fn = thisODE.make();           
            fn_new = @(t,y) fn.fn(t,y,p_init,more);
            [T,Y] = ode45(fn_new,trange,x_init);
            figure();
            hold on;
            plot(T,Y(:,1));
            plot(T,Y(:,2));
            hold off;
        end
        
        function [T,Y] = generateData(thisODE,trange,x_init, ...
                                      p_init,more,sig,seed)
            fn = thisODE.make();
            MU = zeros(1,length(x_init));
            SIGMA = sig*eye(length(x_init));            
            fn_new = @(t,y) fn.fn(t,y,p_init,more);
            [T,Y] = ode45(fn_new,trange,x_init);
            rng(seed);
            randNum = mvnrnd(MU,SIGMA,length(T));
            %  noiseStd = std(randNum);
            %  signalMean = mean(Y);
            %  sig2noise = signalMean ./ noiseStd;
            Y = Y + randNum;
            
        end               
        
        function f = make(thisODE)
            f.fn = @thisODE.fn;
            f.dfdx = @thisODE.dfdx;
            f.dfdp = @thisODE.dfdp;
            f.d2fdx2 = @thisODE.d2fdx2;
            f.d2fdxdp = @thisODE.d2fdxdp;                        
        end
        
    end  %  end of first methods block
    
    %  ----------------------  Second methods block  ----------------------
    
    methods
        
        % find functions
        % Return list of functions

        function [] = find_functions( aCharString )
            % Will Identify the beginning of functions
            % Have to find the closing bracket of each to find end of defn
            regexDef = '\w+\(';

            % Get strings that match
            [o,o1] = regexp(aCharString, regexDef,'match');


            % Loop for each function found
            for i=1:length(o1)


                function_start_index       = [];
                param_start_index          = [];
                param_end_index            = [];


                % Get first open bracket
                index_ = o1(i);

                while(aCharString(index_) ~= '(')

                    %Found the start of the function name
                    if( ~isempty(regexp(aCharString(index_),'[a-zA-Z]')) && isempty(function_start_index) )
                        function_start_index = index_;
                    end


                    index_ = index_ + 1;
                end

                % set start_index
                param_start_index = index_;

                count_open = 1;
                count_closed = 0;

                while( count_open ~= count_closed && index_ ~= (length(aCharString) + 1))

                    index_ = index_ + 1;

                    if ( aCharString(index_) == '(' ) 
                        count_open = count_open + 1;
                    end

                    if ( aCharString(index_) == ')' ) 
                        count_closed = count_closed + 1;
                    end

                end

                param_end_index = index_;

                disp(['Full function:' aCharString( function_start_index:param_end_index) ])

                params_string = aCharString( param_start_index:param_end_index);

                disp(['Parameters:' aCharString( param_start_index:param_end_index)])


                params = find_parameters( params_string );

                for j=1:length(params)

                    disp(['Found: ' params{j}]);

                end

            end    

        end

        %Find variables in a string function SYMVAR might work for this.
        function [ result_ ] = find_parameters( aCharString )

            regexDef    = '[a-zA-Z]\w*(.){0,1}';
            result_     = {};

            % Get strings that match
            [output_] = regexp(aCharString, regexDef,'match');

            if ( ~isempty(output_) )

                %Drop all the ones with '(', not the best written code here
                for i=1:length(output_)

                    if (  ~isempty(strfind(output_{i},'(')) )

                        continue;

                    end

                    result_{length(result_) + 1} = strjoin(regexp(output_{i}, '\w+', 'match'));
                end

            end

            %Get Distinct values
            result_ = unique( result_);

        end
        
        function result = Jacobian(~,F,y)
            % Replace the symbolic Jacobian. Will compute Jacobian on each
            % of the columns and append each as rows to result. This
            % functions like the Jacobian in the symbolic package pre 2011?.
            %
            %             TODO:
            %                 -Lots of error handling
                        
            numCols = size(F,2);
            
            if numCols == 1
                result = jacobian(F,y);
                return;
            end
            
            J = jacobian(F(:,1),y);
            
            for i = 2 : numCols
                J = cat(1,J,jacobian(F(:,i),y));
            end
            result = J;
            return;
        end
        
        function result = fn(thisODE,t,x,p,more)
            if thisODE.exp_paramvector_bool == 1
                p = exp(p);
            end
            if thisODE.log_statevector_bool == 1
                x = exp(x);
            end
            
            %             Need p to be a row vector.
            if isvector(p) == 0
                disp('p is not a vector!')
            end
            p = reshape(p,1,length(p));
            if isvector(x) == 1
                x = reshape(x,1,length(x));
            end
            
            t = reshape(t,length(t),1);
            xcol = num2cell(x,1);
            pcol = num2cell(p,1);
            
            res = thisODE.f_struc_representation.fn(0,xcol{:},pcol{:},t);
            if isvector(x) == 1
                result = reshape(res,length(x),1);
                
            else
                result = reshape(res,length(xcol{1}),length(xcol));
            end
            
            
            
            if thisODE.log_statevector_bool == 1
                result = result./x';
            end
            
        end
        
        function result = dfdx(thisODE,t,x,p,more)
            % Order is important since we dont want to exponentiate before
            % fn call
            if thisODE.log_statevector_bool == 1
                x1 = thisODE.fn(t,x,p,more)';
                x = exp(x);
            end
            if thisODE.exp_paramvector_bool == 1
                p = exp(p);
            end
            
            
            
            t = reshape(t,length(t),1);
            xcol = num2cell(x,1);
            pcol = num2cell(p,1);
            
            res = thisODE.f_struc_representation.dfdx(0,xcol{:},pcol{:},t);
            result = reshape(res, length(xcol{1}), length(xcol), ...
                length(xcol));
            
            if thisODE.log_statevector_bool == 1
                
                
                [~,m,n] = size(result);
                for i = 1:m
                    for j = 1:n
                        result(:,i,j) = result(:,i,j).*x(:,j)./x(:,i);
                    end
                    result(:,i,i) = result(:,i,i) - x1(:,i);
                end
            end
            
        end
        
        function result = dfdp(thisODE,t,x,p,more)
            % Order is important since we dont want to exponentiate before
            % fn call
            if thisODE.log_statevector_bool == 1
                x = exp(x);
            end
            
            if thisODE.exp_paramvector_bool == 1
                p = exp(p);
            end
            
            
            
            t = reshape(t,length(t),1);
            xcol = num2cell(x,1);
            pcol = num2cell(p,1);
            
            res = thisODE.f_struc_representation.dfdp(0,xcol{:},pcol{:},t);
            result = reshape(res, length(xcol{1}), length(xcol), ...
                length(pcol));
            
            if thisODE.log_statevector_bool == 1
                [~,m,n] = size(x);
                for i = 1:m
                    for j = 1:n
                        result(:,i,j) = result(:,i,j)./x(:,i);
                    end
                end
            end
            
        end
        
        function result = d2fdx2(thisODE,t,x,p,more)
            % Order is important since we dont want to exponentiate before
            % fn call
            if thisODE.log_statevector_bool == 1
                x1 = thisODE.dfdx(t,x,p,more);
                x = exp(x);
            end
            
            if thisODE.exp_paramvector_bool == 1
                p = exp(p);
            end
            
            t = reshape(t,length(t),1);
            xcol = num2cell(x,1);
            pcol = num2cell(p,1);
            
            res    = ...
                thisODE.f_struc_representation.d2fdx2(0,xcol{:},pcol{:},t);
            result = reshape(res, length(xcol{1}), length(xcol), ...
                length(xcol),length(xcol));
            
            if thisODE.log_statevector_bool == 1
                [~,ll,mm,nn] = size(result);
                for i = 1:ll
                    for j = 1:mm
                        for k = 1:nn
                            result(:,i,j,k) = ...
                                result(:,i,j,k).*x(:,j).*x(:,k)./x(:,i);
                        end
                    end
                end
                
                for i = 1:ll
                    for j = 1:mm
                        result(:,i,i,j) = result(:,i,i,j) - x1(:,i,j);
                        result(:,i,j,i) = result(:,i,j,i) - x1(:,i,j);
                        result(:,i,j,j) = result(:,i,j,j) + x1(:,i,j);
                    end
                end
            end
        end
        
        function result = d2fdxdp(thisODE,t,x,p,more)
            
            % Order is important since we dont want to exponentiate before
            % fn call
            if thisODE.log_statevector_bool == 1
                x1 = thisODE.dfdp(t,x,p,more);
                x = exp(x);
            end
            
            if thisODE.exp_paramvector_bool == 1
                p = exp(p);
            end
            
            
            t = reshape(t,length(t),1);
            xcol = num2cell(x,1);
            pcol = num2cell(p,1);
            
            res    = ...
                thisODE.f_struc_representation.d2fdxdp(0,xcol{:},pcol{:},t);
            result = reshape(res, length(xcol{1}), length(xcol), ...
                length(xcol),length(pcol));
            
            if thisODE.log_statevector_bool == 1
                [~,ll,mm,nn] = size(result);
                
                for i = 1:ll
                    for j = 1:mm
                        for k = 1:nn
                            result(:,i,j,k) = ...
                                result(:,i,j,k).*x(:,j)./x(:,i);
                        end
                    end
                end
                
                for i = 1:ll
                    for j = 1:nn
                        result(:,i,i,j) = result(:,i,i,j) - x1(:,i,j);
                    end
                end
            end
        end
        
    end  %  end of second methods block
    
end
