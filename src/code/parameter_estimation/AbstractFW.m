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
            p.addParamValue('test_interval', 100);
            p.addParamValue('training_error_interval', 1);
            p.addParamValue('print_computed_duality_gap', false);
            p.addParamValue('output_function', []);
            p.addParamValue('test_set', []);            
            
            p.addParamValue('checkpoint_file', []);
            p.addParamValue('checkpoint_interval', []);

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
            fprintf('DEBUG t = %d, nargin = %d\n', t, nargin);

            object_history = struct('iter', {}, 'fval', {}, 'duality_gap', {}, 'relative_duality_gap', {}, ...
                         'total_iter_time', {}, ...
                         'training_error', {}, ...
                         'dx1', {}, ...
                         'step_size', {});
                     
            tset_history = struct('iter', {}, ...
                              'object_history_val', {}, ...
                              'map_error', {}, ...
                              'mpm_error', {});            
                     
            
            previous_fval = inf;
            xOld = th.objective.x;
            while t <= th.opts.max_iterations && th.total_iter_time <= th.opts.max_time
                tic;
                step_size = th.iter(t);
                th.total_iter_time = th.total_iter_time + toc;

                %if ~isempty(th.opts.output_function)
                %    th.opts.output_function(t, th);
                %end
                
                % Compute test error online
                %test_map_error = [];
                %test_mpm_error = [];
                %if mod(t, th.opts.test_interval) == 0 && ~isempty(th.opts.test_set)
                %    theta  = th.objective.compute_params();
                %    map_error = th.opts.test_set.map_error(theta);
                %    mpm_error = th.opts.test_set.mpm_error(theta);
                %    
                %    % TODO: If these intervals are not mod 0 on the same
                %    % intervals, object_historyVal will be out of date; broken;
                %    tset_history(end+1) = struct('iter', t, ...
                %        'object_history_val', object_history(end), ...
                %       'map_error', map_error, ...
                %        'mpm_error', mpm_error);                    
                %end
                                                
                if mod(t, th.opts.print_interval) == 0
                    % Save time by not solving all the LPs if unnecessary
                    % for the printing
                    if th.opts.print_computed_duality_gap
                        [~, duality_gap] = th.objective.solve_lp();
                    else
                        % If we don't compute a new duality gap, just grab
                        % whatever we've cached. However, it may not always
                        % exist, in which case we'll just print blank.                        
                        duality_gap = th.duality_gap;
                    end
                                   
                    fval  = th.objective.fval();   
                    relative_duality_gap = abs(duality_gap / fval);
                    
                    object_history(end+1) = struct('iter', t, ...
                        'fval', fval, ...
                        'duality_gap',  duality_gap, ...
                        'relative_duality_gap', relative_duality_gap, ...
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
        
        
        function [object_history, params_history, exit_flag] = fastrun(th)
            % fastrun  Run computations without interleaved error evaluation.
            t = 1;

            object_history = struct('iter', {}, 'fval', {}, 'duality_gap', {}, 'relative_duality_gap', {}, ...
                         'total_iter_time', {}, ...
                         'dx1', {}, ...
                         'step_size', {});
                     
            xOld = th.objective.x;            
            while t <= th.opts.max_iterations
                tic;
                step_size = th.iter(t);
                th.total_iter_time = th.total_iter_time + toc;
                
                params_history{t} = th.objective.compute_params();
                
                duality_gap = th.duality_gap;                                        
                fval  = th.objective.fval();
                relative_duality_gap = abs(duality_gap / fval);
                    
                object_history(t) = struct('iter', t, ...
                    'fval', fval, ...
                    'duality_gap',  duality_gap, ...
                    'relative_duality_gap', relative_duality_gap, ...
                    'total_iter_time', th.total_iter_time, ...
                    'dx1', norm(th.objective.x - xOld, 1), ...
                    'step_size', step_size);

                xOld = th.objective.x;                  
                if mod(t, th.opts.print_interval) == 0                                        
                    fprintf('[%s] %s', th.algo_name, sprintfStruct(object_history(end)));                                                            
                end
                
                if ~isempty(th.opts.checkpoint_file) && ...
                   ~isempty(th.opts.checkpoint_interval) && ...
                   mod(t, th.opts.checkpoint_interval) == 0               
                   % A full checkpoint is too slow to load. Just save the histories.
                    save('-v7.3', th.opts.checkpoint_file, 'object_history', 'params_history');
                end
                
                t = t + 1;
            end            
            exit_flag = 0;            
        end        
    end
    
end

