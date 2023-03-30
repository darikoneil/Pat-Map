classdef BCFW < AbstractFW
        
    methods
        function th = BCFW(objective, varargin)            
            th = th@AbstractFW(objective, varargin{:});
            th.algo_name = 'BCFW';                   
        end
        
        function step_size = iter(th, t)
            m = randi(th.objective.M);
            sm = th.objective.solve_lp_block(m);
            dm = sm - th.objective.get_x_block(m);

            backup_step_size = 2*th.objective.M / (2*th.objective.M + t);
            step_size = backup_step_size;

            if th.opts.line_search_policy(th, t)
                [step_size, converged] = th.objective.line_search_block(m, dm, 1);
                if ~converged
                    warning('BCFW:linesearchDidNotConverge', ...
                        'Linesearch did not converge; backing off to 2N / (2N + t).');
                    step_size = backup_step_size;
                end
            end
            th.objective.move_x_block(m, step_size, dm);
        end
    end
end