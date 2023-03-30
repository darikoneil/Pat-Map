classdef AbstractFW < handle
    % AbstractFW  
    
    % Base class for Frank-Wolfe algorithms. 
    
    % Handles outer loop and convergence checks.
    
    properties
        algo_name
        objective
        duality_gap
        opts        
        total_iter_time
    end
    
    methods (Abstract)
        % MUST BE IMPLEMENTED BY CHILDREN
        step_size = iter(th);        
    end
    
    methods
        function th = AbstractFW(objective, varargin)
            p = inputParser;
            p.KeepUnmatched = true;
            
            p.addRequired('objective', @(x) isa(x, 'BCFWObjective'));
            p.addParamValue('max_iterations', 50000);
            p.addParamValue('max_time', inf)
            p.addParamValue('fval_epsilon', 0); % stopping criteria: if fval decreases less than epsilon in test 
            % interval iterations
            p.addParamValue('print_interval', 10); 
          
            % Function which takes myself and iter as an argument and computes
            % whether to do line search or backoff this iteration.
            %
            % Defaults to return true regardless of input.
            
            p.addParamValue('line_search_policy', @(algo, iter) true);
            
            p.parse(objective, varargin{:});
            th.objective = objective;
            th.opts = p.Results;     
                       
            th.total_iter_time = 0;            
        end
        
        function [object_history, test_history, exit_flag] = run(th, t)
            % Starting iteration is optional.
            if nargin == 1
                t = 1;
            end

            object_history = struct('iter', {}, 'fval', {}, 'total_iter_time', {}, 'training_error', {}, 'dx1', {}, ...
                'step_size', {});
     
            previous_fval = inf;
            xOld = th.objective.x;
            while t <= th.opts.max_iterations && th.total_iter_time <= th.opts.max_time
                tic;
                step_size = th.iter(t);
                th.total_iter_time = th.total_iter_time + toc;
                                          
                if mod(t, th.opts.print_interval) == 0
                    % Save time by not solving all the LPs if unnecessary
                    % for the printing. Seems irrelevant in practice, oh
                    % well
                    [~, duality_gap] = th.objective.solve_lp();
                        % If we don't compute a new duality gap, just grab
                        % whatever we've cached. However, it may not always
                        % exist, in which case we'll just print blank.                        
                    %duality_gap = th.duality_gap;
                    % end
                                   
                    fval  = th.objective.fval();   
                    
                    object_history(end+1) = struct('iter', t, ...
                        'fval', fval, ...
                        'total_iter_time', th.total_iter_time, ...
                        'training_error', th.objective.training_error(), ...
                        'dx1', norm(th.objective.x - xOld, 1), ...
                        'step_size', step_size);
                    
                    % TODO: Factor out
                    xOld = th.objective.x;                  
                                        
                    fprintf('[%s] %s', th.algo_name, sprintfStruct(object_history(end)));  
                    
                    if abs(previous_fval - fval) < th.opts.fval_epsilon
                        fprintf('CONVERGENCE REACHED\n');
                        break;
                    end
                    previous_fval = fval;
                end
                t = t + 1;
            end            
            exit_flag = 0;            
        end     
    end  
end

