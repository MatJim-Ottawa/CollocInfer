function [ output_args ] = testfunction( aSym, aFn )

% Give it a sym and get back a list of functions and parameters


S = char(aSym);

find_functions(aSym);
output_args = find_parameters(aSym);  

sub_fun_sym(aSym,aFn);

end

% Cheap trick to get variable name
function out = varname(var)
    out = inputname(1);
end


function [] = sub_fun_sym( arg, listFn )
    %loop over size, to handle matrix
    input_ = char(arg);
    mapObj = containers.Map({char(varname(listFn))},{char(listFn)});

    list_fn = find_functions(arg);

    for k=1:length(list_fn)
        
        if (~mapObj.iskey(list_fn{k}.function_name))
            continue
        end
        
        input_ = [ input_(1:
    end
end

% find functions
% Return list of functions

function [output_] = find_functions( aCharString )
    % Will Identify the beginning of functions
    % Have to find the closing bracket of each to find end of defn
    regexDef = '\w+\(';

    % Get strings that match
    [o,o1] = regexp(aCharString, regexDef,'match');
    
    output_ = {};
    
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
        
        struct = [];
        
        struct.function_name = aCharString( function_start_index:(param_start_index-1));
        struct.function_start_index = function_start_index;
        struct.param_start_index = param_start_index;
        struct.param_end_index = param_end_index;
        
        output_{i} = struct;
    
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